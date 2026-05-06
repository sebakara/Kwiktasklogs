<?php

namespace Webkul\Employee\Services;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Webkul\Employee\Models\Employee;
use Webkul\Project\Enums\TaskState;
use Webkul\Project\Models\Task;
use Webkul\Project\Models\Timesheet;

class EmployeeReviewMetricsService
{
    /**
     * @return array<string, float|int|string|array<int, int>>
     */
    public function compute(Employee $employee, Carbon $periodStart, Carbon $periodEnd): array
    {
        $userId = $employee->user_id;

        if (! $userId) {
            return [
                'has_linked_user'                => false,
                'message'                        => __('employees::services/employee-review-metrics.no-linked-user'),
                'total_hours_logged'             => 0.0,
                'timesheet_entries_count'        => 0,
                'distinct_projects_count'        => 0,
                'distinct_tasks_with_time_count' => 0,
                'tasks_assigned_count'           => 0,
                'tasks_completed_count'          => 0,
                'average_task_progress'          => 0.0,
                'total_task_overtime_hours'      => 0.0,
            ];
        }

        $start = $periodStart->copy()->startOfDay();
        $end = $periodEnd->copy()->endOfDay();

        $timesheetQuery = Timesheet::query()
            ->where('type', 'projects')
            ->where('user_id', $userId)
            ->whereBetween('date', [$start->toDateString(), $end->toDateString()]);

        $totalHours = (float) (clone $timesheetQuery)->sum('unit_amount');
        $entriesCount = (int) (clone $timesheetQuery)->count();

        $taskIdsFromTimesheets = (clone $timesheetQuery)
            ->whereNotNull('task_id')
            ->pluck('task_id')
            ->unique()
            ->values()
            ->all();

        $projectIdsFromTimesheets = (clone $timesheetQuery)
            ->whereNotNull('project_id')
            ->pluck('project_id')
            ->unique()
            ->values()
            ->all();

        $scopedTasksQuery = Task::query()
            ->whereHas('users', fn (Builder $q) => $q->where('users.id', $userId))
            ->where(function (Builder $q) use ($userId, $start, $end) {
                $q->whereBetween('updated_at', [$start, $end])
                    ->orWhereBetween('deadline', [$start->toDateString(), $end->toDateString()])
                    ->orWhereHas('timesheets', function (Builder $t) use ($userId, $start, $end) {
                        $t->where('user_id', $userId)
                            ->whereBetween('date', [$start->toDateString(), $end->toDateString()]);
                    });
            });

        $scopedTasks = $scopedTasksQuery->get();

        $tasksAssignedCount = $scopedTasks->count();
        $tasksCompletedCount = $scopedTasks->where('state', TaskState::DONE)->count();

        $averageProgress = $tasksAssignedCount > 0
            ? round((float) $scopedTasks->avg('progress'), 2)
            : 0.0;

        $totalOvertime = (float) $scopedTasks->sum('overtime');

        return [
            'has_linked_user'                => true,
            'total_hours_logged'             => round($totalHours, 4),
            'timesheet_entries_count'        => $entriesCount,
            'distinct_projects_count'        => count($projectIdsFromTimesheets),
            'distinct_tasks_with_time_count' => count($taskIdsFromTimesheets),
            'tasks_assigned_count'           => $tasksAssignedCount,
            'tasks_completed_count'          => $tasksCompletedCount,
            'average_task_progress'          => $averageProgress,
            'total_task_overtime_hours'      => round($totalOvertime, 4),
            'task_ids_from_timesheets'       => array_map('intval', $taskIdsFromTimesheets),
        ];
    }
}
