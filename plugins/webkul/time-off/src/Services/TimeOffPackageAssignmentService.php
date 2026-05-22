<?php

namespace Webkul\TimeOff\Services;

use Carbon\CarbonInterface;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Webkul\Employee\Models\Employee;
use Webkul\TimeOff\Enums\AllocationType;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Models\LeaveAllocation;
use Webkul\TimeOff\Models\TimeOffPackage;
use Webkul\TimeOff\Models\TimeOffPackageAssignment;

class TimeOffPackageAssignmentService
{
    /**
     * @param  array<int, int>  $employeeIds
     */
    public function assignToEmployees(
        TimeOffPackage $package,
        array $employeeIds,
        bool $autoApprove = true,
        ?string $notes = null,
    ): TimeOffPackageAssignmentResult {
        $package->loadMissing(['lines.leaveType']);

        if ($package->lines->isEmpty()) {
            return new TimeOffPackageAssignmentResult(
                messages: [__('time-off::services/package-assignment.no-lines')],
            );
        }

        if (! $package->is_active) {
            return new TimeOffPackageAssignmentResult(
                messages: [__('time-off::services/package-assignment.inactive-package')],
            );
        }

        $employeeIds = array_values(array_unique(array_map('intval', $employeeIds)));

        if ($employeeIds === []) {
            return new TimeOffPackageAssignmentResult(
                messages: [__('time-off::services/package-assignment.no-employees')],
            );
        }

        $state = $autoApprove ? State::VALIDATE_TWO->value : State::CONFIRM->value;
        $result = new TimeOffPackageAssignmentResult;

        DB::transaction(function () use ($package, $employeeIds, $state, $autoApprove, $notes, &$result): void {
            foreach ($employeeIds as $employeeId) {
                $employee = Employee::query()->find($employeeId);

                if ($employee === null) {
                    $result->messages[] = __('time-off::services/package-assignment.employee-not-found', [
                        'id' => $employeeId,
                    ]);

                    continue;
                }

                $assignment = TimeOffPackageAssignment::query()->create([
                    'package_id'      => $package->id,
                    'employee_id'     => $employee->id,
                    'assigned_by'     => Auth::id(),
                    'auto_approved'   => $autoApprove,
                    'notes'           => $notes,
                ]);

                $created = 0;
                $skipped = 0;

                foreach ($package->lines as $line) {
                    if ($this->hasOverlappingAllocation($employee->id, $line->leave_type_id, $package->valid_from, $package->valid_to)) {
                        $skipped++;
                        $result->messages[] = __('time-off::services/package-assignment.skipped-duplicate', [
                            'employee' => $employee->name,
                            'type'     => $line->leaveType?->name ?? $line->leave_type_id,
                        ]);

                        continue;
                    }

                    $leaveTypeName = $line->leaveType?->name ?? __('time-off::services/package-assignment.time-off');
                    $from = $package->valid_from->format('Y-m-d');
                    $to = $package->valid_to?->format('Y-m-d') ?? __('time-off::services/package-assignment.no-end');
                    $allocationName = "{$package->name} — {$leaveTypeName} ({$from} → {$to})";

                    LeaveAllocation::query()->create([
                        'holiday_status_id'     => $line->leave_type_id,
                        'employee_id'           => $employee->id,
                        'employee_company_id'   => $employee->company_id,
                        'department_id'         => $employee->department_id,
                        'manager_id'            => $employee->parent_id,
                        'package_id'            => $package->id,
                        'package_assignment_id' => $assignment->id,
                        'name'                  => $allocationName,
                        'state'                 => $state,
                        'allocation_type'       => AllocationType::REGULAR->value,
                        'date_from'             => $package->valid_from,
                        'date_to'               => $package->valid_to,
                        'number_of_days'        => $line->number_of_days,
                        'notes'                 => $notes,
                    ]);

                    $created++;
                }

                $assignment->update([
                    'allocations_created' => $created,
                    'allocations_skipped' => $skipped,
                ]);

                $result->employeesProcessed++;
                $result->allocationsCreated += $created;
                $result->allocationsSkipped += $skipped;
                $result->assignments[] = $assignment->fresh(['employee']);
            }
        });

        return $result;
    }

    /**
     * Active employees eligible for package assignment.
     *
     * @param  bool  $scopeToCompany  When true and a company is set on the package, include employees
     *                                assigned to that company and employees with no company yet.
     *                                When false, return every active employee (used for “assign all active”).
     * @return Collection<int, Employee>
     */
    public function activeEmployeesForCompany(?int $companyId = null, bool $scopeToCompany = true): Collection
    {
        $query = Employee::query()
            ->whereNull('departure_date')
            ->where(fn ($employeeQuery) => $employeeQuery
                ->where('is_active', true)
                ->orWhereNull('is_active'))
            ->orderBy('name');

        if ($scopeToCompany && $companyId !== null) {
            $query->where(function ($employeeQuery) use ($companyId): void {
                $employeeQuery
                    ->where('company_id', $companyId)
                    ->orWhereNull('company_id');
            });
        }

        return $query->get();
    }

    protected function hasOverlappingAllocation(
        int $employeeId,
        int $leaveTypeId,
        CarbonInterface $validFrom,
        ?CarbonInterface $validTo,
    ): bool {
        return LeaveAllocation::query()
            ->where('employee_id', $employeeId)
            ->where('holiday_status_id', $leaveTypeId)
            ->whereNot('state', State::REFUSE->value)
            ->where('date_from', '<=', $validTo ?? $validFrom)
            ->where(function ($query) use ($validFrom): void {
                $query->whereNull('date_to')
                    ->orWhere('date_to', '>=', $validFrom);
            })
            ->exists();
    }
}
