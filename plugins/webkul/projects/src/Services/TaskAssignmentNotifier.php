<?php

namespace Webkul\Project\Services;

use Illuminate\Support\Facades\Auth;
use Webkul\Project\Filament\Resources\TaskResource;
use Webkul\Project\Mail\TaskAssignedMail;
use Webkul\Project\Models\Task;
use Webkul\Security\Models\User;
use Webkul\Support\Services\EmailService;

class TaskAssignmentNotifier
{
    public function notifyOnCreate(Task $task): void
    {
        if (! Auth::check()) {
            return;
        }

        $task->loadMissing('users', 'project');

        foreach ($task->users as $assignee) {
            if ($assignee->id === Auth::id() || blank($assignee->email)) {
                continue;
            }

            $this->sendToAssignee($task, $assignee);
        }
    }

    protected function sendToAssignee(Task $task, User $assignee): void
    {
        app(EmailService::class)->send(
            view: 'projects::mails.task-assigned',
            mailClass: TaskAssignedMail::class,
            payload: [
                'task_title'   => $task->title,
                'project_name' => $task->project?->name,
                'record_url'   => TaskResource::getUrl('view', ['record' => $task], isAbsolute: true),
                'subject'      => __('projects::mails/task-assigned.subject', [
                    'task' => $task->title,
                ]),
                'to' => [
                    'address' => $assignee->email,
                    'name'    => $assignee->name,
                ],
            ],
        );
    }
}
