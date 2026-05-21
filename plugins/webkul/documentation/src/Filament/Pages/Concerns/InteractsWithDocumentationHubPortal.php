<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Webkul\Documentation\Filament\Pages\HubDashboard;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationPageHierarchyService;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;

trait InteractsWithDocumentationHubPortal
{
    public DocumentationSpace $space;

    /** @var array<int, array<string, mixed>> */
    public array $pageTree = [];

    public bool $canCreatePage = false;

    public bool $canEditPage = false;

    public ?string $portalCatalogLabel = null;

    public ?string $portalCatalogUrl = null;

    protected function bootPortalReader(DocumentationSpace $space, ?DocumentationPage $currentPage = null): void
    {
        $this->space = $space->loadMissing(['project:id,name', 'product:id,name']);

        $user = auth()->user();
        $access = app(DocumentationAccessService::class);

        if ($user) {
            $this->canCreatePage = $access->canCreatePageInSpace($user, $this->space);
            $this->canEditPage = $currentPage !== null && $access->canEditPage($user, $currentPage);
        }

        $this->pageTree = app(DocumentationPageHierarchyService::class)
            ->treeForSpace($this->space->id)
            ->all();

        $this->portalCatalogLabel = $this->space->project?->name
            ?? $this->space->product?->name
            ?? $this->space->name;

        $this->portalCatalogUrl = $this->space->project_id
            ? HubDashboard::getUrl().'?tab=projects'
            : ($this->space->product_id
                ? HubDashboard::getUrl().'?tab=products'
                : HubDashboard::getUrl());
    }

    public function createPageUrl(): ?string
    {
        if (! $this->canCreatePage) {
            return null;
        }

        return app(DocumentationSpaceProvisioningService::class)->createPageUrl($this->space);
    }
}
