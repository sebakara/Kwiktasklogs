<?php

namespace Webkul\TimeOff\Database\Seeders;

use Illuminate\Database\Seeder;
use Webkul\Support\Models\Company;
use Webkul\TimeOff\Models\LeaveType;
use Webkul\TimeOff\Models\TimeOffPackage;

class TimeOffPackageSeeder extends Seeder
{
    public function run(): void
    {
        $company = Company::query()->first();

        $year = (int) now()->format('Y');

        $package = TimeOffPackage::query()->firstOrCreate(
            [
                'name'       => "Standard {$year}",
                'company_id' => $company?->id,
            ],
            [
                'description' => 'Default annual entitlement for all employees.',
                'valid_from'  => "{$year}-01-01",
                'valid_to'    => "{$year}-12-31",
                'is_active'   => true,
            ],
        );

        $lines = [
            'Paid Time Off' => 20,
            'Sick'          => 10,
        ];

        $sort = 0;

        foreach ($lines as $typeName => $days) {
            $leaveType = LeaveType::query()->where('name', $typeName)->first();

            if ($leaveType === null) {
                continue;
            }

            $package->lines()->updateOrCreate(
                ['leave_type_id' => $leaveType->id],
                [
                    'number_of_days' => $days,
                    'sort'           => $sort++,
                ],
            );
        }
    }
}
