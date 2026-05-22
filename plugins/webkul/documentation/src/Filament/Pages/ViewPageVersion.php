<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubActions;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\UsesCompactDocumentationHubLayout;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPageVersionService;
use Webkul\Documentation\Services\DocumentationTableOfContentsService;

class ViewPageVersion extends Page
{
    use InteractsWithDocumentationHubActions;
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use UsesCompactDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}/pages/{pageRecord}/versions/{version}';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.pages.version-show';

    public DocumentationSpace $space;

    public DocumentationPage $record;

    public DocumentationPageVersion $version;

    public string $renderedContent = '';

    /** @var array<int, array{id: string, level: int, text: string}> */
    public array $tableOfContents = [];

    public function mount(int|string $documentationSpace, int|string $pageRecord, int|string $version): void
    {
        $this->space = DocumentationSpace::query()->findOrFail($documentationSpace);

        $this->record = DocumentationPage::query()
            ->where('space_id', $this->space->id)
            ->findOrFail($pageRecord);

        $this->version = DocumentationPageVersion::query()
            ->where('page_id', $this->record->id)
            ->with('creator:id,name')
            ->findOrFail($version);

        Gate::authorize('view', $this->version);

        $processed = app(DocumentationTableOfContentsService::class)->process($this->version->content);

        $this->renderedContent = $processed['content'];
        $this->tableOfContents = $processed['items'];
    }

    public function restoreVersion(): void
    {
        $redirectUrl = null;

        $this->runHubAction(function () use (&$redirectUrl): void {
            Gate::authorize('restore', $this->version);

            $versionService = app(DocumentationPageVersionService::class);

            if ($versionService->isCurrentVersion($this->record, $this->version)) {
                $this->notifyHubError(__('documentation::filament/hub.versions.already_current'));

                return;
            }

            $restored = $versionService->restore($this->record, $this->version);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::VersionRestored,
                auth()->user(),
                page: $restored,
                metadata: [
                    'version_id'     => $this->version->id,
                    'version_number' => $this->version->version_number,
                ],
            );

            $redirectUrl = ViewPage::getUrl([
                'documentationSpace' => $this->space->id,
                'pageRecord'         => $this->record->id,
            ]);
        }, successTitle: __('documentation::filament/hub.versions.restored'));

        if ($redirectUrl !== null) {
            $this->redirect($redirectUrl);
        }
    }

    public function canRestore(): bool
    {
        $user = auth()->user();

        if ($user === null) {
            return false;
        }

        return ! app(DocumentationPageVersionService::class)->isCurrentVersion($this->record, $this->version)
            && app(DocumentationAccessService::class)->canEditPage($user, $this->record);
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.versions.view_title', [
            'number' => $this->version->version_number,
            'title'  => $this->version->title,
        ]);
    }

    /**
     * @return array<string, string>
     */
    public function getBreadcrumbs(): array
    {
        return [];
    }

    public function getHeading(): string|Htmlable|null
    {
        return null;
    }

    public function versionsUrl(): string
    {
        return PageVersions::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record->id,
        ]);
    }

    public function currentPageUrl(): string
    {
        return ViewPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record->id,
        ]);
    }
}
