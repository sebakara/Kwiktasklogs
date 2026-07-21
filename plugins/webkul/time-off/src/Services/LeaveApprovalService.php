<?php

namespace Webkul\TimeOff\Services;

use Filament\Notifications\Notification;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\Support\Mail\PayloadEnvelope;
use Webkul\TimeOff\Enums\LeaveValidationType;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Filament\Clusters\Management\Resources\TimeOffResource;
use Webkul\TimeOff\Filament\Clusters\MyTime\Resources\MyTimeOffResource;
use Webkul\TimeOff\Mail\TimeOffRequestMail;
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

        // Prefer the dedicated time off approver; fall back to direct manager
        if ($employee->leave_manager_id) {
            $approverEmployeeId = Employee::query()
                ->where('user_id', $employee->leave_manager_id)
                ->value('id');
        } else {
            $approverEmployeeId = $employee->parent_id;
        }

        $leave->first_approver_id = $approverEmployeeId;

        $validationType = $leave->holidayStatus?->leave_validation_type ?? LeaveValidationType::MANAGER;

        if ($validationType === LeaveValidationType::NO_VALIDATION) {
            $leave->state = State::VALIDATE_TWO;
        }
    }

    public function notifyOnSubmit(Leave $leave): void
    {
        $leave->loadMissing(['employee', 'holidayStatus.notifiedTimeOffOfficers']);

        $employeeName = $leave->employee?->name ?? 'An employee';
        $leaveType = $leave->holidayStatus?->name ?? 'Time Off';
        $from = $leave->request_date_from ? $leave->request_date_from->format('M d, Y') : '—';
        $to = $leave->request_date_to ? \Carbon\Carbon::parse($leave->request_date_to)->format('M d, Y') : $from;
        $duration = $leave->duration_display ?? '—';
        $description = $leave->private_name ?? '';

        $notification = Notification::make()
            ->title("{$employeeName} requested time off")
            ->body("{$leaveType} · {$from} to {$to}")
            ->warning();

        $recipients = $this->managerApproverUserIds($leave->employee)
            ->merge(
                collect($leave->holidayStatus?->notifiedTimeOffOfficers ?? [])->pluck('id')->map(fn ($id) => (int) $id)
            )
            ->unique()
            ->map(fn (int $id) => User::find($id))
            ->filter();

        foreach ($recipients as $recipient) {
            $notification->sendToDatabase($recipient);

            if (blank($recipient->email)) {
                continue;
            }

            $payload = [
                'subject'       => "Time Off Request: {$employeeName}",
                'employee_name' => $employeeName,
                'leave_type'    => $leaveType,
                'date_from'     => $from,
                'date_to'       => $to,
                'duration'      => $duration,
                'description'   => $description,
                'record_url'    => TimeOffResource::getUrl('view', ['record' => $leave], isAbsolute: true),
                'to' => [
                    'address' => $recipient->email,
                    'name'    => $recipient->name,
                ],
                'from' => [
                    'address' => config('mail.from.address'),
                    'name'    => config('mail.from.name'),
                ],
            ];

            if (Auth::check() && Auth::user()?->defaultCompany) {
                $payload['from']['company'] = Auth::user()->defaultCompany->toArray();
            }

            Mail::to($recipient->email, $recipient->name)
                ->send(new TimeOffRequestMail('time-off::mails.time-off-request', $payload));
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

        $this->notifyOnApproval($leave);
    }

    public function refuse(Leave $leave, User $user): void
    {
        if (! $this->canRefuse($user, $leave)) {
            throw new AuthorizationException('You are not allowed to refuse this time off request.');
        }

        $leave->update(['state' => State::REFUSE->value]);
    }

    protected function notifyOnApproval(Leave $leave): void
    {
        $leave->loadMissing(['employee.user', 'holidayStatus.notifiedTimeOffOfficers']);

        $leaveType = $leave->holidayStatus?->name ?? 'Time Off';
        $from = $leave->request_date_from ? $leave->request_date_from->format('M d, Y') : '—';
        $to = $leave->request_date_to ? \Carbon\Carbon::parse($leave->request_date_to)->format('M d, Y') : $from;
        $duration = $leave->duration_display ?? '—';
        $employeeName = $leave->employee?->name ?? 'Employee';

        $employeeUser = $leave->employee?->user;

        // In-app + email notification to the employee
        if ($employeeUser) {
            Notification::make()
                ->title('Your time off request has been approved')
                ->body("{$leaveType} · {$from} to {$to}")
                ->success()
                ->sendToDatabase($employeeUser);

            if (! blank($employeeUser->email)) {
                $payload = [
                    'subject'   => 'Your Time Off Has Been Approved',
                    'leave_type' => $leaveType,
                    'date_from'  => $from,
                    'date_to'    => $to,
                    'duration'   => $duration,
                    'record_url' => MyTimeOffResource::getUrl('view', ['record' => $leave], isAbsolute: true),
                    'to' => [
                        'address' => $employeeUser->email,
                        'name'    => $employeeUser->name,
                    ],
                    'from' => [
                        'address' => config('mail.from.address'),
                        'name'    => config('mail.from.name'),
                    ],
                ];

                if (Auth::check() && Auth::user()?->defaultCompany) {
                    $payload['from']['company'] = Auth::user()->defaultCompany->toArray();
                }

                Mail::to($employeeUser->email, $employeeUser->name)
                    ->send(new TimeOffRequestMail('time-off::mails.time-off-approved', $payload));
            }
        }

        // In-app notification to HR officers
        $hrNotification = Notification::make()
            ->title("{$employeeName}'s time off has been approved")
            ->body("{$leaveType} · {$from} to {$to}")
            ->success();

        foreach ($leave->holidayStatus?->notifiedTimeOffOfficers ?? [] as $officer) {
            $hrNotification->sendToDatabase($officer);
        }
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

        // Use the dedicated time off approver if set, otherwise fall back to direct manager
        if ($employee->leave_manager_id) {
            return collect([(int) $employee->leave_manager_id]);
        }

        if ($employee->parent_id) {
            $parentUserId = Employee::query()
                ->whereKey($employee->parent_id)
                ->value('user_id');

            if ($parentUserId) {
                return collect([(int) $parentUserId]);
            }
        }

        return collect();
    }

    protected function resolveState(Leave $leave): State
    {
        $state = $leave->state;

        return $state instanceof State ? $state : State::from((string) $state);
    }
}
