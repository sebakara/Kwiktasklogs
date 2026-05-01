<?php

namespace Webkul\TimeOff\Traits;

use Carbon\Carbon;
use Filament\Actions\Action;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Notifications\Notification;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
use Illuminate\Support\Facades\Auth;
use Webkul\Employee\Models\Employee;
use Webkul\TimeOff\Enums\RequestDateFromPeriod;
use Webkul\TimeOff\Enums\State;
use Webkul\TimeOff\Models\Leave;
use Webkul\TimeOff\Models\LeaveAllocation;
use Webkul\TimeOff\Models\LeaveType;

trait TimeOffHelper
{
    public function mutateTimeOffData(array $data, ?int $excludeRecordId = null, ?Action $action = null): array
    {
        $this->updateEmployeeAndCompanyData($data);

        $this->calculateBusinessDaysAndNumbers($data);

        $this->handleLeaveOverlap($data, $excludeRecordId, $action);

        $this->handleLeaveAllocation($data, $action);

        $data['state'] = State::CONFIRM->value;
        $data['date_from'] = $data['request_date_from'] ?? null;
        $data['date_to'] = $data['request_date_to'] ?? null;

        return $data;
    }

    public function getFormSchema($isVisible = null): array
    {
        return [
            Section::make()
                ->schema([
                    Select::make('employee_id')
                        ->relationship('employee', 'name')
                        ->searchable()
                        ->preload()
                        ->live()
                        ->afterStateUpdated(function (Set $set, $state): void {
                            $employee = $state ? Employee::query()->with('department')->find($state) : null;
                            $set('department_id', $employee?->department?->id);
                        })
                        ->visible((bool) ($isVisible ?? false))
                        ->label(__('time-off::filament/clusters/management/resources/time-off.form.fields.employee-name'))
                        ->required(),
                    Select::make('department_id')
                        ->options(function (Get $get): array {
                            $employeeId = $get('employee_id');

                            if (! $employeeId) {
                                return [];
                            }

                            $employee = Employee::query()->with('department')->find($employeeId);

                            if (! $employee?->department) {
                                return [];
                            }

                            return [$employee->department->id => $employee->department->name];
                        })
                        ->label(__('time-off::filament/clusters/management/resources/time-off.form.fields.department-name'))
                        ->searchable()
                        ->visible((bool) ($isVisible ?? false))
                        ->preload()
                        ->disabled(fn (Get $get): bool => blank($get('employee_id')))
                        ->required(),

                    Select::make('holiday_status_id')
                        ->label(__('time-off::filament/widgets/calendar-widget.form.fields.time-off-type'))
                        ->relationship('holidayStatus', 'name')
                        ->required()
                        ->live()
                        ->columnSpanFull()
                        ->placeholder(__('time-off::filament/widgets/calendar-widget.form.fields.time-off-type-placeholder'))
                        ->helperText(__('time-off::filament/widgets/calendar-widget.form.fields.time-off-type-helper')),
                    Placeholder::make('leave_balance')
                        ->label('Leave Balance')
                        ->content(function (Get $get): string {
                            $employeeId = $get('employee_id') ?: Auth::user()?->employee?->id;
                            $leaveTypeId = $get('holiday_status_id');

                            if (! $employeeId || ! $leaveTypeId) {
                                return 'Select an employee and time off type to view balance.';
                            }

                            $balance = $this->getAvailableLeaveBalance((int) $employeeId, (int) $leaveTypeId);

                            if (! $balance['requires_allocation']) {
                                return 'This leave type does not require allocation.';
                            }

                            $requestedDays = $this->getRequestedDaysFromFormState($get);
                            $remainingAfterRequest = round($balance['available'] - $requestedDays, 1);

                            return "Allocated: {$balance['allocated']} days | Taken: {$balance['taken']} days | Available: {$balance['available']} days | Requested: {$requestedDays} days | Remaining after request: {$remainingAfterRequest} days";
                        }),
                    Placeholder::make('requested_days_preview')
                        ->label('Requested Leave')
                        ->content(function (Get $get): string {
                            $requestedDays = $this->getRequestedDaysFromFormState($get);

                            return "You are requesting {$requestedDays} day(s).";
                        }),

                    Grid::make(2)
                        ->schema([
                            DatePicker::make('request_date_from')
                                ->native(false)
                                ->label(__('time-off::filament/widgets/calendar-widget.form.fields.request-date-from'))
                                ->required()
                                ->live()
                                ->prefixIcon('heroicon-o-calendar'),

                            DatePicker::make('request_date_to')
                                ->native(false)
                                ->label('To Date')
                                ->live()
                                ->prefixIcon('heroicon-o-calendar'),
                        ]),

                    Grid::make(2)
                        ->schema([
                            Toggle::make('request_unit_half')
                                ->label(__('time-off::filament/widgets/calendar-widget.form.fields.half-day'))
                                ->live()
                                ->helperText(__('time-off::filament/widgets/calendar-widget.form.fields.half-day-helper')),

                            Select::make('request_date_from_period')
                                ->label(__('time-off::filament/widgets/calendar-widget.form.fields.period'))
                                ->options(RequestDateFromPeriod::class)
                                ->default(RequestDateFromPeriod::MORNING)
                                ->native(false)
                                ->prefixIcon('heroicon-o-sun'),
                        ]),

                    Textarea::make('private_name')
                        ->label(__('time-off::filament/widgets/calendar-widget.form.fields.description'))
                        ->placeholder(__('time-off::filament/widgets/calendar-widget.form.fields.description-placeholder'))
                        ->rows(3)
                        ->columnSpanFull()
                        ->helperText(__('time-off::filament/widgets/calendar-widget.form.fields.description-helper')),
                ])->columnSpanFull(),
        ];
    }

