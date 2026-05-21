<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Models\DocumentationProduct;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\ProjectStage;
use Webkul\Project\Models\Task;
use Webkul\Project\Models\TaskStage;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class IntegrationDemoSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::query()->where('email', 'admin@example.com')->first()
            ?? User::query()->where('is_active', true)->first();

        if ($user === null) {
            $this->command?->error('No user found. Run erp:install first.');

            return;
        }

        $companyId = Company::query()->value('id');
        $stageId = ProjectStage::query()->orderBy('sort')->value('id');

        $project = Project::query()->updateOrCreate(
            ['name' => 'Documentation Hub Demo Project'],
            [
                'tasks_label'               => 'Tasks',
                'description'               => 'Demo project with tasks, subtasks, and linked documentation for end-to-end testing.',
                'visibility'                => 'public',
                'color'                     => '#2563eb',
                'sort'                      => 1,
                'start_date'                => now()->subMonth()->toDateString(),
                'end_date'                  => now()->addMonths(3)->toDateString(),
                'allocated_hours'           => 120,
                'allow_timesheets'          => true,
                'allow_milestones'          => true,
                'allow_task_dependencies'   => false,
                'is_active'                 => true,
                'stage_id'                  => $stageId,
                'company_id'                => $companyId,
                'user_id'                   => $user->id,
                'creator_id'                => $user->id,
                'documentation_assignee_id' => $user->id,
            ]
        );

        $taskStages = $this->seedTaskStages($project, $user->id, $companyId);

        $parentTask = $this->seedTask($project, $taskStages['in_progress'], $user->id, $companyId, [
            'title'       => 'Launch documentation hub',
            'description' => 'Coordinate hub rollout, permissions, and published pages.',
            'sort'        => 1,
        ]);

        $this->seedTask($project, $taskStages['backlog'], $user->id, $companyId, [
            'title'       => 'Write getting started guide',
            'description' => 'Draft and publish the onboarding page in the linked space.',
            'sort'        => 1,
            'parent_id'   => $parentTask->id,
        ]);

        $this->seedTask($project, $taskStages['in_progress'], $user->id, $companyId, [
            'title'       => 'Configure permissions',
            'description' => 'Assign editor and viewer grants for the demo space.',
            'sort'        => 2,
            'parent_id'   => $parentTask->id,
        ]);

        $this->seedTask($project, $taskStages['done'], $user->id, $companyId, [
            'title'       => 'Create share link smoke test',
            'description' => 'Verify public share URL for a published page.',
            'sort'        => 3,
            'parent_id'   => $parentTask->id,
        ]);

        $parentTaskTwo = $this->seedTask($project, $taskStages['backlog'], $user->id, $companyId, [
            'title'       => 'API documentation pass',
            'description' => 'Document REST endpoints for spaces, pages, and versions.',
            'sort'        => 2,
        ]);

        $this->seedTask($project, $taskStages['backlog'], $user->id, $companyId, [
            'title'       => 'List version endpoints',
            'description' => 'Describe index, show, store, and restore routes.',
            'sort'        => 1,
            'parent_id'   => $parentTaskTwo->id,
        ]);

        $space = DocumentationSpace::query()->updateOrCreate(
            [
                'slug'       => 'demo-integration',
                'company_id' => $companyId,
            ],
            [
                'name'        => 'Demo Integration Space',
                'description' => 'Documentation linked to the demo project — use this to test the hub, versions, and audit logs.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-beaker',
                'color'       => '#2563eb',
                'sort_order'  => 0,
                'is_active'   => true,
                'project_id'  => $project->id,
                'creator_id'  => $user->id,
            ]
        );

        $parentPage = $this->seedPage($space, $companyId, $user->id, [
            'title'   => 'Overview',
            'slug'    => 'overview',
            'summary' => 'Top-level page describing the demo project + documentation setup.',
            'content' => $this->pageHtml('Overview', 'This page is the parent in the documentation tree. Open child pages from the sidebar or edit view.'),
            'sort'    => 1,
            'publish' => true,
        ]);

        $this->seedPage($space, $companyId, $user->id, [
            'title'     => 'Projects module checklist',
            'slug'      => 'projects-module-checklist',
            'summary'   => 'Sub-page: verify tasks and subtasks in Projects.',
            'content'   => $this->pageHtml('Projects checklist', 'Confirm parent task "Launch documentation hub" and its three subtasks appear under the demo project.'),
            'sort'      => 2,
            'publish'   => true,
            'parent_id' => $parentPage->id,
        ]);

        $this->seedPage($space, $companyId, $user->id, [
            'title'     => 'Documentation hub checklist',
            'slug'      => 'documentation-hub-checklist',
            'summary'   => 'Sub-page: verify hub features.',
            'content'   => $this->pageHtml('Hub checklist', 'Test version history, audit logs, permissions, and share links on published pages.'),
            'sort'      => 3,
            'publish'   => true,
            'parent_id' => $parentPage->id,
        ]);

        $this->seedPage($space, $companyId, $user->id, [
            'title'   => 'Draft — release notes',
            'slug'    => 'draft-release-notes',
            'summary' => 'Unpublished draft for testing draft vs published badges.',
            'content' => $this->pageHtml('Draft release notes', 'This page should appear as a draft until published.'),
            'sort'    => 4,
            'publish' => false,
        ]);

        $productName = 'GKK Platform';

        if (Schema::hasTable('documentation_products')) {
            $product = DocumentationProduct::query()->updateOrCreate(
                ['slug' => 'gkk-platform', 'company_id' => $companyId],
                [
                    'name'        => $productName,
                    'description' => 'Company product line documentation (portal catalog demo).',
                    'color'       => '#8b5cf6',
                    'sort_order'  => 0,
                    'is_active'   => true,
                    'creator_id'  => $user->id,
                ],
            );

            $productSpace = DocumentationSpace::query()->updateOrCreate(
                ['product_id' => $product->id],
                [
                    'name'        => $product->name,
                    'slug'        => 'gkk-platform-docs',
                    'description' => $product->description,
                    'visibility'  => DocumentationSpaceVisibility::Internal,
                    'color'       => $product->color,
                    'company_id'  => $companyId,
                    'creator_id'  => $user->id,
                ],
            );

            $this->seedPage($productSpace, $companyId, $user->id, [
                'title'   => 'Product overview',
                'slug'    => 'overview',
                'summary' => 'Main product documentation entry point.',
                'content' => $this->pageHtml('Product overview', 'Document features, releases, and architecture for this product line.'),
                'sort'    => 1,
                'publish' => true,
            ]);
        }

        $this->command?->info('Integration demo seeded successfully.');
        $this->command?->table(
            ['Item', 'Where to look'],
            [
                ['Portal', 'Documentation → Home (/admin/documentation/hub)'],
                ['Project', "Projects tab → \"{$project->name}\""],
                ['Product', Schema::hasTable('documentation_products') ? "Products tab → \"{$productName}\"" : '—'],
                ['Tasks', '2 parent tasks, 4 subtasks on that project'],
                ['Pages', '3 published (1 parent + 2 children), 1 draft on project space'],
                ['Login', 'admin@example.com / admin123'],
            ],
        );
    }

    /**
     * @return array<string, TaskStage>
     */
    protected function seedTaskStages(Project $project, int $userId, ?int $companyId): array
    {
        $project->taskStages()->delete();

        $definitions = [
            'backlog'      => 'Backlog',
            'in_progress'  => 'In Progress',
            'done'         => 'Done',
        ];

        $stages = [];

        foreach ($definitions as $key => $name) {
            $stages[$key] = TaskStage::query()->create([
                'name'       => $name,
                'sort'       => count($stages) + 1,
                'is_active'  => true,
                'project_id' => $project->id,
                'company_id' => $companyId,
                'user_id'    => $userId,
                'creator_id' => $userId,
            ]);
        }

        return $stages;
    }

    /**
     * @param  array<string, mixed>  $attributes
     */
    protected function seedTask(
        Project $project,
        TaskStage $stage,
        int $userId,
        ?int $companyId,
        array $attributes,
    ): Task {
        return Task::query()->updateOrCreate(
            [
                'project_id' => $project->id,
                'title'      => $attributes['title'],
            ],
            [
                'description'             => $attributes['description'] ?? '',
                'color'                   => '#3b82f6',
                'priority'                => false,
                'state'                   => 'in_progress',
                'sort'                    => $attributes['sort'] ?? 1,
                'deadline'                => now()->addWeeks(2),
                'is_active'               => true,
                'is_recurring'            => false,
                'working_hours_open'      => 0,
                'working_hours_close'     => 0,
                'allocated_hours'         => 8,
                'remaining_hours'         => 8,
                'effective_hours'         => 0,
                'total_hours_spent'       => 0,
                'subtask_effective_hours' => 0,
                'overtime'                => 0,
                'progress'                => 0,
                'stage_id'                => $stage->id,
                'parent_id'               => $attributes['parent_id'] ?? null,
                'company_id'              => $companyId,
                'creator_id'              => $userId,
            ]
        );
    }

    /**
     * @param  array<string, mixed>  $data
     */
    protected function seedPage(
        DocumentationSpace $space,
        ?int $companyId,
        int $userId,
        array $data,
    ): DocumentationPage {
        $publish = (bool) ($data['publish'] ?? true);

        $page = DocumentationPage::query()->updateOrCreate(
            [
                'space_id' => $space->id,
                'slug'     => $data['slug'],
            ],
            [
                'title'          => $data['title'],
                'summary'        => $data['summary'],
                'content'        => $data['content'],
                'status'         => $publish ? DocumentationPageStatus::Published : DocumentationPageStatus::Draft,
                'module'         => 'demo',
                'audience'       => 'all',
                'is_published'   => $publish,
                'published_at'   => $publish ? now()->subDay() : null,
                'sort_order'     => $data['sort'],
                'parent_id'      => $data['parent_id'] ?? null,
                'project_id'     => $space->project_id,
                'company_id'     => $companyId,
                'creator_id'     => $userId,
                'last_editor_id' => $userId,
            ]
        );

        DocumentationPageVersion::query()->firstOrCreate(
            [
                'page_id'        => $page->id,
                'version_number' => 1,
            ],
            [
                'title'       => $page->title,
                'summary'     => $page->summary,
                'content'     => $page->content,
                'change_note' => 'Integration demo initial version',
                'creator_id'  => $userId,
            ]
        );

        return $page;
    }

    protected function pageHtml(string $title, string $body): string
    {
        return <<<HTML
<h2>{$title}</h2>
<p>{$body}</p>
<h3>Test steps</h3>
<ol>
    <li>Sign in as <code>admin@example.com</code>.</li>
    <li>Open the linked project and documentation space.</li>
    <li>Confirm tasks, subtasks, pages, versions, and audit entries.</li>
</ol>
HTML;
    }
}
