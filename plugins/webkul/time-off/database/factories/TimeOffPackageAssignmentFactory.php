<?php

namespace Webkul\TimeOff\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Employee\Models\Employee;
use Webkul\TimeOff\Models\TimeOffPackage;
use Webkul\TimeOff\Models\TimeOffPackageAssignment;

/**
 * @extends Factory<TimeOffPackageAssignment>
 */
class TimeOffPackageAssignmentFactory extends Factory
{
    protected $model = TimeOffPackageAssignment::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'package_id'           => TimeOffPackage::factory(),
            'employee_id'          => Employee::factory(),
            'auto_approved'        => true,
            'allocations_created'  => 0,
            'allocations_skipped'  => 0,
        ];
    }
}
