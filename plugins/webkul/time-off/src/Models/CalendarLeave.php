<?php

namespace Webkul\TimeOff\Models;

use Webkul\Support\Models\Calendar;
use Webkul\Support\Models\CalendarLeaves as BaseCalendarLeave;

class CalendarLeave extends BaseCalendarLeave
{
    protected static function booted(): void
    {
        static::created(function (CalendarLeave $leave): void {
            static::replicateCompanyWideHolidayToAllCalendars($leave);
        });
    }

    /**
     * When no work calendar is chosen, attach this public holiday to every active work calendar
     * for the same company so it applies to all employees using those calendars.
     */
    protected static function replicateCompanyWideHolidayToAllCalendars(CalendarLeave $leave): void
    {
        if ($leave->calendar_id !== null) {
            return;
        }

        if ($leave->company_id === null) {
            return;
        }

        $calendars = Calendar::query()
            ->where('company_id', $leave->company_id)
            ->where('is_active', true)
            ->orderBy('id')
            ->get();

        if ($calendars->isEmpty()) {
            $calendars = Calendar::query()
                ->where('company_id', $leave->company_id)
                ->orderBy('id')
                ->get();
        }

        if ($calendars->isEmpty()) {
            return;
        }

        $leave->calendar_id = $calendars->first()->id;
        $leave->saveQuietly();

        foreach ($calendars->slice(1) as $calendar) {
            static::withoutEvents(function () use ($leave, $calendar): void {
                static::query()->create([
                    'name'        => $leave->name,
                    'time_type'   => $leave->time_type,
                    'date_from'   => $leave->date_from,
                    'date_to'     => $leave->date_to,
                    'company_id'  => $leave->company_id,
                    'calendar_id' => $calendar->id,
                    'creator_id'  => $leave->creator_id,
                ]);
            });
        }
    }
}
