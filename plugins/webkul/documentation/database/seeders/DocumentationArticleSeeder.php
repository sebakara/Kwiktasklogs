<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationArticleSeeder extends Seeder
{
    public function run(): void
    {
        $projects = Project::query()
            ->select(['id', 'name', 'description'])
            ->orderBy('id')
            ->limit(20)
            ->get();

        if ($projects->isEmpty()) {
            $this->command?->warn('No projects found. Skipping documentation seed.');

            return;
        }

        $employeeUsers = User::query()
            ->select(['id', 'name'])
            ->where('is_active', true)
            ->whereHas('employee')
            ->orderBy('id')
            ->get();

        $fallbackUserId = User::query()->value('id');

        foreach ($projects as $projectIndex => $project) {
            $assignee = $employeeUsers->get($projectIndex % max($employeeUsers->count(), 1));
            $assigneeId = $assignee?->id ?? $fallbackUserId;
            $assigneeName = $assignee?->name ?? 'Assigned User';

            Project::query()->whereKey($project->id)->update([
                'documentation_assignee_id' => $assigneeId,
            ]);

            $records = [
                [
                    'title'        => "{$project->name} - Feature Overview",
                    'summary'      => 'High-level summary of this project and how teams should use it.',
                    'content'      => $this->overviewContent($project->name, (string) $project->description),
                    'audience'     => 'all',
                    'is_published' => true,
                ],
                [
                    'title'        => "{$project->name} - Employee Task Guide",
                    'summary'      => "Step-by-step guide for {$assigneeName} and the assigned team members.",
                    'content'      => $this->employeeGuideContent($project->name, $assigneeName),
                    'audience'     => 'employee',
                    'is_published' => true,
                ],
                [
                    'title'        => "{$project->name} - Manager Review Checklist",
                    'summary'      => 'Checklist for project managers to review progress and quality.',
                    'content'      => $this->managerChecklistContent($project->name),
                    'audience'     => 'manager',
                    'is_published' => false,
                ],
            ];

            foreach ($records as $sort => $record) {
                DocumentationArticle::query()->updateOrCreate(
                    ['slug' => Str::slug($record['title'])],
                    [
                        'title'        => $record['title'],
                        'module'       => 'Projects',
                        'project_id'   => $project->id,
                        'assignee_id'  => $assigneeId,
                        'creator_id'   => $assigneeId,
                        'summary'      => $record['summary'],
                        'content'      => $record['content'],
                        'audience'     => $record['audience'],
                        'is_published' => $record['is_published'],
                        'published_at' => $record['is_published'] ? now()->subDays($projectIndex) : null,
                        'sort_order'   => $sort + 1,
                    ]
                );
            }
        }

        $this->command?->info('Documentation articles seeded from existing projects.');
    }

    private function overviewContent(string $projectName, string $projectDescription): string
    {
        $description = trim($projectDescription) !== '' ? $projectDescription : 'No project description provided yet.';

        return <<<HTML
<h3>Project Overview</h3>
<p><strong>{$projectName}</strong> supports business delivery with a structured project flow.</p>
<p>{$description}</p>
<h4>How to use this project module</h4>
<ul>
    <li>Create and maintain project scope.</li>
    <li>Track tasks, milestones, and assignees.</li>
    <li>Review progress weekly and update statuses.</li>
</ul>
HTML;
    }

    private function employeeGuideContent(string $projectName, string $assigneeName): string
    {
        return <<<HTML
<h3>Employee Guide</h3>
<p>This guide explains the expected workflow for <strong>{$projectName}</strong>.</p>
<ol>
    <li>Open the project and review assigned tasks daily.</li>
    <li>Update task status before end of day.</li>
    <li>Add comments and blockers in task chatter.</li>
    <li>Notify your manager when milestone work is complete.</li>
</ol>
<p><strong>Primary assignee:</strong> {$assigneeName}</p>
HTML;
    }

    private function managerChecklistContent(string $projectName): string
    {
        return <<<HTML
<h3>Manager Checklist</h3>
<p>Use this checklist to review <strong>{$projectName}</strong>.</p>
<ul>
    <li>Verify current stage and milestone completion.</li>
    <li>Validate timesheet and effort quality.</li>
    <li>Review risks, blockers, and dependencies.</li>
    <li>Confirm next sprint priorities are clear.</li>
</ul>
HTML;
    }
}
