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

class PageVersions extends Page
{
    use InteractsWithDocumentationHubActions;
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use UsesCompactDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}/pages/{pageRecord}/versions';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.pages.versions';

    public DocumentationSpace $space;

    public DocumentationPage $record;

    /** @var array<int, array<string, mixed>> */
    public array $versions = [];

    public function mount(int|string $documentationSpace, int|string $pageRecord): void
    {
        $this->space = DocumentationSpace::query()->findOrFail($documentationSpace);

        $this->record = DocumentationPage::query()
            ->where('space_id', $this->space->id)
            ->findOrFail($pageRecord);

        Gate::authorize('viewAny', [DocumentationPageVersion::class, $this->record]);

        $this->loadVersions();
    }

    public function restoreVersion(int $versionId): void
    {
        $redirectUrl = null;

        $this->runHubAction(function () use ($versionId, &$redirectUrl): void {
            $version = DocumentationPageVersion::query()
                ->where('page_id', $this->record->id)
                ->findOrFail($versionId);

            Gate::authorize('restore', $version);

            $versionService = app(DocumentationPageVersionService::class);

            if ($versionService->isCurrentVersion($this->record, $version)) {
                $this->notifyHubError(__('documentation::filament/hub.versions.already_current'));

                return;
            }

            $restored = $versionService->restore($this->record, $version);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::VersionRestored,
                auth()->user(),
                page: $restored,
                metadata: [
                    'version_id'     => $version->id,
                    'version_number' => $version->version_number,
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

    protected function loadVersions(): void
    {
        $versionService = app(DocumentationPageVersionService::class);
        $access = app(DocumentationAccessService::class);
        $user = auth()->user();

        $this->versions = $this->record->versions()
            ->with('creator:id,name')
            ->orderByDesc('version_number')
            ->get()
            ->map(function (DocumentationPageVersion $version) use ($versionService, $access, $user): array {
                $isCurrent = $versionService->isCurrentVersion($this->record, $version);

                return [
                    'id'             => $version->id,
                    'version_number' => $version->version_number,
                    'title'          => $version->title,
                    'change_note'    => $version->change_note,
                    'creator_name'   => $version->creator?->name,
                    'created_at'     => $version->created_at?->toDayDateTimeString(),
                    'is_current'     => $isCurrent,
                    'view_url'       => ViewPageVersion::getUrl([
                        'documentationSpace' => $this->space->id,
                        'pageRecord'         => $this->record->id,
                        'version'            => $version->id,
                    ]),
                    'can_restore'    => $user && ! $isCurrent && $access->canEditPage($user, $this->record),
                ];
            })
            ->all();
    }

    public function pageUrl(): string
    {
        return ViewPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record->id,
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
}
