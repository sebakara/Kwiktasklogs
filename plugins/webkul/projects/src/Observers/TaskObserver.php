<?php

namespace Webkul\Project\Observers;

use Webkul\Project\Models\Task;
use Webkul\Project\Services\TaskAssignmentNotifier;

class TaskObserver
{
    public function created(Task $task): void
    {
        app()->terminating(function () use ($task): void {
            app(TaskAssignmentNotifier::class)->notifyOnCreate(
                $task->fresh(['users', 'project']) ?? $task
            );
        });
    }
}
