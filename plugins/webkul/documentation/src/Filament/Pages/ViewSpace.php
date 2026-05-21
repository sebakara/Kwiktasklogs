<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationSpaceActions;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;

class ViewSpace extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use ManagesDocumentationSpaceActions;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.spaces.show';

    public DocumentationSpace $space;

    public bool $canEdit = false;

    public bool $canDelete = false;

    public bool $canCreatePage = false;

    /** @var array<int, array<string, mixed>> */
    public array $pageTree = [];

    public function mount(int|string $documentationSpace): void
    {
        $this->space = DocumentationSpace::query()
            ->with(['creator:id,name'])
            ->withCount('pages')
            ->findOrFail($documentationSpace);

        Gate::authorize('view', $this->space);

        $user = auth()->user();
        $access = app(DocumentationAccessService::class);

        if ($user) {
            $this->canEdit = $access->canEditSpace($user, $this->space);
            $this->canDelete = $access->canManageHub($user);
            $this->canCreatePage = $access->canCreatePageInSpace($user, $this->space);
        }

        $this->redirect(
            app(DocumentationSpaceProvisioningService::class)->defaultPageUrl($this->space),
            navigate: true,
        );
    }

    protected function afterSpaceMutation(DocumentationSpace $space, bool $deleted = false): void
    {
        if ($deleted) {
            $this->redirect(ListSpaces::getUrl());

            return;
        }

        $this->space = $space->fresh()->loadCount('pages');
    }

    public function getTitle(): string|Htmlable
    {
        return $this->space->name;
    }

    public function pageUrl(int $pageId): string
    {
        return ViewPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $pageId,
        ]);
    }

    public function editSpaceUrl(): ?string
    {
        return $this->canEdit ? EditSpace::getUrl(['documentationSpace' => $this->space->id]) : null;
    }

    public function createPageUrl(): ?string
    {
        if (! $this->canCreatePage) {
            return null;
        }

        return EditPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => 'create',
        ]);
    }
}
