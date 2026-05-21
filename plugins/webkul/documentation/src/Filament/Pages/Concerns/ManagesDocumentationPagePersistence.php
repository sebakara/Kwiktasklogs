<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\ValidationException;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPageVersionService;
use Webkul\Documentation\Services\DocumentationSlugService;

trait ManagesDocumentationPagePersistence
{
    /**
     * @param  array<string, mixed>  $validated
     */
    protected function persistPage(array $validated, bool $publish, ?string $changeNote = null): DocumentationPage
    {
        $space = DocumentationSpace::query()->findOrFail($validated['space_id']);

        $this->validateParentPage($validated);

        $validated['parent_id'] = ! empty($validated['parent_id']) ? (int) $validated['parent_id'] : null;
        $validated['tag_ids'] = $validated['tag_ids'] ?? [];

        if ($this->isCreating) {
            Gate::authorize('createInSpace', [DocumentationPage::class, $space]);
        } elseif ($this->record !== null) {
            Gate::authorize('update', $this->record);

            if ((int) $this->record->space_id !== (int) $space->id) {
                Gate::authorize('createInSpace', [DocumentationPage::class, $space]);
            }
        }

        $slugService = app(DocumentationSlugService::class);
        $validated['slug'] = ($validated['slug'] ?? '') !== ''
            ? $validated['slug']
            : $slugService->uniqueFor(
                $this->record ?? new DocumentationPage,
                $validated['title'],
                scopes: ['space_id' => $space->id],
            );

        $tagIds = $validated['tag_ids'] ?? [];
        unset($validated['tag_ids']);

        $validated['last_editor_id'] = auth()->id();
        $validated['company_id'] = $space->company_id;
        $validated['space_id'] = $space->id;

        if ($publish) {
            $validated['status'] = DocumentationPageStatus::Published->value;
            $validated['is_published'] = true;
            $validated['published_at'] = $this->record?->published_at ?? now();
        } else {
            $validated['status'] = DocumentationPageStatus::Draft->value;
            $validated['is_published'] = false;
            $validated['published_at'] = null;
        }

        $wasPublished = (bool) $this->record?->is_published;

        $versionService = app(DocumentationPageVersionService::class);
        $auditService = app(DocumentationAuditService::class);

        if ($this->isCreating) {
            $page = DocumentationPage::query()->create([
                ...$validated,
                'creator_id' => auth()->id(),
            ]);

            $page->tags()->sync($tagIds);

            $version = $versionService->createSnapshot(
                $page,
                $changeNote ?? __('documentation::filament/hub.versions.initial'),
            );

            $auditService->log(
                DocumentationAuditAction::Created,
                auth()->user(),
                page: $page,
            );

            $auditService->log(
                DocumentationAuditAction::VersionCreated,
                auth()->user(),
                page: $page,
                metadata: [
                    'version_id'     => $version->id,
                    'version_number' => $version->version_number,
                ],
            );

            if ($publish) {
                $auditService->log(
                    DocumentationAuditAction::Published,
                    auth()->user(),
                    page: $page,
                );
            }

            return $page;
        }

        $existing = $this->record;
        $shouldSnapshot = $versionService->shouldCreateSnapshot($existing, $validated, $publish);

        $existing?->update($validated);
        $page = $existing->fresh();
        $page->tags()->sync($tagIds);

        if ($shouldSnapshot) {
            $version = $versionService->createSnapshot(
                $page,
                $changeNote ?? ($publish
                    ? __('documentation::filament/hub.versions.published')
                    : __('documentation::filament/hub.versions.updated')),
            );

            $auditService->log(
                DocumentationAuditAction::VersionCreated,
                auth()->user(),
                page: $page,
                metadata: [
                    'version_id'     => $version->id,
                    'version_number' => $version->version_number,
                ],
            );
        }

        $auditService->log(
            DocumentationAuditAction::Updated,
            auth()->user(),
            page: $page,
        );

        if ($publish && ! $wasPublished) {
            $auditService->log(
                DocumentationAuditAction::Published,
                auth()->user(),
                page: $page,
            );
        } elseif (! $publish && $wasPublished) {
            $auditService->log(
                DocumentationAuditAction::Unpublished,
                auth()->user(),
                page: $page,
            );
        }

        return $page;
    }

    /**
     * @param  array<string, mixed>  $validated
     */
    protected function validateParentPage(array $validated): void
    {
        $parentId = $validated['parent_id'] ?? null;

        if ($parentId === null) {
            return;
        }

        $parent = DocumentationPage::query()->find($parentId);

        if ($parent === null || (int) $parent->space_id !== (int) $validated['space_id']) {
            throw ValidationException::withMessages([
                'parent_id' => [__('documentation::filament/hub.pages.validation.invalid_parent')],
            ]);
        }

        if ($this->record !== null) {
            $excluded = array_merge([$this->record->id], $this->descendantIds($this->record));

            if (in_array((int) $parentId, $excluded, true)) {
                throw ValidationException::withMessages([
                    'parent_id' => [__('documentation::filament/hub.pages.validation.circular_parent')],
                ]);
            }
        }
    }

    /**
     * @return array<int, int>
     */
    protected function descendantIds(DocumentationPage $page): array
    {
        $ids = [];
        $children = DocumentationPage::query()
            ->where('parent_id', $page->id)
            ->pluck('id');

        foreach ($children as $childId) {
            $ids[] = $childId;
            $child = DocumentationPage::query()->find($childId);

            if ($child) {
                $ids = array_merge($ids, $this->descendantIds($child));
            }
        }

        return $ids;
    }

    /**
     * @return array<string, mixed>
     */
    protected function pageValidationRules(): array
    {
        return [
            'title'     => ['required', 'string', 'max:255'],
            'slug'      => ['nullable', 'string', 'max:255'],
            'summary'   => ['nullable', 'string'],
            'content'   => ['nullable', 'string'],
            'space_id'  => ['required', 'integer', 'exists:documentation_spaces,id'],
            'parent_id' => [
                'nullable',
                'integer',
                'exists:documentation_pages,id',
            ],
            'tag_ids'   => ['nullable', 'array'],
            'tag_ids.*' => ['integer', 'exists:documentation_tags,id'],
        ];
    }
}
