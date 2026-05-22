<?php

namespace Webkul\TimeOff\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Support\Models\Company;
use Webkul\TimeOff\Models\TimeOffPackage;

/**
 * @extends Factory<TimeOffPackage>
 */
class TimeOffPackageFactory extends Factory
{
    protected $model = TimeOffPackage::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $year = (int) now()->format('Y');

        return [
            'company_id'  => Company::query()->value('id'),
            'name'        => "Standard {$year}",
            'description' => fake()->optional()->sentence(),
            'valid_from'  => "{$year}-01-01",
            'valid_to'    => "{$year}-12-31",
            'is_active'   => true,
        ];
    }
}
