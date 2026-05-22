<?php

use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Models\LeaveAllocation;
use Webkul\TimeOff\Models\LeaveType;
use Webkul\TimeOff\Models\TimeOffPackage;
use Webkul\TimeOff\Models\TimeOffPackageLine;
use Webkul\TimeOff\Services\TimeOffPackageAssignmentService;

it('creates one allocation per package line when assigning to an employee', function (): void {
    $employee = Employee::query()->whereNull('departure_date')->first()
        ?? Employee::query()->firstOrFail();

    $companyId = $employee->company_id ?? Company::query()->value('id');

    $creatorId = User::query()->value('id');

    $leaveTypeA = LeaveType::factory()->create([
        'name'                => 'Package Test PTO '.uniqid(),
        'requires_allocation' => 'yes',
        'company_id'          => $companyId,
        'creator_id'          => $creatorId,
    ]);
    $leaveTypeB = LeaveType::factory()->create([
        'name'                => 'Package Test Sick '.uniqid(),
        'requires_allocation' => 'yes',
        'company_id'          => $companyId,
        'creator_id'          => $creatorId,
    ]);

    $package = TimeOffPackage::factory()->create([
        'company_id' => $companyId,
        'valid_from' => '2026-01-01',
        'valid_to'   => '2026-12-31',
    ]);

    TimeOffPackageLine::factory()->create([
        'package_id'      => $package->id,
        'leave_type_id'   => $leaveTypeA->id,
        'number_of_days'  => 20,
    ]);

    TimeOffPackageLine::factory()->create([
        'package_id'      => $package->id,
        'leave_type_id'   => $leaveTypeB->id,
        'number_of_days'  => 10,
    ]);

    $result = app(TimeOffPackageAssignmentService::class)->assignToEmployees(
        $package,
        [$employee->id],
        autoApprove: true,
    );

    expect($result->employeesProcessed)->toBe(1)
        ->and($result->allocationsCreated)->toBe(2)
        ->and($result->allocationsSkipped)->toBe(0);

    $allocations = LeaveAllocation::query()
        ->where('employee_id', $employee->id)
        ->where('package_id', $package->id)
        ->get();

    expect($allocations)->toHaveCount(2)
        ->and($allocations->pluck('holiday_status_id')->sort()->values()->all())
        ->toEqual(collect([$leaveTypeA->id, $leaveTypeB->id])->sort()->values()->all());

    expect($allocations->every(fn ($a) => $a->state === State::VALIDATE_TWO->value))->toBeTrue();

    expect((float) $allocations->firstWhere('holiday_status_id', $leaveTypeA->id)->number_of_days)->toBe(20.0);
});

it('skips duplicate allocations for the same employee type and period', function (): void {
    $employee = Employee::query()->whereNull('departure_date')->first()
        ?? Employee::query()->firstOrFail();

    $companyId = $employee->company_id ?? Company::query()->value('id');
    $leaveType = LeaveType::factory()->create([
        'requires_allocation' => 'yes',
        'company_id'          => $companyId,
        'creator_id'          => User::query()->value('id'),
    ]);

    $package = TimeOffPackage::factory()->create([
        'company_id' => $companyId,
        'valid_from' => '2026-01-01',
        'valid_to'   => '2026-12-31',
    ]);

    TimeOffPackageLine::factory()->create([
        'package_id'     => $package->id,
        'leave_type_id'  => $leaveType->id,
        'number_of_days' => 15,
    ]);

    LeaveAllocation::factory()->create([
        'employee_id'         => $employee->id,
        'employee_company_id' => $companyId,
        'holiday_status_id'   => $leaveType->id,
        'date_from'           => '2026-01-01',
        'date_to'             => '2026-12-31',
        'state'               => State::VALIDATE_TWO->value,
        'number_of_days'      => 15,
    ]);

    $result = app(TimeOffPackageAssignmentService::class)->assignToEmployees(
        $package,
        [$employee->id],
    );

    expect($result->allocationsCreated)->toBe(0)
        ->and($result->allocationsSkipped)->toBe(1);
});

it('assigns to all active employees when package company does not match employee company', function (): void {
    $companyId = Company::query()->value('id') ?? Company::factory()->create()->id;

    $employees = Employee::query()
        ->whereNull('departure_date')
        ->whereNull('company_id')
        ->limit(2)
        ->get();

    if ($employees->count() < 2) {
        $employees = collect([
            Employee::factory()->create(['company_id' => null, 'departure_date' => null, 'is_active' => true]),
            Employee::factory()->create(['company_id' => null, 'departure_date' => null, 'is_active' => true]),
        ]);
    }

    $leaveType = LeaveType::factory()->create([
        'requires_allocation' => 'yes',
        'company_id'          => $companyId,
        'creator_id'          => User::query()->value('id'),
    ]);

    $package = TimeOffPackage::factory()->create([
        'company_id' => $companyId,
        'valid_from' => '2026-01-01',
        'valid_to'   => '2026-12-31',
    ]);

    TimeOffPackageLine::factory()->create([
        'package_id'     => $package->id,
        'leave_type_id'  => $leaveType->id,
        'number_of_days' => 5,
    ]);

    $employeeIds = app(TimeOffPackageAssignmentService::class)
        ->activeEmployeesForCompany(scopeToCompany: false)
        ->pluck('id')
        ->all();

    expect($employeeIds)->not->toBeEmpty();

    $result = app(TimeOffPackageAssignmentService::class)->assignToEmployees(
        $package,
        $employeeIds,
    );

    expect($result->employeesProcessed)->toBeGreaterThan(0)
        ->and($result->allocationsCreated)->toBeGreaterThan(0);
});
