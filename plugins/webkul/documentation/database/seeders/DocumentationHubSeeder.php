<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationHubSeeder extends Seeder
{
    public function run(): void
    {
        $companyId = Company::query()->value('id');
        $creatorId = User::query()
            ->where('is_active', true)
            ->value('id') ?? User::query()->value('id');

        if ($creatorId === null) {
            $this->command?->warn('No users found. Skipping Documentation Hub seed.');

            return;
        }

        $templates = $this->seedTemplates($companyId, $creatorId);
        $spaces = $this->seedSpaces($companyId, $creatorId);

        $pageCount = $this->seedPages($spaces, $templates, $companyId, $creatorId);

        $this->command?->info("Documentation Hub seeded: {$spaces->count()} spaces, {$templates->count()} templates, {$pageCount} pages.");
    }

    /**
     * @return Collection<string, DocumentationTemplate>
     */
    private function seedTemplates(?int $companyId, int $creatorId)
    {
        $definitions = [
            'product-documentation' => [
                'name'        => 'Product Documentation',
                'description' => 'Standard layout for product features, modules, and release notes.',
                'module'      => 'products',
                'content'     => $this->templateBody('Product Documentation', 'Describe the feature purpose, user flow, and acceptance criteria.'),
            ],
            'project-documentation' => [
                'name'        => 'Project Documentation',
                'description' => 'Template for project charters, delivery plans, and handover notes.',
                'module'      => 'projects',
                'content'     => $this->templateBody('Project Documentation', 'Capture scope, milestones, owners, risks, and communication plan.'),
            ],
            'api-documentation' => [
                'name'        => 'API Documentation',
                'description' => 'Template for REST endpoints, authentication, and request examples.',
                'module'      => 'developer',
                'content'     => $this->templateBody('API Documentation', 'Document base URL, auth method, endpoints, parameters, and sample responses.'),
            ],
            'sop' => [
                'name'        => 'SOP',
                'description' => 'Standard operating procedure for repeatable internal processes.',
                'module'      => 'operations',
                'content'     => $this->templateBody('SOP', 'List purpose, scope, responsibilities, steps, and escalation path.'),
            ],
            'faq' => [
                'name'        => 'FAQ',
                'description' => 'Frequently asked questions with concise answers.',
                'module'      => 'support',
                'content'     => $this->templateBody('FAQ', 'Add common questions and clear answers for end users.'),
            ],
            'meeting-notes' => [
                'name'        => 'Meeting Notes',
                'description' => 'Template for capturing decisions and action items from meetings.',
                'module'      => 'collaboration',
                'content'     => $this->templateBody('Meeting Notes', 'Record attendees, agenda, discussion summary, decisions, and action items.'),
            ],
            'user-guide' => [
                'name'        => 'User Guide',
                'description' => 'Step-by-step guide for application users.',
                'module'      => 'general',
                'content'     => $this->templateBody('User Guide', 'Walk users through prerequisites, steps, screenshots, and troubleshooting tips.'),
            ],
        ];

        $templates = collect();

        foreach ($definitions as $slug => $definition) {
            $templates->put($slug, DocumentationTemplate::query()->updateOrCreate(
                [
                    'slug'       => $slug,
                    'company_id' => $companyId,
                ],
                [
                    'name'        => $definition['name'],
                    'description' => $definition['description'],
                    'content'     => $definition['content'],
                    'module'      => $definition['module'],
                    'is_active'   => true,
                    'creator_id'  => $creatorId,
                ]
            ));
        }

        return $templates;
    }

    /**
     * @return Collection<string, DocumentationSpace>
     */
    private function seedSpaces(?int $companyId, int $creatorId)
    {
        $definitions = [
            'gkk-products' => [
                'name'        => 'GKK Products',
                'description' => 'Product documentation for the Global Kwikkoders product portfolio.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-cube',
                'color'       => '#2563eb',
            ],
            'gkk-projects' => [
                'name'        => 'GKK Projects',
                'description' => 'Delivery playbooks, project standards, and execution guides.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-briefcase',
                'color'       => '#7c3aed',
            ],
            'aureus-erp' => [
                'name'        => 'Aureus ERP',
                'description' => 'ERP module documentation, workflows, and administrator references.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-building-office-2',
                'color'       => '#0d9488',
            ],
            'kwik-ride' => [
                'name'        => 'Kwik Ride',
                'description' => 'Documentation for the Kwik Ride mobility and fleet platform.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-truck',
                'color'       => '#ea580c',
            ],
            'planpod' => [
                'name'        => 'PlanPod',
                'description' => 'PlanPod planning workspace guides, configuration, and integrations.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-calendar-days',
                'color'       => '#db2777',
            ],
            'internal-sops' => [
                'name'        => 'Internal SOPs',
                'description' => 'Company standard operating procedures and compliance workflows.',
                'visibility'  => DocumentationSpaceVisibility::Private,
                'icon'        => 'heroicon-o-clipboard-document-check',
                'color'       => '#4b5563',
            ],
            'developer-docs' => [
                'name'        => 'Developer Docs',
                'description' => 'Engineering setup guides, API references, and deployment runbooks.',
                'visibility'  => DocumentationSpaceVisibility::Internal,
                'icon'        => 'heroicon-o-code-bracket',
                'color'       => '#16a34a',
            ],
        ];

        $spaces = collect();

        foreach ($definitions as $slug => $definition) {
            $spaces->put($slug, DocumentationSpace::query()->updateOrCreate(
                [
                    'slug'       => $slug,
                    'company_id' => $companyId,
                ],
                [
                    'name'        => $definition['name'],
                    'description' => $definition['description'],
                    'visibility'  => $definition['visibility'],
                    'icon'        => $definition['icon'],
                    'color'       => $definition['color'],
                    'sort_order'  => $spaces->count() + 1,
                    'is_active'   => true,
                    'creator_id'  => $creatorId,
                ]
            ));
        }

        return $spaces;
    }

    /**
     * @param  Collection<string, DocumentationSpace>  $spaces
     * @param  Collection<string, DocumentationTemplate>  $templates
     */
    private function seedPages($spaces, $templates, ?int $companyId, int $creatorId): int
    {
        $catalog = [
            'gkk-products' => [
                'template' => 'product-documentation',
                'module'   => 'products',
                'pages'    => [
                    ['title' => 'Getting Started with GKK Products', 'summary' => 'Orientation for new team members working with the product catalog.'],
                    ['title' => 'Product Catalog Overview', 'summary' => 'How products, variants, and categories are organized.'],
                    ['title' => 'Pricing and Packaging Guide', 'summary' => 'Commercial packaging rules and list price governance.'],
                    ['title' => 'Release Notes — Q2 2026', 'summary' => 'Summary of recent product updates and rollout notes.'],
                ],
            ],
            'gkk-projects' => [
                'template' => 'project-documentation',
                'module'   => 'projects',
                'pages'    => [
                    ['title' => 'Project Lifecycle Overview', 'summary' => 'Standard phases from initiation through closure.'],
                    ['title' => 'Sprint Planning Guide', 'summary' => 'How teams plan sprints, capacity, and commitments.'],
                    ['title' => 'Resource Allocation Standards', 'summary' => 'Guidelines for assigning people and budget to projects.'],
                    ['title' => 'Weekly Status Reporting', 'summary' => 'Template for project status updates to stakeholders.'],
                ],
            ],
            'aureus-erp' => [
                'template' => 'user-guide',
                'module'   => 'erp',
                'pages'    => [
                    ['title' => 'ERP Module Map', 'summary' => 'High-level map of installed ERP modules and dependencies.'],
                    ['title' => 'User Roles and Permissions', 'summary' => 'How access is granted across admin, manager, and staff roles.'],
                    ['title' => 'Data Migration Playbook', 'summary' => 'Steps for importing master data and validating cutover.'],
                    ['title' => 'Accounting Workflow Basics', 'summary' => 'Invoices, payments, journals, and reconciliation overview.'],
                ],
            ],
            'kwik-ride' => [
                'template' => 'product-documentation',
                'module'   => 'kwik-ride',
                'pages'    => [
                    ['title' => 'Driver Onboarding Checklist', 'summary' => 'Required steps before a driver can accept trips.'],
                    ['title' => 'Fleet Management Overview', 'summary' => 'Managing vehicles, maintenance windows, and assignments.'],
                    ['title' => 'Booking API Overview', 'summary' => 'Integration points for partners consuming ride bookings.'],
                    ['title' => 'Safety and Compliance Policy', 'summary' => 'Operational safety standards and incident reporting.'],
                ],
            ],
            'planpod' => [
                'template' => 'user-guide',
                'module'   => 'planpod',
                'pages'    => [
                    ['title' => 'Workspace Setup Guide', 'summary' => 'Create workspaces, invite members, and configure defaults.'],
                    ['title' => 'Task Board Basics', 'summary' => 'Columns, cards, labels, and daily execution habits.'],
                    ['title' => 'Integrations Guide', 'summary' => 'Connect PlanPod with chat, calendar, and ERP tools.'],
                    ['title' => 'Administrator Configuration', 'summary' => 'Tenant settings, retention, and security controls.'],
                ],
            ],
            'internal-sops' => [
                'template' => 'sop',
                'module'   => 'operations',
                'pages'    => [
                    ['title' => 'Employee Onboarding SOP', 'summary' => 'HR and IT checklist for new hires.'],
                    ['title' => 'Incident Response Procedure', 'summary' => 'Steps to triage, contain, and communicate incidents.'],
                    ['title' => 'Purchase Approval Process', 'summary' => 'Spend thresholds, approvers, and documentation requirements.'],
                    ['title' => 'Data Backup and Recovery SOP', 'summary' => 'Backup schedules, restore drills, and ownership.'],
                ],
            ],
            'developer-docs' => [
                'template' => 'api-documentation',
                'module'   => 'developer',
                'pages'    => [
                    ['title' => 'Local Development Setup', 'summary' => 'Clone, environment variables, migrations, and first run.'],
                    ['title' => 'API Authentication', 'summary' => 'Sanctum tokens, guards, and permission expectations.'],
                    ['title' => 'Database Conventions', 'summary' => 'Naming, migrations, factories, and multi-company patterns.'],
                    ['title' => 'Deployment Pipeline', 'summary' => 'CI stages, release tagging, and rollback procedure.'],
                ],
            ],
        ];

        $pageCount = 0;

        foreach ($catalog as $spaceSlug => $config) {
            $space = $spaces->get($spaceSlug);

            if ($space === null) {
                continue;
            }

            $template = $templates->get($config['template']);

            foreach ($config['pages'] as $index => $pageDefinition) {
                $slug = Str::slug($pageDefinition['title']);
                $isPublished = $index < 3;

                $page = DocumentationPage::query()->updateOrCreate(
                    [
                        'space_id' => $space->id,
                        'slug'     => $slug,
                    ],
                    [
                        'title'          => $pageDefinition['title'],
                        'summary'        => $pageDefinition['summary'],
                        'content'        => $this->pageContent($space->name, $pageDefinition['title'], $pageDefinition['summary']),
                        'status'         => $isPublished ? DocumentationPageStatus::Published : DocumentationPageStatus::Draft,
                        'module'         => $config['module'],
                        'audience'       => 'all',
                        'is_published'   => $isPublished,
                        'published_at'   => $isPublished ? now()->subDays($index + 1) : null,
                        'sort_order'     => $index + 1,
                        'template_id'    => $template?->id,
                        'company_id'     => $companyId,
                        'creator_id'     => $creatorId,
                        'last_editor_id' => $creatorId,
                    ]
                );

                $this->seedInitialVersion($page, $creatorId);
                $pageCount++;
            }
        }

        return $pageCount;
    }

    private function seedInitialVersion(DocumentationPage $page, int $creatorId): void
    {
        $exists = DocumentationPageVersion::query()
            ->where('page_id', $page->id)
            ->where('version_number', 1)
            ->exists();

        if ($exists) {
            return;
        }

        DocumentationPageVersion::query()->create([
            'page_id'        => $page->id,
            'version_number' => 1,
            'title'          => $page->title,
            'summary'        => $page->summary,
            'content'        => $page->content,
            'change_note'    => 'Initial seeded version',
            'creator_id'     => $creatorId,
        ]);
    }

    private function templateBody(string $title, string $intro): string
    {
        return <<<HTML
<h2>{$title}</h2>
<p>{$intro}</p>
<h3>Sections</h3>
<ul>
    <li>Overview</li>
    <li>Details</li>
    <li>Related links</li>
</ul>
HTML;
    }

    private function pageContent(string $spaceName, string $title, string $summary): string
    {
        return <<<HTML
<h2>{$title}</h2>
<p><strong>Space:</strong> {$spaceName}</p>
<p>{$summary}</p>
<p>This is placeholder content for the Documentation Hub seed. Replace with final copy, diagrams, and links as the space matures.</p>
<h3>Next steps</h3>
<ul>
    <li>Review accuracy with the space owner.</li>
    <li>Add screenshots or API examples where relevant.</li>
    <li>Publish when approved for the target audience.</li>
</ul>
HTML;
    }
}
