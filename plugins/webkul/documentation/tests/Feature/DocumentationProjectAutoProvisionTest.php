<?php

use Illuminate\Support\Facades\Schema;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;
use Webkul\Partner\Models\Partner;
use Webkul\PluginManager\Models\Plugin;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\ProjectStage;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

beforeEach(function (): void {
    if (Schema::hasTable('plugins')) {
        Plugin::query()->updateOrCreate(
            ['name' => 'documentation'],
            ['is_installed' => true, 'is_active' => true],
        );
    }
});

it('creates a documentation space and overview page when a project is created', function (): void {
    if (! class_exists(Project::class) || ! Schema::hasTable('projects_projects')) {
        $this->markTestSkipped('Projects plugin is not available.');
    }

    $project = createDocumentationTestProject('Documentation Auto Provision '.uniqid());

    $space = DocumentationSpace::query()
        ->where('project_id', $project->id)
        ->first();

    expect($space)->not->toBeNull()
        ->and($space->name)->toBe($project->name)
        ->and($space->is_active)->toBeTrue();

    $overview = DocumentationPage::query()
        ->where('space_id', $space->id)
        ->where('slug', 'overview')
        ->first();

    expect($overview)->not->toBeNull()
        ->and($overview->project_id)->toBe($project->id);
});

it('does not duplicate space when provisioning runs twice', function (): void {
    if (! class_exists(Project::class) || ! Schema::hasTable('projects_projects')) {
        $this->markTestSkipped('Projects plugin is not available.');
    }

    $project = createDocumentationTestProject('Idempotent Provision '.uniqid());

    $service = app(DocumentationSpaceProvisioningService::class);

    $first = $service->provisionForProject($project);
    $second = $service->provisionForProject($project);

    expect($first->id)->toBe($second->id)
        ->and(DocumentationSpace::query()->where('project_id', $project->id)->count())->toBe(1);
});

function createDocumentationTestProject(string $name): Project
{
    $companyId = Company::query()->value('id');
    $stageId = ProjectStage::query()->value('id');
    $userId = User::query()->value('id');
    $partnerId = Partner::query()->value('id');

    if ($companyId === null || $stageId === null || $userId === null) {
        test()->markTestSkipped('Missing company, stage, or user for project factory.');
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
