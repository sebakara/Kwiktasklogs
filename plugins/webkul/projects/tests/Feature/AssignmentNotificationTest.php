<?php

use Illuminate\Support\Facades\Mail;
use Webkul\Project\Mail\ProjectAssignedMail;
use Webkul\Project\Mail\TaskAssignedMail;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\Task;
use Webkul\Security\Enums\PermissionType;
use Webkul\Security\Models\User;

require_once __DIR__.'/../../../support/tests/Helpers/SecurityHelper.php';
require_once __DIR__.'/../../../support/tests/Helpers/TestBootstrapHelper.php';

beforeEach(function () {
    TestBootstrapHelper::ensurePluginInstalled('projects');

    SecurityHelper::disableUserEvents();
});

afterEach(fn () => SecurityHelper::restoreUserEvents());

function actingAsAssignmentTestUser(array $permissions = []): User
{
    $user = SecurityHelper::authenticateWithPermissions($permissions);

    $user->forceFill([
        'resource_permission' => PermissionType::GLOBAL,
    ])->saveQuietly();

    return $user;
}

it('sends assignment emails to project manager and documentation assignee on create', function () {
    Mail::fake();

    actingAsAssignmentTestUser(['create_project_project']);

    $projectManager = User::factory()->create(['email' => 'pm@example.com']);
    $documentationAssignee = User::factory()->create(['email' => 'doc@example.com']);

    $payload = Project::factory()->make([
        'user_id'                   => $projectManager->id,
        'documentation_assignee_id' => $documentationAssignee->id,
    ])->toArray();
    $payload['start_date'] = '2026-01-01';
    $payload['end_date'] = '2026-01-31';

    $this->postJson(route('admin.api.v1.projects.projects.store'), $payload)
        ->assertCreated();

    Mail::assertSent(ProjectAssignedMail::class, function (ProjectAssignedMail $mail): bool {
        return $mail->payload['to']['address'] === 'pm@example.com';
    });

    Mail::assertSent(ProjectAssignedMail::class, function (ProjectAssignedMail $mail): bool {
        return $mail->payload['to']['address'] === 'doc@example.com';
    });

    Mail::assertSentCount(2, ProjectAssignedMail::class);
});

it('does not email the creator when they are assigned to the project', function () {
    Mail::fake();

    $creator = actingAsAssignmentTestUser(['create_project_project']);

    $payload = Project::factory()->make([
        'user_id' => $creator->id,
    ])->toArray();
    $payload['start_date'] = '2026-01-01';
    $payload['end_date'] = '2026-01-31';

    $this->postJson(route('admin.api.v1.projects.projects.store'), $payload)
        ->assertCreated();

    Mail::assertNothingSent();
});

it('sends assignment emails to task assignees on create', function () {
    Mail::fake();

    actingAsAssignmentTestUser(['create_project_task']);

    $assignee = User::factory()->create(['email' => 'assignee@example.com']);

    $payload = Task::factory()->make()->toArray();
    unset($payload['visibility']);
    $payload['users'] = [$assignee->id];

    $this->postJson(route('admin.api.v1.projects.tasks.store'), $payload)
        ->assertCreated();

    Mail::assertSent(TaskAssignedMail::class, function (TaskAssignedMail $mail): bool {
        return $mail->payload['to']['address'] === 'assignee@example.com';
    });

    Mail::assertSentCount(1, TaskAssignedMail::class);
});

it('does not email the creator when they assign the task to themselves', function () {
    Mail::fake();

    $creator = actingAsAssignmentTestUser(['create_project_task']);

    $payload = Task::factory()->make()->toArray();
    unset($payload['visibility']);
    $payload['users'] = [$creator->id];

    $this->postJson(route('admin.api.v1.projects.tasks.store'), $payload)
        ->assertCreated();

    Mail::assertNothingSent();
});
