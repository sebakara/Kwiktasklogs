<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Throwable;

class PurgeAllEmployeesCommand extends Command
{
    protected $signature = 'employees:purge-all
                            {--force : Run without interactive confirmation}';

    protected $description = 'Delete every row in employees_employees and clear or remove dependent records (for local / QA resets)';

    public function handle(): int
    {
        if (! Schema::hasTable('employees_employees')) {
            $this->warn('Table employees_employees does not exist; nothing to do.');

            return Command::SUCCESS;
        }

        if (! $this->option('force')) {
            $confirmed = app()->runningUnitTests()
                ? true
                : $this->confirm('This deletes all employee records and related links. Continue?');

            if (! $confirmed) {
                return Command::INVALID;
            }
        }

        $ids = DB::table('employees_employees')->pluck('id')->map(fn ($id): int => (int) $id)->all();

        if ($ids === []) {
            $this->info('There are no employee rows to delete.');

            return Command::SUCCESS;
        }

        sort($ids);
        $this->warn(sprintf('Removing %d employee record(s).', count($ids)));

        try {
            DB::statement('SET FOREIGN_KEY_CHECKS=0');

            DB::table('employees_employees')->whereIn('parent_id', $ids)->update(['parent_id' => null]);
            DB::table('employees_employees')->whereIn('coach_id', $ids)->update(['coach_id' => null]);

            foreach ($this->foreignKeysPointingAtEmployeesTable() as $row) {
                $table = $row->TABLE_NAME;
                $column = $row->COLUMN_NAME;

                if ($table === 'employees_employees') {
                    continue;
                }

                $nullable = $row->IS_NULLABLE === 'YES';

                try {
                    if ($nullable) {
                        DB::table($table)->whereIn($column, $ids)->update([$column => null]);
                    } else {
                        DB::table($table)->whereIn($column, $ids)->delete();
                    }
                } catch (Throwable) {
                    try {
                        DB::table($table)->whereIn($column, $ids)->delete();
                    } catch (Throwable $fallback) {
                        $this->warn(sprintf('Skipping %s.%s (%s)', $table, $column, $fallback->getMessage()));
                    }
                }
            }

            foreach ($this->nameOnlyEmployeeRelations() as [$tableName, $columnName]) {
                if (! Schema::hasTable($tableName)) {
                    continue;
                }

                try {
                    DB::table($tableName)->whereIn($columnName, $ids)->delete();
                } catch (Throwable) {
                    //
                }
            }

            DB::table('employees_employees')->delete();

            DB::statement('SET FOREIGN_KEY_CHECKS=1');
        } catch (Throwable $e) {
            try {
                DB::statement('SET FOREIGN_KEY_CHECKS=1');
            } catch (Throwable) {
                //
            }
            DB::purge();
            $this->error($e->getMessage());

            return Command::FAILURE;
        } finally {
            DB::purge();
        }

        Artisan::call('optimize:clear');

        $this->info('All employee records have been deleted.');

        return Command::SUCCESS;
    }

    /**
     * @return list<object{TABLE_NAME: string, COLUMN_NAME: string, IS_NULLABLE: string}>
     */
    private function foreignKeysPointingAtEmployeesTable(): array
    {
        $schema = Schema::getConnection()->getDatabaseName();

        /** @var list<object{TABLE_NAME: string, COLUMN_NAME: string, IS_NULLABLE: string}> */
        return DB::select(
            'SELECT k.TABLE_NAME, k.COLUMN_NAME, c.IS_NULLABLE
             FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE k
             INNER JOIN INFORMATION_SCHEMA.COLUMNS c
               ON c.TABLE_SCHEMA = k.TABLE_SCHEMA
              AND c.TABLE_NAME = k.TABLE_NAME
              AND c.COLUMN_NAME = k.COLUMN_NAME
             WHERE k.TABLE_SCHEMA = ?
               AND k.REFERENCED_TABLE_NAME = ?
               AND k.REFERENCED_COLUMN_NAME = ?',
            [$schema, 'employees_employees', 'id']
        );
    }

    /**
     * Extra pivot / child tables that may exist without FK metadata in older installs.
     *
     * @return list<array{0: string, 1: string}>
     */
    private function nameOnlyEmployeeRelations(): array
    {
        return [
            ['employees_employee_categories', 'employee_id'],
            ['employees_employee_documents', 'employee_id'],
            ['employees_employee_skills', 'employee_id'],
            ['employees_employee_resumes', 'employee_id'],
            ['employees_reviews', 'employee_id'],
        ];
    }
}
