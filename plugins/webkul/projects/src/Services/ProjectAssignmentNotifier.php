<?php

namespace Webkul\Project\Services;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Webkul\Project\Filament\Resources\ProjectResource;
use Webkul\Project\Mail\ProjectAssignedMail;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;
use Webkul\Support\Services\EmailService;

class ProjectAssignmentNotifier
{
    public function notifyOnCreate(Project $project): void
    {
        if (! Auth::check()) {
            return;
        }

        $this->resolveAssignees($project)->each(function (array $assignment) use ($project): void {
            $this->sendToAssignee($project, $assignment['user'], $assignment['roles']);
        });
    }

    /**
     * @return Collection<int, array{user: User, roles: array<int, string>}>
     */
    protected function resolveAssignees(Project $project): Collection
    {
        $assignments = collect();

        if ($project->user_id) {
            $assignments->push([
                'user_id' => $project->user_id,
                'role'    => 'project_manager',
            ]);
        }

        if ($project->documentation_assignee_id) {
            $assignments->push([
                'user_id' => $project->documentation_assignee_id,
                'role'    => 'documentation_assignee',
            ]);
        }

        return $assignments
            ->reject(fn (array $assignment): bool => $assignment['user_id'] === Auth::id())
            ->groupBy('user_id')
            ->map(function (Collection $groupedAssignments, int $userId): ?array {
                $user = User::query()->find($userId);

                if (! $user?->email) {
                    return null;
                }

                return [
                    'user'  => $user,
                    'roles' => $groupedAssignments->pluck('role')->unique()->values()->all(),
                ];
            })
            ->filter()
            ->values();
    }

    /**
     * @param  array<int, string>  $roles
     */
    protected function sendToAssignee(Project $project, User $assignee, array $roles): void
    {
        app(EmailService::class)->send(
            view: 'projects::mails.project-assigned',
            mailClass: ProjectAssignedMail::class,
            payload: [
                'project_name' => $project->name,
                'roles'        => $roles,
                'record_url'   => ProjectResource::getUrl('view', ['record' => $project], isAbsolute: true),
                'subject'      => __('projects::mails/project-assigned.subject', [
                    'project' => $project->name,
                ]),
                'to' => [
                    'address' => $assignee->email,
                    'name'    => $assignee->name,
                ],
            ],
        );
    }
}
