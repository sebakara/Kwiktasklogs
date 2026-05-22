<?php

use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Partner\Models\Partner;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\ProjectStage;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

beforeEach(function (): void {
    $this->access = app(DocumentationAccessService::class);
});

it('allows super admin to manage hub', function (): void {
    $user = User::factory()->create();
    $user->assignRole(Role::findOrCreate(config('documentation.roles.super_admin'), 'web'));

    expect($this->access->canManageHub($user))->toBeTrue()
        ->and($this->access->canManagePermissions($user))->toBeTrue();
});

it('grants panel admin users full documentation hub access', function (): void {
    $user = User::factory()->create();
    $user->assignRole(Role::findOrCreate(config('filament-shield.panel_user.name', 'Admin'), 'web'));

    $space = DocumentationSpace::factory()->create();
    $page = DocumentationPage::factory()->create([
        'space_id'     => $space->id,
        'is_published' => false,
    ]);

    expect($this->access->isSuperAdmin($user))->toBeTrue()
        ->and($this->access->canManageHub($user))->toBeTrue()
        ->and($this->access->canAccessHub($user))->toBeTrue()
        ->and($this->access->canViewPage($user, $page))->toBeTrue()
        ->and($this->access->canEditPage($user, $page))->toBeTrue();
});

it('restricts editor edit to assigned spaces', function (): void {
    $editor = User::factory()->create();
    $editor->assignRole(Role::findOrCreate(config('documentation.roles.editor'), 'web'));

    $assignedSpace = DocumentationSpace::factory()->create();
    $otherSpace = DocumentationSpace::factory()->create();

    $assignedPage = DocumentationPage::factory()->create(['space_id' => $assignedSpace->id]);
    $otherPage = DocumentationPage::factory()->create(['space_id' => $otherSpace->id]);

    DocumentationPermission::factory()->create([
        'permissionable_type' => DocumentationSpace::class,
        'permissionable_id'   => $assignedSpace->id,
        'permission'          => DocumentationPermissionLevel::Edit,
        'user_id'             => $editor->id,
    ]);

    expect($this->access->canEditPage($editor, $assignedPage))->toBeTrue()
        ->and($this->access->canEditPage($editor, $otherPage))->toBeFalse()
        ->and($this->access->canCreatePageInSpace($editor, $assignedSpace))->toBeTrue()
        ->and($this->access->canCreatePageInSpace($editor, $otherSpace))->toBeFalse();
});

it('allows viewer to view published pages with view grant only', function (): void {
    $viewer = User::factory()->create();
    $viewer->assignRole(Role::findOrCreate(config('documentation.roles.viewer'), 'web'));

    $space = DocumentationSpace::factory()->create();
    $publishedPage = DocumentationPage::factory()->published()->create(['space_id' => $space->id]);
    $draftPage = DocumentationPage::factory()->create([
        'space_id'      => $space->id,
        'is_published'  => false,
    ]);

    DocumentationPermission::factory()->create([
        'permissionable_type' => DocumentationSpace::class,
        'permissionable_id'   => $space->id,
        'permission'          => DocumentationPermissionLevel::View,
        'user_id'             => $viewer->id,
    ]);

    expect($this->access->canViewPage($viewer, $publishedPage))->toBeTrue()
        ->and($this->access->canViewPage($viewer, $draftPage))->toBeFalse()
        ->and($this->access->canEditPage($viewer, $publishedPage))->toBeFalse();
});

it('applies role based grants', function (): void {
    $user = User::factory()->create();
    $user->assignRole(Role::findOrCreate(config('documentation.roles.viewer'), 'web'));

    $space = DocumentationSpace::factory()->create();
    $page = DocumentationPage::factory()->published()->create(['space_id' => $space->id]);

    $hubRole = Role::findOrCreate('Documentation Contractor', 'web');
    $user->assignRole($hubRole);

    DocumentationPermission::factory()->create([
        'permissionable_type' => DocumentationPage::class,
        'permissionable_id'   => $page->id,
        'permission'          => DocumentationPermissionLevel::Edit,
        'role_id'             => $hubRole->id,
    ]);

    expect($this->access->canEditPage($user, $page))->toBeFalse();

    $user->assignRole(Role::findOrCreate(config('documentation.roles.editor'), 'web'));

    expect($this->access->canEditPage($user, $page))->toBeTrue();
});

it('allows project participants without hub roles to view project documentation', function (): void {
    if (! class_exists(Project::class)) {
        $this->markTestSkipped('Projects plugin is not available.');
    }

    $employee = User::factory()->create();

    $project = createDocumentationAccessTestProject('Docs Access Project '.uniqid(), $employee->id);

    $space = DocumentationSpace::factory()->create([
        'project_id' => $project->id,
    ]);

    $draftPage = DocumentationPage::factory()->create([
        'space_id'     => $space->id,
        'project_id'   => $project->id,
        'is_published' => false,
    ]);

    $this->actingAs($employee);

    expect($this->access->canAccessHub($employee))->toBeFalse()
        ->and($this->access->canAccessProjectDocumentationPortal($employee))->toBeTrue()
        ->and($this->access->canViewSpace($employee, $space))->toBeTrue()
        ->and($this->access->canViewPage($employee, $draftPage))->toBeTrue()
        ->and($this->access->canEditPage($employee, $draftPage))->toBeFalse();
});

function createDocumentationAccessTestProject(string $name, int $userId): Project
{
    $companyId = Company::query()->value('id');
    $stageId = ProjectStage::query()->value('id');
    $partnerId = Partner::query()->value('id');

    if ($companyId === null || $stageId === null) {
        test()->markTestSkipped('Missing company or stage for project factory.');
    }

    return Project::factory()->create([
        'name'        => $name,
        'company_id'  => $companyId,
        'stage_id'    => $stageId,
        'user_id'     => $userId,
        'creator_id'  => $userId,
        'partner_id'  => $partnerId,
    ]);
}
