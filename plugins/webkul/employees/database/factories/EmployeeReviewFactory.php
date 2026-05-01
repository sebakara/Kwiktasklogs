<?php

namespace Webkul\Employee\Database\Factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Employee\Models\Employee;
use Webkul\Employee\Models\EmployeeReview;
use Webkul\Security\Models\User;

/**
 * @extends Factory<EmployeeReview>
 */
class EmployeeReviewFactory extends Factory
{
    protected $model = EmployeeReview::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $start = Carbon::parse(fake()->dateTimeBetween('-1 year', 'now'))->startOfMonth();
        $end = $start->copy()->endOfMonth();

        return [
            'employee_id' => Employee::factory(),
            'reviewer_id' => User::factory(),
            'period_type' => EmployeeReviewPeriodType::Monthly,
            'period_start' => $start->toDateString(),
            'period_end' => $end->toDateString(),
            'period_label' => $start->format('Y-m'),
            'metrics_snapshot' => [],
            'manager_rating' => fake()->randomFloat(2, 1, 5),
            'manager_comments' => fake()->sentence(),
            'status' => EmployeeReviewStatus::Draft,
            'company_id' => null,
        ];
    }
}
