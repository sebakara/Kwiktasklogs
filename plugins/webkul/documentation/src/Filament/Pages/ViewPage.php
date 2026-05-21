<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubActions;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubPortal;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditLogPresenter;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPageWorkflowService;
use Webkul\Documentation\Services\DocumentationShareLinkService;
use Webkul\Documentation\Services\DocumentationTableOfContentsService;

class ViewPage extends Page
{
    use InteractsWithDocumentationHubActions;
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use InteractsWithDocumentationHubPortal;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}/pages/{pageRecord}';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.pages.show';

    public DocumentationPage $record;

    public string $renderedContent = '';

    /** @var array<int, array{id: string, level: int, text: string}> */
    public array $tableOfContents = [];

    public bool $shareModalOpen = false;

    public string $shareVisibility = 'public';

    public string $sharePassword = '';

    public ?string $shareExpiresAt = null;

    /** @var array<int, array<string, mixed>> */
    public array $shareLinks = [];

    /** @var array<int, array<string, mixed>> */
    public array $pageAuditLogs = [];

    public function mount(int|string $documentationSpace, int|string $pageRecord): void
    {
        $spaceRecord = DocumentationSpace::query()->findOrFail($documentationSpace);

        $this->record = DocumentationPage::query()
            ->where('space_id', $spaceRecord->id)
            ->with(['creator:id,name', 'lastEditor:id,name', 'tags', 'parent:id,title'])
            ->findOrFail($pageRecord);

        Gate::authorize('view', $this->record);

        $this->bootPortalReader($spaceRecord, $this->record);

        $processed = app(DocumentationTableOfContentsService::class)->process($this->record->content);

        $this->renderedContent = $processed['content'];
        $this->tableOfContents = $processed['items'];

        $this->loadPageAuditLogs();
    }

    protected function loadPageAuditLogs(): void
    {
        $user = auth()->user();

        if ($user === null || ! app(DocumentationAccessService::class)->canViewPageAuditLogs($user, $this->record)) {
            $this->pageAuditLogs = [];

            return;
        }

        $trackedActions = [
            DocumentationAuditAction::Created,
            DocumentationAuditAction::Updated,
            DocumentationAuditAction::Published,
            DocumentationAuditAction::Unpublished,
            DocumentationAuditAction::Archived,
            DocumentationAuditAction::Deleted,
            DocumentationAuditAction::PermissionChanged,
            DocumentationAuditAction::Shared,
            DocumentationAuditAction::ShareRevoked,
            DocumentationAuditAction::VersionCreated,
            DocumentationAuditAction::VersionRestored,
        ];

        $presenter = app(DocumentationAuditLogPresenter::class);

        $this->pageAuditLogs = DocumentationAuditLog::query()
            ->where('page_id', $this->record->id)
            ->whereIn('action', array_map(fn (DocumentationAuditAction $action) => $action->value, $trackedActions))
            ->with('user:id,name')
            ->orderByDesc('created_at')
            ->limit(15)
            ->get()
            ->map(fn (DocumentationAuditLog $log): array => $presenter->format($log))
            ->all();
    }

    public function openShareModal(): void
    {
        Gate::authorize('create', [DocumentationShareLink::class, $this->record]);

        $this->resetShareForm();
        $this->loadShareLinks();
        $this->shareModalOpen = true;
    }

    public function closeShareModal(): void
    {
        $this->shareModalOpen = false;
        $this->resetShareForm();
    }

    public function createShareLink(): void
    {
        $this->runHubAction(function (): ?string {
            Gate::authorize('create', [DocumentationShareLink::class, $this->record]);

            if (! $this->record->is_published) {
                $this->notifyHubError(__('documentation::filament/hub.share.unpublished'));

                return null;
            }

            $validated = $this->validate([
                'shareVisibility'   => ['required', 'string', Rule::enum(DocumentationShareLinkVisibility::class)],
                'sharePassword'     => [
                    Rule::requiredIf($this->shareVisibility === DocumentationShareLinkVisibility::Restricted->value),
                    'nullable',
                    'string',
                    'min:4',
                    'max:255',
                ],
                'shareExpiresAt' => ['nullable', 'date', 'after:now'],
            ]);

            app(DocumentationShareLinkService::class)->create($this->record, [
                'visibility'  => $validated['shareVisibility'],
                'password'    => $validated['sharePassword'] ?: null,
                'expires_at'  => $validated['shareExpiresAt'] ?: null,
            ]);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::Shared,
                auth()->user(),
                page: $this->record,
            );

            $this->resetShareForm();
            $this->loadShareLinks();
            $this->loadPageAuditLogs();

            return __('documentation::filament/hub.share.created');
        });
    }

    public function revokeShareLink(int $linkId): void
    {
        $this->runHubAction(function () use ($linkId): string {
            $link = DocumentationShareLink::query()
                ->where('page_id', $this->record->id)
                ->findOrFail($linkId);

            Gate::authorize('update', $link);

            app(DocumentationShareLinkService::class)->revoke($link);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::ShareRevoked,
                auth()->user(),
                page: $this->record,
                metadata: ['share_link_id' => $link->id],
            );

            $this->loadShareLinks();
            $this->loadPageAuditLogs();

            return __('documentation::filament/hub.share.revoked');
        });
    }

    protected function loadShareLinks(): void
    {
        $service = app(DocumentationShareLinkService::class);

        $this->shareLinks = $this->record->shareLinks()
            ->with('creator:id,name')
            ->orderByDesc('created_at')
            ->get()
            ->map(fn (DocumentationShareLink $link): array => [
                'id'           => $link->id,
                'url'          => $service->publicUrl($link),
                'visibility'   => $link->visibility?->value ?? $link->visibility,
                'is_active'    => $link->is_active,
                'is_expired'   => $link->isExpired(),
                'expires_at'   => $link->expires_at?->toDayDateTimeString(),
                'view_count'   => $link->view_count,
                'creator_name' => $link->creator?->name,
                'created_at'   => $link->created_at?->diffForHumans(),
                'can_revoke'   => $link->is_active && ! $link->isExpired(),
            ])
            ->all();
    }

    protected function resetShareForm(): void
    {
        $this->shareVisibility = DocumentationShareLinkVisibility::Public->value;
        $this->sharePassword = '';
        $this->shareExpiresAt = null;
    }

    /**
     * Suppress the cluster sub-navigation sidebar — the portal-layout has its
     * own sidebar, so the Filament sub-navigation panel is redundant here.
     */
    public function getSubNavigation(): array
    {
        return [];
    }

    /**
     * Suppress the Filament page heading — the portal-layout blade renders
     * its own breadcrumb + title so the fi-header element is not needed.
     */
    public function getTitle(): string|Htmlable
    {
        return $this->record->title;
    }

    public function getHeading(): string|Htmlable
    {
        return '';
    }

    public function getBreadcrumbs(): array
    {
        return [];
    }

    public function getSubheading(): string|Htmlable|null
    {
        return null;
    }

    /** Used by portal-layout to render the subtitle under the title. */
    public function getPageSubheading(): string|Htmlable|null
    {
        $summary = trim((string) $this->record->summary);

        return $summary !== '' ? $summary : null;
    }

    public function spaceBackUrl(): ?string
    {
        return ViewSpace::getUrl(['documentationSpace' => $this->space->id]);
    }

    public function editUrl(): ?string
    {
        $user = auth()->user();

        if ($user === null || ! app(DocumentationAccessService::class)->canEditPage($user, $this->record)) {
            return null;
        }

        return EditPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record->id,
        ]);
    }

    public function canShare(): bool
    {
        $user = auth()->user();

        return $user !== null
            && Gate::forUser($user)->allows('create', [DocumentationShareLink::class, $this->record]);
    }

    public function canViewPageAuditLogs(): bool
    {
        $user = auth()->user();

        return $user !== null
            && app(DocumentationAccessService::class)->canViewPageAuditLogs($user, $this->record);
    }

    public function versionsUrl(): string
    {
        return PageVersions::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record->id,
        ]);
    }

    public function canPublishPage(): bool
    {
        return $this->canEditPage && ! $this->record->is_published;
    }

    public function canUnpublishPage(): bool
    {
        return $this->canEditPage && $this->record->is_published;
    }

    public function publishPage(): void
    {
        $this->runHubAction(function (): string {
            Gate::authorize('update', $this->record);

            app(DocumentationPageWorkflowService::class)->publish($this->record, auth()->user());
            $this->record = $this->record->fresh();
            $this->loadPageAuditLogs();

            return __('documentation::filament/hub.pages.published');
        });
    }

    public function unpublishPage(): void
    {
        $this->runHubAction(function (): string {
            Gate::authorize('update', $this->record);

            app(DocumentationPageWorkflowService::class)->unpublish($this->record, auth()->user());
            $this->record = $this->record->fresh();
            $this->loadPageAuditLogs();

            return __('documentation::filament/hub.pages.unpublished');
        });
    }
}
