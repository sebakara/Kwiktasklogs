<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditLogPresenter;

class ManageAuditLogs extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'audit-logs';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-clipboard-document-list';

    protected static ?int $navigationSort = 4;

    protected string $view = 'documentation::filament.hub.audit-logs.index';

    public string $filterAction = 'all';

    /** @var array<int, array<string, mixed>> */
    public array $logs = [];

    public function mount(): void
    {
        Gate::authorize('viewAny', DocumentationAuditLog::class);

        $this->loadLogs();
    }

    public function updatedFilterAction(): void
    {
        $this->loadLogs();
    }

    public function setFilterAction(string $action): void
    {
        $this->filterAction = $action;
        $this->loadLogs();
    }

    protected function loadLogs(): void
    {
        $query = DocumentationAuditLog::query()
            ->with(['user:id,name', 'page:id,title', 'space:id,name'])
            ->orderByDesc('created_at');

        if ($this->filterAction !== 'all') {
            $query->where('action', $this->filterAction);
        }

        $presenter = app(DocumentationAuditLogPresenter::class);

        $this->logs = $query
            ->limit(200)
            ->get()
            ->map(fn (DocumentationAuditLog $log): array => $presenter->format($log))
            ->all();
    }

    /**
     * @return array<string, string>
     */
    public function filterOptions(): array
    {
        return [
            'all'                                                => __('documentation::filament/hub.audit.filters.all'),
            DocumentationAuditAction::Created->value             => __('documentation::filament/hub.audit.actions.created'),
            DocumentationAuditAction::Updated->value             => __('documentation::filament/hub.audit.actions.updated'),
            DocumentationAuditAction::Published->value           => __('documentation::filament/hub.audit.actions.published'),
            DocumentationAuditAction::Archived->value            => __('documentation::filament/hub.audit.actions.archived'),
            DocumentationAuditAction::Deleted->value             => __('documentation::filament/hub.audit.actions.deleted'),
            DocumentationAuditAction::PermissionChanged->value   => __('documentation::filament/hub.audit.actions.permission_changed'),
            DocumentationAuditAction::Shared->value              => __('documentation::filament/hub.audit.actions.shared'),
            DocumentationAuditAction::ShareRevoked->value        => __('documentation::filament/hub.audit.actions.share_revoked'),
            DocumentationAuditAction::VersionRestored->value     => __('documentation::filament/hub.audit.actions.version_restored'),
        ];
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.audit_logs');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }

    public static function canAccess(): bool
    {
        $user = auth()->user();

        return InteractsWithDocumentationHubAuthorization::canAccess()
            && $user !== null
            && app(DocumentationAccessService::class)->canViewAuditLogs($user);
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.audit.title');
    }
}
