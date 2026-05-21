<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAuditService;

trait ManagesDocumentationSpaceActions
{
    use InteractsWithDocumentationHubActions;

    public function archiveSpace(int $spaceId): void
    {
        $this->runHubAction(function () use ($spaceId): string {
            $space = DocumentationSpace::query()->findOrFail($spaceId);

            Gate::authorize('update', $space);

            $space->update(['is_active' => false]);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::Archived,
                auth()->user(),
                $space,
            );

            $this->afterSpaceMutation($space);

            return __('documentation::filament/hub.spaces.archived');
        });
    }

    public function restoreSpace(int $spaceId): void
    {
        $this->runHubAction(function () use ($spaceId): string {
            $space = DocumentationSpace::query()->findOrFail($spaceId);

            Gate::authorize('update', $space);

            $space->update(['is_active' => true]);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::Restored,
                auth()->user(),
                $space,
            );

            $this->afterSpaceMutation($space);

            return __('documentation::filament/hub.spaces.restored');
        });
    }

    public function deleteSpace(int $spaceId): void
    {
        $this->runHubAction(function () use ($spaceId): string {
            $space = DocumentationSpace::query()->findOrFail($spaceId);

            Gate::authorize('delete', $space);

            $space->delete();

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::Deleted,
                auth()->user(),
                $space,
            );

            $this->afterSpaceMutation($space, deleted: true);

            return __('documentation::filament/hub.spaces.deleted');
        });
    }

    protected function afterSpaceMutation(DocumentationSpace $space, bool $deleted = false): void
    {
        //
    }
}
