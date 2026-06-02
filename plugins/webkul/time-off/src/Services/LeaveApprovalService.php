<?php

namespace Webkul\TimeOff\Services;

use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Support\Collection;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\TimeOff\Enums\LeaveValidationType;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Models\Leave;

class LeaveApprovalService
{
    public function isRequester(User $user, Leave $leave): bool
    {
        if ($leave->user_id && (int) $leave->user_id === (int) $user->id) {
            return true;
        }

        $employeeUserId = $leave->employee?->user_id;

        return $employeeUserId && (int) $employeeUserId === (int) $user->id;
    }

    public function canApprove(User $user, Leave $leave): bool
    {
        if ($this->isRequester($user, $leave)) {
            return false;
        }

        $state = $this->resolveState($leave);

        if (in_array($state, [State::REFUSE, State::VALIDATE_TWO], true)) {
            return false;
        }

        return $this->approverUserIdsForCurrentStep($leave, $state)->contains((int) $user->id);
    }

    public function canRefuse(User $user, Leave $leave): bool
    {
        return $this->canApprove($user, $leave);
    }

    public function assignApprovers(Leave $leave): void
    {
        $leave->loadMissing(['employee', 'holidayStatus']);

        $employee = $leave->employee;

        if (! $employee) {
            return;
        }

        $leave->manager_id = $employee->parent_id;

        $managerEmployeeId = $employee->parent_id;

        if (! $managerEmployeeId && $employee->leave_manager_id) {
            $managerEmployeeId = Employee::query()
                ->where('user_id', $employee->leave_manager_id)
                ->value('id');
        }

        $leave->first_approver_id = $managerEmployeeId;

        if ($employee->leave_manager_id && $managerEmployeeId !== $employee->parent_id) {
            $leaveManagerEmployeeId = Employee::query()
                ->where('user_id', $employee->leave_manager_id)
                ->value('id');

            $leave->second_approver_id = $leaveManagerEmployeeId;
        }

        $validationType = $leave->holidayStatus?->leave_validation_type ?? LeaveValidationType::MANAGER;

        if ($validationType === LeaveValidationType::NO_VALIDATION) {
            $leave->state = State::VALIDATE_TWO;
        }
    }

    public function approve(Leave $leave, User $user): void
    {
        if (! $this->canApprove($user, $leave)) {
            throw new AuthorizationException('You are not allowed to approve this time off request.');
        }

        $state = $this->resolveState($leave);
        $validationType = $leave->holidayStatus?->leave_validation_type ?? LeaveValidationType::MANAGER;

        $newState = match ($validationType) {
            LeaveValidationType::BOTH => $state === State::CONFIRM
                ? State::VALIDATE_ONE
                : State::VALIDATE_TWO,
            default => State::VALIDATE_TWO,
        };

        $leave->update(['state' => $newState->value]);
    }

    public function refuse(Leave $leave, User $user): void
    {
        if (! $this->canRefuse($user, $leave)) {
            throw new AuthorizationException('You are not allowed to refuse this time off request.');
        }

        $leave->update(['state' => State::REFUSE->value]);
    }

    /**
     * @return Collection<int, int>
     */
    protected function approverUserIdsForCurrentStep(Leave $leave, State $state): Collection
    {
        $leave->loadMissing(['employee', 'holidayStatus.notifiedTimeOffOfficers']);

        $validationType = $leave->holidayStatus?->leave_validation_type ?? LeaveValidationType::MANAGER;
        $managerUserIds = $this->managerApproverUserIds($leave->employee);
        $hrUserIds = collect($leave->holidayStatus?->notifiedTimeOffOfficers ?? [])
            ->pluck('id')
            ->map(fn ($id): int => (int) $id);

        return match ($validationType) {
            LeaveValidationType::NO_VALIDATION => collect(),
            LeaveValidationType::MANAGER       => $state === State::CONFIRM ? $managerUserIds : collect(),
            LeaveValidationType::HR            => $state === State::CONFIRM ? $hrUserIds : collect(),
            LeaveValidationType::BOTH          => match ($state) {
                State::CONFIRM      => $managerUserIds,
                State::VALIDATE_ONE => $hrUserIds,
                default             => collect(),
            },
        };
    }

    /**
     * @return Collection<int, int>
     */
    protected function managerApproverUserIds(?Employee $employee): Collection
    {
        if (! $employee) {
            return collect();
        }

        $userIds = collect();

        if ($employee->leave_manager_id) {
            $userIds->push((int) $employee->leave_manager_id);
        }

        if ($employee->parent_id) {
            $parentUserId = Employee::query()
                ->whereKey($employee->parent_id)
                ->value('user_id');

            if ($parentUserId) {
                $userIds->push((int) $parentUserId);
            }
        }

        return $userIds->unique()->values();
    }

    protected function resolveState(Leave $leave): State
    {
        $state = $leave->state;

        return $state instanceof State ? $state : State::from((string) $state);
    }
}
