<?php

use Illuminate\Support\Facades\Auth;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;
use Webkul\TimeOff\Enums\LeaveValidationType;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Models\Leave;
use Webkul\TimeOff\Models\LeaveType;
use Webkul\TimeOff\Services\LeaveApprovalService;

it('prevents the requester from approving their own leave', function (): void {
    $employee = Employee::query()->with('user')->whereNotNull('user_id')->first()
        ?? Employee::query()->with('user')->firstOrFail();

    $requester = $employee->user ?? User::factory()->create();

    if (! $employee->user_id) {
        $employee->forceFill(['user_id' => $requester->id])->saveQuietly();
        $employee->load('user');
    }

    $companyId = $employee->company_id ?? Company::query()->value('id');
    $creatorId = User::query()->value('id');

    $leaveType = LeaveType::factory()->create([
        'name'                  => 'Approval Test Manager '.uniqid(),
        'company_id'            => $companyId,
        'creator_id'            => $creatorId,
        'leave_validation_type' => LeaveValidationType::MANAGER->value,
    ]);

    $manager = User::factory()->create();

    $employee->forceFill(['leave_manager_id' => $manager->id])->saveQuietly();

    Auth::login($requester);

    $leave = Leave::factory()->create([
        'employee_id'         => $employee->id,
        'user_id'             => $employee->user_id,
        'holiday_status_id'   => $leaveType->id,
        'state'               => State::CONFIRM->value,
        'request_date_from'   => '2026-07-01',
        'request_date_to'     => '2026-07-02',
        'date_from'           => '2026-07-01',
        'date_to'             => '2026-07-02',
    ]);

    $service = app(LeaveApprovalService::class);

    expect($service->isRequester($requester, $leave))->toBeTrue()
        ->and($service->canApprove($requester, $leave))->toBeFalse();
});

it('allows the assigned leave manager to approve a pending request', function (): void {
    $employee = Employee::query()->whereNotNull('user_id')->first()
        ?? Employee::query()->firstOrFail();

    $manager = User::factory()->create();

    $employee->forceFill(['leave_manager_id' => $manager->id])->saveQuietly();

    $companyId = $employee->company_id ?? Company::query()->value('id');
    $creatorId = User::query()->value('id');

    $leaveType = LeaveType::factory()->create([
        'name'                  => 'Approval Test Manager Approve '.uniqid(),
        'company_id'            => $companyId,
        'creator_id'            => $creatorId,
        'leave_validation_type' => LeaveValidationType::MANAGER->value,
    ]);

    Auth::login($employee->user);

    $leave = Leave::factory()->create([
        'employee_id'         => $employee->id,
        'user_id'             => $employee->user_id,
        'holiday_status_id'   => $leaveType->id,
        'state'               => State::CONFIRM->value,
        'request_date_from'   => '2026-07-01',
        'request_date_to'     => '2026-07-02',
        'date_from'           => '2026-07-01',
        'date_to'             => '2026-07-02',
    ]);

    $service = app(LeaveApprovalService::class);

    expect($service->canApprove($manager, $leave))->toBeTrue();

    $service->approve($leave, $manager);

    expect($leave->fresh()->state)->toBe(State::VALIDATE_TWO);
});

it('requires hr officers for the second approval step when validation is both', function (): void {
    $employee = Employee::query()->whereNotNull('user_id')->first()
        ?? Employee::query()->firstOrFail();

    $manager = User::factory()->create();
    $hrOfficer = User::factory()->create();

    $employee->forceFill(['leave_manager_id' => $manager->id])->saveQuietly();

    $companyId = $employee->company_id ?? Company::query()->value('id');
    $creatorId = User::query()->value('id');

    $leaveType = LeaveType::factory()->create([
        'name'                  => 'Approval Test Both '.uniqid(),
        'company_id'            => $companyId,
        'creator_id'            => $creatorId,
        'leave_validation_type' => LeaveValidationType::BOTH->value,
    ]);

    $leaveType->notifiedTimeOffOfficers()->sync([$hrOfficer->id]);

    Auth::login($employee->user);

    $leave = Leave::factory()->create([
        'employee_id'       => $employee->id,
        'user_id'           => $employee->user_id,
        'holiday_status_id' => $leaveType->id,
        'state'             => State::VALIDATE_ONE->value,
    ]);

    $service = app(LeaveApprovalService::class);

    expect($service->canApprove($manager, $leave))->toBeFalse()
        ->and($service->canApprove($hrOfficer, $leave))->toBeTrue();
});