    public function getDurationInfo(array $data): array
    {
        if (! empty($data['request_unit_half'])) {
            return [
                'duration_display' => '0.5 day',
                'number_of_days'   => 0.5,
                'business_days'    => 0.5,
                'total_days'       => 0.5,
                'weekend_days'     => 0,
            ];
        }

        $startDate = Carbon::parse($data['request_date_from']);
        $endDate = ! empty($data['request_date_to'])
            ? Carbon::parse($data['request_date_to'])
            : $startDate;

        $businessDays = $this->calculateBusinessDays($startDate, $endDate);
        $totalDays = $this->calculateTotalDays($startDate, $endDate);
        $weekendDays = $totalDays - $businessDays;

        $durationDisplay = $businessDays.' working day'.($businessDays !== 1 ? 's' : '');

        if ($weekendDays > 0) {
            $durationDisplay .= ' (+ '.$weekendDays.' weekend day'.($weekendDays !== 1 ? 's' : '').')';
        }

        return [
            'duration_display' => $durationDisplay,
            'number_of_days'   => $businessDays,
            'business_days'    => $businessDays,
            'total_days'       => $totalDays,
            'weekend_days'     => $weekendDays,
        ];
    }

    private function handleLeaveOverlap(array &$data, ?int $excludeRecordId = null, ?Action $action = null): void
    {
        $employee = Employee::find($data['employee_id']);

        if (! $employee) {
            Notification::make()
                ->danger()
                ->title(__('time-off::filament/widgets/overview-calendar-widget.header-actions.create.employee-not-found.notification.title'))
                ->body(__('time-off::filament/widgets/overview-calendar-widget.header-actions.create.employee-not-found.notification.body'))
                ->send();

            if ($action) {
                $action->halt();
            } else {
                $this->halt();
            }

            return;
        }

        $overlap = $this->checkForOverlappingLeave(
            $employee->id,
            $data['request_date_from'],
            $data['request_date_to'] ?? $data['request_date_from'],
            $excludeRecordId
        );

        if ($overlap) {
            Notification::make()
                ->danger()
                ->title(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.overlap.title'))
                ->body(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.overlap.body'))
                ->send();

            if ($action) {
                $action->halt();
            } else {
                $this->halt();
            }
        }
    }

    private function handleLeaveAllocation(array &$data, ?Action $action = null): void
    {
        $employee = Employee::find($data['employee_id']);

        if (! $employee) {
            return;
        }

        $leaveTypeId = $data['holiday_status_id'] ?? null;

        if (! $leaveTypeId) {
            return;
        }

        $leaveType = LeaveType::find($leaveTypeId);

        if (! $leaveType || ! $leaveType->requires_allocation) {
            return;
        }

        $requestedDays = $data['number_of_days'];
        $balance = $this->getAvailableLeaveBalance($employee->id, (int) $leaveTypeId);
        $totalAllocated = $balance['allocated'];
        $availableBalance = $balance['available'];

        if ($totalAllocated <= 0) {
            Notification::make()
                ->danger()
                ->title(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.leave_request_denied_no_allocation.title'))
                ->body(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.leave_request_denied_no_allocation.body', ['leaveType' => $leaveType->name]))
                ->send();

            if ($action) {
                $action->halt();
            } else {
                $this->halt();
            }
        }

        if ($requestedDays > $availableBalance) {
            Notification::make()
                ->danger()
                ->title(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.leave_request_denied_insufficient_balance.title'))
                ->body(__('time-off::filament/clusters/my-time/resources/my-time-off/pages/create-time-off.notification.leave_request_denied_insufficient_balance.body', [
                    'available_balance' => $availableBalance,
                    'requested_days'    => $requestedDays,
                ]))
                ->send();

            if ($action) {
                $action->halt();
            } else {
                $this->halt();
            }
        }
    }

    private function getAvailableLeaveBalance(int $employeeId, int $leaveTypeId): array
    {
        $leaveType = LeaveType::find($leaveTypeId);

        if (! $leaveType || ! $leaveType->requires_allocation) {
            return [
                'allocated'           => 0.0,
                'taken'               => 0.0,
                'available'           => 0.0,
                'requires_allocation' => false,
            ];
        }

        $endOfYear = Carbon::now()->endOfYear();

        $totalAllocated = LeaveAllocation::where('employee_id', $employeeId)
            ->where('holiday_status_id', $leaveTypeId)
            ->forAvailableBalance()
            ->where(function ($query) use ($endOfYear) {
                $query->where('date_to', '<=', $endOfYear)
                    ->orWhereNull('date_to');
            })
            ->sum('number_of_days');

        $totalTaken = Leave::where('employee_id', $employeeId)
            ->where('holiday_status_id', $leaveTypeId)
            ->where('state', State::VALIDATE_TWO->value)
            ->sum('number_of_days');

        return [
            'allocated'           => round((float) $totalAllocated, 1),
            'taken'               => round((float) $totalTaken, 1),
            'available'           => round((float) ($totalAllocated - $totalTaken), 1),
            'requires_allocation' => true,
        ];
    }

    private function getRequestedDaysFromFormState(Get $get): float
    {
        $requestDateFrom = $get('request_date_from');

        if (! $requestDateFrom) {
            return 0.0;
        }

        if ((bool) $get('request_unit_half')) {
            return 0.5;
        }

        $start = Carbon::parse($requestDateFrom);
        $end = $get('request_date_to') ? Carbon::parse($get('request_date_to')) : $start;

        return (float) $this->calculateBusinessDays($start, $end);
    }

    private function calculateBusinessDays(Carbon $start, Carbon $end): int
    {
        $days = 0;

        $current = $start->copy();

        while ($current->lte($end)) {
            if (! $current->isWeekend()) {
                $days++;
            }

            $current->addDay();
        }

        return $days;
    }

    private function calculateTotalDays(Carbon $start, Carbon $end): int
    {
        return $start->diffInDays($end) + 1;
    }

    private function checkForOverlappingLeave(int $employeeId, string $startDate, ?string $endDate, ?int $excludeRecordId = null): bool
    {
        $start = Carbon::parse($startDate);

        $end = $endDate ? Carbon::parse($endDate) : $start;

        $query = Leave::where('employee_id', $employeeId)
            ->where(function ($q) use ($start, $end) {
                $q->whereBetween('date_from', [$start, $end])
                    ->orWhereBetween('date_to', [$start, $end])
                    ->orWhere(function ($q2) use ($start, $end) {
                        $q2->where('date_from', '<=', $start)
                            ->where('date_to', '>=', $end);
                    });
            });

        if ($excludeRecordId) {
            $query->where('id', '!=', $excludeRecordId);
        }

        return $query->exists();
    }

    private function calculateBusinessDaysAndNumbers(array &$data): void
    {
        $info = $this->getDurationInfo($data);

        $data['duration_display'] = $info['duration_display'];
        $data['number_of_days'] = $info['number_of_days'];
        $data['business_days'] = $info['business_days'];
        $data['total_days'] = $info['total_days'];
        $data['weekend_days'] = $info['weekend_days'];
    }

    private function updateEmployeeAndCompanyData(array &$data): void
    {

        if (! empty($data['employee_id'])) {
            $employee = Employee::find($data['employee_id']);
            $user = $employee->user;
        } else {
            $user = Auth::user();
            $employee = $user->employee;
        }

        if ($employee) {
            $data['employee_id'] = $employee->id;

            if (empty($data['department_id']) && $employee->department) {
                $data['department_id'] = $employee->department->id;
            } elseif (empty($data['department_id'])) {
                $data['department_id'] = null;
            }

            if ($employee->calendar) {
                $data['calendar_id'] = $employee->calendar->id;
                $data['number_of_hours'] = $employee->calendar->hours_per_day;
            }
        }

        if ($user) {
            $data['user_id'] = $user->id;
            $data['company_id'] = $user->default_company_id;
            $data['employee_company_id'] = $user->default_company_id;
        }
    }
}
