<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Spatie\Permission\PermissionRegistrar;
use Throwable;
use Webkul\Security\Models\User;

class PurgeUsersExceptAdminCommand extends Command
{
    protected $signature = 'users:purge-except-admin
                            {--email=admin@example.com : Email of the sole user account to keep (case-insensitive)}
                            {--force : Run without interactive confirmation (required for scripts/security)}
                            {--with-employees : Also delete all employees via employees:purge-all}';

    protected $description = 'Permanently remove all users except the account matching --email (defaults to admin@example.com), remap or clear FK references, optionally purge all employees, refresh caches';

    public function handle(): int
    {
        if (! $this->option('force')) {
            $confirmed = app()->runningUnitTests()
                ? true
                : $this->confirm('This permanently deletes all other user accounts and resets related references. Continue?');

            if (! $confirmed) {
                return Command::INVALID;
            }
        }

        $keepOriginal = trim((string) $this->option('email'));
        $keepEmail = mb_strtolower($keepOriginal);

        if ($keepEmail === '' || filter_var($keepEmail, FILTER_VALIDATE_EMAIL) === false) {
            $this->error('Provide a valid --email.');

            return Command::INVALID;
        }

        $keeper = User::withTrashed()
            ->whereRaw('LOWER(email) = ?', [$keepEmail])
            ->first();

        if (! $keeper instanceof User) {
            $this->error("No user exists with email [{$keepOriginal}].");

            return Command::FAILURE;
        }

        if ($keeper->trashed()) {
            $keeper->restore();
            $this->warn('Keeper account was soft-deleted; it has been restored.');
        }

        if (! $keeper->is_active) {
            $keeper->forceFill(['is_active' => true])->saveQuietly();
        }

        $withEmployees = (bool) $this->option('with-employees');

        $idsToRemove = User::withTrashed()
            ->whereKeyNot($keeper->getKey())
            ->pluck('id')
            ->map(fn ($id): int => (int) $id)
            ->sort()
            ->values()
            ->all();

        $idsToRemove = array_values(array_diff($idsToRemove, User::protectedAccountIds()));

        if ($idsToRemove === [] && ! $withEmployees) {
            $this->info('No extra users found. Pass --with-employees to remove all employee records too.');

            return Command::SUCCESS;
        }

        $adminId = (int) $keeper->getKey();

        if ($idsToRemove !== []) {
            $this->warn(sprintf('Deleting %d user(s); keeping #%d [%s]', count($idsToRemove), $adminId, $keeper->email));

            try {
                DB::statement('SET FOREIGN_KEY_CHECKS=0');

                $this->purgeSpatieAssignments($idsToRemove);
                $this->purgeSessionAndInvitationRows($idsToRemove);
                $this->purgeChatterAndMessaging($idsToRemove);
                $this->purgePivotsAndDocuments($adminId, $idsToRemove);
                $this->remapOrDeleteForeignKeys($adminId, $idsToRemove);

                foreach (User::withTrashed()->whereIn('id', $idsToRemove)->lazy() as $user) {
                    $user->forceDelete();
                }

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

            app()[PermissionRegistrar::class]->forgetCachedPermissions();
        }

        if ($withEmployees) {
            $exitCode = $this->call('employees:purge-all', [
                '--force' => true,
            ]);

            if ($exitCode !== Command::SUCCESS) {
                return $exitCode;
            }
        }

        Artisan::call('optimize:clear');

        $this->info(sprintf('Done. Sign in as %s', $keeper->email));

        return Command::SUCCESS;
    }

    /**
     * @param  array<int>  $idsToRemove
     */
    private function purgeSpatieAssignments(array $idsToRemove): void
    {
        $types = collect([
            User::class,
            'App\Models\User',
        ])
            ->filter()
            ->unique()
            ->values()
            ->all();

        $rolesTable = config('permission.table_names.model_has_roles');

        if (is_string($rolesTable) && Schema::hasTable($rolesTable) && $types !== []) {
            DB::table($rolesTable)
                ->whereIn('model_type', $types)
                ->whereIn('model_id', $idsToRemove)
                ->delete();
        }

        $permissionsTable = config('permission.table_names.model_has_permissions');

        if (is_string($permissionsTable) && Schema::hasTable($permissionsTable) && $types !== []) {
            DB::table($permissionsTable)
                ->whereIn('model_type', $types)
                ->whereIn('model_id', $idsToRemove)
                ->delete();
        }
    }

    /**
     * @param  array<int>  $idsToRemove
     */
    private function purgeSessionAndInvitationRows(array $idsToRemove): void
    {
        if (Schema::hasTable('sessions')) {
            DB::table('sessions')->whereIn('user_id', $idsToRemove)->delete();
        }

        foreach (
            User::withTrashed()
                ->whereIn('id', $idsToRemove)
                ->pluck('email') as $email
        ) {
            if (Schema::hasTable('invitations')) {
                DB::table('invitations')->where('email', $email)->delete();
            }

            if (Schema::hasTable('password_reset_tokens')) {
                DB::table('password_reset_tokens')->where('email', $email)->delete();
            }
        }
    }

    /**
     * @param  array<int>  $idsToRemove
     */
    private function purgeChatterAndMessaging(array $idsToRemove): void
    {
        if (Schema::hasTable('chatter_attachments')) {
            DB::table('chatter_attachments')->whereIn('creator_id', $idsToRemove)->delete();
        }

        if (Schema::hasTable('chatter_messages')) {
            DB::table('chatter_messages')
                ->whereIn('assigned_to', $idsToRemove)
                ->update(['assigned_to' => null]);

            $morphTypes = collect([
                User::class,
            ])
                ->merge(
                    DB::table('chatter_messages')
                        ->select('causer_type')
                        ->whereNotNull('causer_type')
                        ->distinct()
                        ->where('causer_type', 'LIKE', '%User%')
                        ->pluck('causer_type')
                        ->filter()
                        ->take(40)
                        ->values()
                        ->all()
                )
                ->unique()
                ->values()
                ->all();

            foreach ($morphTypes as $modelType) {
                DB::table('chatter_messages')
                    ->where('causer_type', $modelType)
                    ->whereIn('causer_id', $idsToRemove)
                    ->delete();
            }
        }

        if (Schema::hasTable('employees_chat_messages')) {
            DB::table('employees_chat_messages')
                ->where(function ($q) use ($idsToRemove): void {
                    $q->whereIn('sender_id', $idsToRemove)
                        ->orWhereIn('recipient_id', $idsToRemove);
                })
                ->delete();
        }

        if (Schema::hasTable('audit_logs')) {
            DB::table('audit_logs')->whereIn('user_id', $idsToRemove)->delete();
        }
    }

    /**
     * @param  array<int>  $idsToRemove
     */
    private function purgePivotsAndDocuments(int $adminId, array $idsToRemove): void
    {
        foreach (['user_allowed_companies', 'user_team'] as $table) {
            if (Schema::hasTable($table)) {
                DB::table($table)->whereIn('user_id', $idsToRemove)->delete();
            }
        }

        foreach (['document_user', 'projects_task_users'] as $table) {
            if (Schema::hasTable($table)) {
                DB::table($table)->whereIn('user_id', $idsToRemove)->delete();
            }
        }

        foreach (['exports', 'imports', 'table_views', 'table_view_favorites'] as $table) {
            if (Schema::hasTable($table)) {
                DB::table($table)->whereIn('user_id', $idsToRemove)->delete();
            }
        }

        if (Schema::hasTable('documents')) {
            DB::table('documents')
                ->whereIn('uploaded_by_user_id', $idsToRemove)
                ->update(['uploaded_by_user_id' => $adminId]);
        }
    }

    /**
     * @param  array<int>  $idsToRemove
     */
    private function remapOrDeleteForeignKeys(int $adminId, array $idsToRemove): void
    {
        $schema = Schema::getConnection()->getDatabaseName();

        /** @var list<object{TABLE_NAME: string, COLUMN_NAME: string, IS_NULLABLE: string}> $rows */
        $rows = DB::select(
            'SELECT k.TABLE_NAME, k.COLUMN_NAME, c.IS_NULLABLE
             FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE k
             INNER JOIN INFORMATION_SCHEMA.COLUMNS c
               ON c.TABLE_SCHEMA = k.TABLE_SCHEMA
              AND c.TABLE_NAME = k.TABLE_NAME
              AND c.COLUMN_NAME = k.COLUMN_NAME
             WHERE k.TABLE_SCHEMA = ?
               AND k.REFERENCED_TABLE_NAME = ?
               AND k.REFERENCED_COLUMN_NAME = ?',
            [$schema, 'users', 'id']
        );

        foreach ($rows as $row) {
            $table = $row->TABLE_NAME;
            $column = $row->COLUMN_NAME;
            $nullable = $row->IS_NULLABLE === 'YES';

            if ($table === 'users' && $column === 'id') {
                continue;
            }

            if (in_array($table, ['password_reset_tokens'], true)) {
                continue;
            }

            try {
                if ($nullable) {
                    DB::table($table)->whereIn($column, $idsToRemove)->update([$column => null]);
                } elseif ($column === 'creator_id' || str_ends_with((string) $column, '_creator_id')) {
                    DB::table($table)->whereIn($column, $idsToRemove)->update([$column => $adminId]);
                } else {
                    DB::table($table)->whereIn($column, $idsToRemove)->update([$column => $adminId]);
                }
            } catch (Throwable) {
                try {
                    if ($nullable) {
                        DB::table($table)->whereIn($column, $idsToRemove)->update([$column => null]);
                    } elseif ($column === 'creator_id' || str_ends_with((string) $column, '_creator_id')) {
                        DB::table($table)->whereIn($column, $idsToRemove)->update([$column => $adminId]);
                    } else {
                        DB::table($table)->whereIn($column, $idsToRemove)->delete();
                    }
                } catch (Throwable $fallback) {
                    $this->warn(sprintf('Could not remap %s.%s: %s', $table, $column, $fallback->getMessage()));
                }
            }
        }

        foreach (['employees_employees' => ['leave_manager_id', 'attendance_manager_id']] as $tbl => $cols) {
            if (! Schema::hasTable($tbl)) {
                continue;
            }
            foreach ($cols as $managerColumn) {
                try {
                    DB::table($tbl)->whereIn($managerColumn, $idsToRemove)->update([$managerColumn => null]);
                } catch (Throwable) {
                    //
                }
            }
        }

        try {
            DB::table('users')
                ->whereIn('id', [$adminId])
                ->whereNotNull('creator_id')
                ->whereIn('creator_id', $idsToRemove)
                ->update(['creator_id' => $adminId]);

            DB::table('users')
                ->whereIn('creator_id', $idsToRemove)
                ->update(['creator_id' => null]);
        } catch (Throwable) {
            //
        }
    }
}
