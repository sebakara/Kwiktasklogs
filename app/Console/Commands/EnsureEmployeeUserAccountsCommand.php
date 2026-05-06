<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Webkul\Employee\Models\Employee;

class EnsureEmployeeUserAccountsCommand extends Command
{
    protected $signature = 'employees:ensure-user-accounts {--inactive : Include inactive employees}';

    protected $description = 'Create Laravel user accounts (and linked partner rows) for employees that can sign in';

    public function handle(): int
    {
        $query = Employee::query()->whereNull('user_id');

        if (! $this->option('inactive')) {
            $query->where('is_active', true);
        }

        $total = $query->count();

        if ($total === 0) {
            $this->info('Every employee already has a linked user account.');

            return self::SUCCESS;
        }

        $this->comment('Tip: passwords are generated automatically; use password reset / invitation mails for employees with real work emails.');
        $bar = $this->output->createProgressBar($total);
        $bar->start();

        foreach ($query->lazyById(100) as $employee) {
            try {
                $employee->synchronizeHrRecords();
                $bar->advance();
            } catch (\Throwable $throwable) {
                $bar->finish();
                $this->newLine(2);
                $this->error(sprintf('Employee ID %s (%s): %s', $employee->id, $employee->name ?? 'unknown', $throwable->getMessage()));

                return self::FAILURE;
            }
        }

        $bar->finish();
        $this->newLine(2);
        $this->info(sprintf('Provisioned user accounts for %d employee(s).', $total));

        return self::SUCCESS;
    }
}
