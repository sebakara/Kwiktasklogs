<?php

use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;

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
