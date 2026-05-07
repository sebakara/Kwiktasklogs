<?php

namespace Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages;

use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Project\Models\Project;

class CreateDocumentationArticle extends CreateRecord
{
    protected static string $resource = DocumentationArticleResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $projectIdFromQuery = request()->integer('project') ?: request()->integer('project_id');

        if ($projectIdFromQuery) {
            $data['project_id'] = $projectIdFromQuery;
        }

        $this->assertUserMayCreateForProject((int) ($data['project_id'] ?? 0));

        $projectId = (int) ($data['project_id'] ?? 0);
        if ($projectId) {
            $documentationAssigneeId = Project::query()->whereKey($projectId)->value('documentation_assignee_id');
            if ($documentationAssigneeId) {
                $data['creator_id'] = (int) $documentationAssigneeId;
            }
        }

        $data['slug'] = $this->generateUniqueSlug((string) ($data['title'] ?? 'documentation'));

        return $data;
    }

    private function generateUniqueSlug(string $title): string
    {
        $baseSlug = Str::slug($title);
        $baseSlug = $baseSlug !== '' ? $baseSlug : 'documentation';
        $slug = $baseSlug;
        $counter = 2;

        while (DocumentationArticle::query()->where('slug', $slug)->exists()) {
            $slug = "{$baseSlug}-{$counter}";
            $counter++;
        }

        return $slug;
    }

    private function assertUserMayCreateForProject(int $projectId): void
    {
        $user = Auth::user();

        if (! $user) {
            return;
        }

        if ($user->can('create_documentation_article')) {
            return;
        }

        if ($projectId && Project::query()->whereKey($projectId)->where('documentation_assignee_id', $user->id)->exists()) {
            return;
        }

        throw ValidationException::withMessages([
            'project_id' => __('documentation::filament/resources/documentation-article.form.validation.project_not_allowed'),
        ]);
    }
}
