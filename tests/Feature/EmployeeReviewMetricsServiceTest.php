<?php

use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Employee\Models\Employee;
use Webkul\Employee\Models\EmployeeReview;
use Webkul\Employee\Services\EmployeeReviewMetricsService;
use Webkul\Project\Models\Task;
use Webkul\Project\Models\Timesheet;
use Webkul\Security\Models\User;

it('returns empty metrics when employee has no linked user', function () {
    $employee = Employee::factory()->create(['user_id' => null]);

    $metrics = app(EmployeeReviewMetricsService::class)->compute(
        $employee,
        Carbon::parse('2026-01-01')->startOfDay(),
        Carbon::parse('2026-01-31')->endOfDay()
    );

    expect($metrics['has_linked_user'])->toBeFalse()
        ->and($metrics['total_hours_logged'])->toBe(0.0);
});

it('aggregates timesheet hours for linked user in period', function () {
    $user = User::factory()->create();
    $employee = Employee::factory()->create(['user_id' => $user->id]);
    $task = Task::factory()->create();
    $task->users()->sync([$user->id]);

    Timesheet::query()->create([
        'type'        => 'projects',
        'name'        => 'Work',
        'date'        => '2026-01-15',
        'amount'      => 0,
        'unit_amount' => 3,
        'user_id'     => $user->id,
        'partner_id'  => null,
        'company_id'  => $task->company_id,
        'creator_id'  => $user->id,
        'project_id'  => $task->project_id,
        'task_id'     => $task->id,
    ]);

    $metrics = app(EmployeeReviewMetricsService::class)->compute(
        $employee,
        Carbon::parse('2026-01-01')->startOfDay(),
        Carbon::parse('2026-01-31')->endOfDay()
    );

    expect($metrics['has_linked_user'])->toBeTrue()
        ->and($metrics['total_hours_logged'])->toBe(3.0)
        ->and($metrics['timesheet_entries_count'])->toBe(1)
        ->and($metrics['distinct_tasks_with_time_count'])->toBe(1);
});

it('prevents duplicate reviews for same employee and period', function () {
    $employee = Employee::factory()->create();
    $reviewer = User::factory()->create();

    EmployeeReview::query()->create([
        'employee_id'      => $employee->id,
        'reviewer_id'      => $reviewer->id,
        'period_type'      => EmployeeReviewPeriodType::Monthly,
        'period_start'     => '2026-03-01',
        'period_end'       => '2026-03-31',
        'period_label'     => '2026-03',
        'metrics_snapshot' => [],
        'manager_rating'   => null,
        'manager_comments' => null,
        'status'           => EmployeeReviewStatus::Draft,
        'company_id'       => $employee->company_id,
    ]);

    expect(fn () => EmployeeReview::query()->create([
        'employee_id'      => $employee->id,
        'reviewer_id'      => $reviewer->id,
        'period_type'      => EmployeeReviewPeriodType::Monthly,
        'period_start'     => '2026-03-01',
        'period_end'       => '2026-03-31',
        'period_label'     => '2026-03',
        'metrics_snapshot' => [],
        'manager_rating'   => null,
        'manager_comments' => null,
        'status'           => EmployeeReviewStatus::Draft,
        'company_id'       => $employee->company_id,
    ]))->toThrow(QueryException::class);
});
