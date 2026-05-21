<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationProduct;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationProjectIntegration;
use Webkul\Documentation\Services\DocumentationShareLinkService;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\ProjectStage;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationPortalDemoSeeder extends Seeder
{
    protected ?int $companyId = null;

    protected int $userId;

    protected User $user;

    /** @var list<string> */
    protected array $summaryRows = [];

    public function run(): void
    {
        $this->user = User::query()->where('email', 'admin@example.com')->first()
            ?? User::query()->where('is_active', true)->first()
            ?? throw new \RuntimeException('No user found. Run erp:install first.');

        $this->userId = (int) $this->user->id;
        $this->companyId = Company::query()->value('id');

        $this->command?->info('Seeding Documentation portal demo data…');

        if (Schema::hasTable('documentation_products')) {
            $this->seedProducts();
        }

        if (DocumentationProjectIntegration::isAvailable()) {
            $this->seedProjects();
        } else {
            $this->command?->warn('Projects module unavailable — skipped project catalog seeds.');
        }

        array_unshift($this->summaryRows, [
            'Portal home',
            '/admin/documentation/hub — Projects, Products, Recent, Search tabs',
        ], [
            'Templates & extra spaces',
            'Run DocumentationHubSeeder (7 spaces, templates) via db:seed',
        ]);

        $this->command?->newLine();
        $this->command?->info('Documentation portal demo seeded.');
        $this->command?->table(['What to try', 'Where'], $this->summaryRows);
        $this->command?->line('Login: admin@example.com — open /admin/documentation/hub');
    }

    protected function seedProducts(): void
    {
        $catalog = [
            [
                'slug'        => 'gkk-platform',
                'name'        => 'GKK Platform',
                'description' => 'Core company platform — architecture, releases, and onboarding.',
                'color'       => '#8b5cf6',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'Product home — start here.', 'publish' => true, 'children' => [
                        ['slug' => 'architecture', 'title' => 'Architecture', 'summary' => 'System context and components.', 'publish' => true],
                        ['slug' => 'release-notes', 'title' => 'Release notes', 'summary' => 'Q2 2026 changelog.', 'publish' => true],
                        ['slug' => 'roadmap-draft', 'title' => 'Roadmap (draft)', 'summary' => 'Unpublished planning notes.', 'publish' => false],
                    ]],
                    ['slug' => 'api-guide', 'title' => 'API guide', 'summary' => 'REST authentication and endpoints.', 'publish' => true],
                ],
                'versions'  => true,
                'share'     => true,
            ],
            [
                'slug'        => 'kwik-ride',
                'name'        => 'Kwik Ride',
                'description' => 'Mobility product — driver ops, fleet, and partner APIs.',
                'color'       => '#ea580c',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'Kwik Ride documentation home.', 'publish' => true, 'children' => [
                        ['slug' => 'driver-onboarding', 'title' => 'Driver onboarding', 'summary' => 'Checklist before first trip.', 'publish' => true],
                        ['slug' => 'fleet-management', 'title' => 'Fleet management', 'summary' => 'Vehicles and maintenance.', 'publish' => true],
                    ]],
                ],
                'versions'  => false,
                'share'     => true,
            ],
            [
                'slug'        => 'aureus-erp-docs',
                'name'        => 'Aureus ERP',
                'description' => 'ERP modules, admin guides, and integration notes.',
                'color'       => '#0d9488',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'ERP documentation entry.', 'publish' => true, 'children' => [
                        ['slug' => 'module-map', 'title' => 'Module map', 'summary' => 'Installed plugins overview.', 'publish' => true],
                        ['slug' => 'permissions', 'title' => 'Roles & permissions', 'summary' => 'Shield and hub access.', 'publish' => true],
                    ]],
                ],
                'versions'  => true,
                'share'     => false,
            ],
        ];

        foreach ($catalog as $definition) {
            $product = DocumentationProduct::query()->updateOrCreate(
                ['slug' => $definition['slug'], 'company_id' => $this->companyId],
                [
                    'name'        => $definition['name'],
                    'description' => $definition['description'],
                    'color'       => $definition['color'],
                    'sort_order'  => 0,
                    'is_active'   => true,
                    'creator_id'  => $this->userId,
                ],
            );

            $space = DocumentationSpace::query()->updateOrCreate(
                ['product_id' => $product->id],
                [
                    'name'        => $product->name,
                    'slug'        => $definition['slug'].'-space',
                    'description' => $product->description,
                    'visibility'  => DocumentationSpaceVisibility::Internal,
                    'color'       => $product->color,
                    'company_id'  => $this->companyId,
                    'creator_id'  => $this->userId,
                    'is_active'   => true,
                ],
            );

            $this->seedPageTree($space, $definition['pages'], $definition['versions'], $definition['share']);

            $this->summaryRows[] = [
                'Products tab → '.$product->name,
                'Published pages, sidebar tree, '.($definition['share'] ? 'share link' : 'no share').($definition['versions'] ? ', version history' : ''),
            ];
        }
    }

    protected function seedProjects(): void
    {
        $stageId = ProjectStage::query()->orderBy('sort')->value('id');

        $catalog = [
            [
                'name'        => 'Website Redesign 2026',
                'description' => 'Marketing site refresh — design system, CMS, and launch.',
                'color'       => '#2563eb',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'Project charter and goals.', 'publish' => true, 'children' => [
                        ['slug' => 'requirements', 'title' => 'Requirements', 'summary' => 'Scope and acceptance criteria.', 'publish' => true],
                        ['slug' => 'design-system', 'title' => 'Design system', 'summary' => 'Tokens, components, Figma links.', 'publish' => true],
                        ['slug' => 'launch-checklist', 'title' => 'Launch checklist (draft)', 'summary' => 'Go-live tasks — still in draft.', 'publish' => false],
                    ]],
                ],
                'versions' => true,
                'share'    => true,
            ],
            [
                'name'        => 'Mobile App — Phase 2',
                'description' => 'iOS/Android features for authenticated customers.',
                'color'       => '#db2777',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'Phase 2 scope and timeline.', 'publish' => true, 'children' => [
                        ['slug' => 'sprint-notes', 'title' => 'Sprint notes', 'summary' => 'Weekly delivery log.', 'publish' => true],
                        ['slug' => 'test-plan', 'title' => 'Test plan', 'summary' => 'QA scenarios and devices.', 'publish' => true],
                    ]],
                ],
                'versions' => false,
                'share'    => true,
            ],
            [
                'name'        => 'ERP Rollout — Finance',
                'description' => 'Accounting module rollout for finance team.',
                'color'       => '#16a34a',
                'pages'       => [
                    ['slug' => 'overview', 'title' => 'Overview', 'summary' => 'Rollout plan and owners.', 'publish' => true, 'children' => [
                        ['slug' => 'training', 'title' => 'Training materials', 'summary' => 'End-user guides.', 'publish' => true],
                        ['slug' => 'cutover', 'title' => 'Cutover runbook', 'summary' => 'Weekend migration steps.', 'publish' => true],
                    ]],
                ],
                'versions' => true,
                'share'    => false,
            ],
        ];

        foreach ($catalog as $index => $definition) {
            $project = Project::query()->updateOrCreate(
                ['name' => $definition['name']],
                [
                    'tasks_label'               => 'Tasks',
                    'description'               => $definition['description'],
                    'visibility'                => 'public',
                    'color'                     => $definition['color'],
                    'sort'                      => $index + 1,
                    'is_active'                 => true,
                    'stage_id'                  => $stageId,
                    'company_id'                => $this->companyId,
                    'user_id'                   => $this->userId,
                    'creator_id'                => $this->userId,
                    'documentation_assignee_id' => $this->userId,
                ],
            );

            $space = DocumentationSpace::query()->updateOrCreate(
                ['project_id' => $project->id],
                [
                    'name'        => $project->name,
                    'slug'        => Str::slug($project->name).'-docs',
                    'description' => $definition['description'],
                    'visibility'  => DocumentationSpaceVisibility::Internal,
                    'color'       => $definition['color'],
                    'company_id'  => $this->companyId,
                    'creator_id'  => $this->userId,
                    'is_active'   => true,
                ],
            );

            $this->seedPageTree($space, $definition['pages'], $definition['versions'], $definition['share']);

            if ($index === 0) {
                $this->seedSpacePermission($space);
            }

            $this->summaryRows[] = [
                'Projects tab → '.$project->name,
                'Page tree'.($definition['versions'] ? ', version history' : '').($definition['share'] ? ', share link' : ''),
            ];
        }

        Project::query()->updateOrCreate(
            ['name' => 'Documentation Hub Demo Project'],
            [
                'tasks_label'               => 'Tasks',
                'description'               => 'Original integration demo project (tasks + docs).',
                'visibility'                => 'public',
                'color'                     => '#6366f1',
                'sort'                      => 99,
                'is_active'                 => true,
                'stage_id'                  => $stageId,
                'company_id'                => $this->companyId,
                'user_id'                   => $this->userId,
                'creator_id'                => $this->userId,
                'documentation_assignee_id' => $this->userId,
            ],
        );
    }

    /**
     * @param  list<array<string, mixed>>  $nodes
     */
    protected function seedPageTree(
        DocumentationSpace $space,
        array $nodes,
        bool $withVersionHistory = false,
        bool $withShareLink = false,
    ): void {
        $sort = 0;
        $overviewPage = null;

        foreach ($nodes as $node) {
            $sort++;
            $page = $this->seedPage($space, $node, null, $sort);

            if ($node['slug'] === 'overview') {
                $overviewPage = $page;
            }

            if ($withVersionHistory && $node['slug'] === 'overview') {
                $this->seedVersionHistory($page);
            }

            if ($withShareLink && $node['slug'] === 'overview' && ($node['publish'] ?? true)) {
                $this->seedShareLink($page);
            }

            $this->seedAuditTrail($space, $page);

            $childSort = 0;

            foreach ($node['children'] ?? [] as $child) {
                $childSort++;
                $childPage = $this->seedPage($space, $child, $page->id, $childSort);
                $this->seedAuditTrail($space, $childPage);
            }
        }
    }

    /**
     * @param  array<string, mixed>  $data
     */
    protected function seedPage(
        DocumentationSpace $space,
        array $data,
        ?int $parentId,
        int $sort,
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
                'content'        => $this->pageHtml($data['title'], $data['summary'], $space->name),
                'status'         => $publish ? DocumentationPageStatus::Published : DocumentationPageStatus::Draft,
                'module'         => 'portal-demo',
                'audience'       => 'all',
                'is_published'   => $publish,
                'published_at'   => $publish ? now()->subDays($sort) : null,
                'sort_order'     => $sort,
                'parent_id'      => $parentId,
                'project_id'     => $space->project_id,
                'company_id'     => $this->companyId,
                'creator_id'     => $this->userId,
                'last_editor_id' => $this->userId,
                'updated_at'     => now()->subHours($sort),
            ],
        );

        DocumentationPageVersion::query()->updateOrCreate(
            [
                'page_id'        => $page->id,
                'version_number' => 1,
            ],
            [
                'title'       => $page->title,
                'summary'     => $page->summary,
                'content'     => $page->content,
                'change_note' => 'Initial portal demo version',
                'creator_id'  => $this->userId,
            ],
        );

        return $page;
    }

    protected function seedVersionHistory(DocumentationPage $page): void
    {
        $versions = [
            1 => ['change_note' => 'Initial draft', 'content_suffix' => ''],
            2 => ['change_note' => 'Added stakeholder section', 'content_suffix' => '<h3>Stakeholders</h3><p>Product, Engineering, and Support leads reviewed this draft.</p>'],
            3 => ['change_note' => 'Published after review', 'content_suffix' => '<h3>Approval</h3><p>Approved for internal distribution.</p>'],
        ];

        foreach ($versions as $number => $meta) {
            DocumentationPageVersion::query()->updateOrCreate(
                [
                    'page_id'        => $page->id,
                    'version_number' => $number,
                ],
                [
                    'title'       => $page->title,
                    'summary'     => $page->summary,
                    'content'     => $page->content.$meta['content_suffix'],
                    'change_note' => $meta['change_note'],
                    'creator_id'  => $this->userId,
                    'created_at'  => now()->subDays(4 - $number),
                    'updated_at'  => now()->subDays(4 - $number),
                ],
            );
        }

        DocumentationAuditLog::query()->updateOrCreate(
            [
                'page_id' => $page->id,
                'action'  => DocumentationAuditAction::VersionCreated,
                'user_id' => $this->userId,
            ],
            [
                'space_id'   => $page->space_id,
                'company_id' => $this->companyId,
                'metadata'   => ['version_number' => 3],
                'created_at' => now()->subDay(),
            ],
        );
    }

    protected function seedShareLink(DocumentationPage $page): void
    {
        $token = 'demo-'.Str::slug($page->slug).'-'.substr(md5((string) $page->id), 0, 12);

        $link = DocumentationShareLink::query()->updateOrCreate(
            ['page_id' => $page->id, 'token' => $token],
            [
                'visibility'  => DocumentationShareLinkVisibility::Public,
                'password'    => null,
                'expires_at'  => null,
                'is_active'   => true,
                'view_count'  => 12,
                'company_id'  => $this->companyId,
                'creator_id'  => $this->userId,
            ],
        );

        DocumentationAuditLog::query()->updateOrCreate(
            [
                'page_id' => $page->id,
                'action'  => DocumentationAuditAction::Shared,
                'user_id' => $this->userId,
            ],
            [
                'space_id'   => $page->space_id,
                'company_id' => $this->companyId,
                'metadata'   => ['share_link_id' => $link->id],
                'created_at' => now()->subHours(6),
            ],
        );

        $publicUrl = app(DocumentationShareLinkService::class)->publicUrl($link);

        $this->summaryRows[] = [
            'Public share → '.$page->title,
            $publicUrl,
        ];
    }

    protected function seedAuditTrail(DocumentationSpace $space, DocumentationPage $page): void
    {
        DocumentationAuditLog::query()->updateOrCreate(
            [
                'page_id' => $page->id,
                'action'  => DocumentationAuditAction::Created,
                'user_id' => $this->userId,
            ],
            [
                'space_id'   => $space->id,
                'company_id' => $this->companyId,
                'created_at' => $page->created_at ?? now()->subDays(3),
            ],
        );

        if ($page->is_published) {
            DocumentationAuditLog::query()->updateOrCreate(
                [
                    'page_id' => $page->id,
                    'action'  => DocumentationAuditAction::Published,
                    'user_id' => $this->userId,
                ],
                [
                    'space_id'   => $space->id,
                    'company_id' => $this->companyId,
                    'created_at' => $page->published_at ?? now()->subDays(2),
                ],
            );

            DocumentationAuditLog::query()->updateOrCreate(
                [
                    'page_id' => $page->id,
                    'action'  => DocumentationAuditAction::Viewed,
                    'user_id' => $this->userId,
                ],
                [
                    'space_id'   => $space->id,
                    'company_id' => $this->companyId,
                    'created_at' => now()->subHours(2),
                ],
            );
        }
    }

    protected function seedSpacePermission(DocumentationSpace $space): void
    {
        $viewerRole = Role::query()
            ->where('name', config('documentation.roles.viewer'))
            ->where('guard_name', 'web')
            ->first();

        if ($viewerRole === null) {
            return;
        }

        DocumentationPermission::query()->updateOrCreate(
            [
                'permissionable_type' => DocumentationSpace::class,
                'permissionable_id'   => $space->id,
                'role_id'             => $viewerRole->id,
                'permission'          => DocumentationPermissionLevel::View,
            ],
            [
                'company_id' => $this->companyId,
                'creator_id' => $this->userId,
            ],
        );

        DocumentationAuditLog::query()->updateOrCreate(
            [
                'space_id' => $space->id,
                'action'   => DocumentationAuditAction::PermissionChanged,
                'user_id'  => $this->userId,
            ],
            [
                'company_id' => $this->companyId,
                'metadata'   => ['role' => $viewerRole->name, 'level' => 'view'],
                'created_at' => now()->subDays(5),
            ],
        );

        $this->summaryRows[] = [
            'Manage → Permissions / Audit',
            'Viewer role grant on "'.$space->name.'" + audit entries',
        ];
    }

    protected function pageHtml(string $title, string $summary, string $spaceName): string
    {
        $summaryEsc = e($summary);
        $spaceEsc = e($spaceName);

        return <<<HTML
<h2>{$title}</h2>
<p><strong>Space:</strong> {$spaceEsc}</p>
<p>{$summaryEsc}</p>
<h3>What to test in the portal</h3>
<ul>
    <li><strong>Sidebar</strong> — switch pages using the tree on the left.</li>
    <li><strong>Publish</strong> — use the top bar on draft pages (e.g. roadmap / launch checklist).</li>
    <li><strong>Share</strong> — open Share on published overview pages with a demo link.</li>
    <li><strong>Versions</strong> — open Version history on GKK Platform or Website Redesign overview.</li>
    <li><strong>Recent</strong> — return to Home → Recent to see these pages.</li>
</ul>
<h3>Sample table</h3>
<table>
<thead><tr><th>Area</th><th>Status</th></tr></thead>
<tbody>
<tr><td>Reader layout</td><td>Ready</td></tr>
<tr><td>Catalog</td><td>Projects &amp; Products</td></tr>
</tbody>
</table>
HTML;
    }
}
