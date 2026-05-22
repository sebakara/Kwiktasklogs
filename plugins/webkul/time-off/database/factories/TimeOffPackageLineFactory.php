<?php

namespace Webkul\TimeOff\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\TimeOff\Models\LeaveType;
use Webkul\TimeOff\Models\TimeOffPackage;
use Webkul\TimeOff\Models\TimeOffPackageLine;

/**
 * @extends Factory<TimeOffPackageLine>
 */
class TimeOffPackageLineFactory extends Factory
{
    protected $model = TimeOffPackageLine::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'package_id'      => TimeOffPackage::factory(),
            'leave_type_id'   => LeaveType::factory(),
            'number_of_days'  => fake()->randomElement([5, 10, 15, 20]),
            'sort'            => 0,
        ];
    }
}
