<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Services\DocumentationAccessService;

class ManageDocumentation extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'manage';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-cog-6-tooth';

    protected static ?int $navigationSort = 10;

    protected string $view = 'documentation::filament.hub.manage.index';

    /** @var array<int, array{label: string, description: string, url: string, icon: string}> */
    public array $links = [];

    public function mount(): void
    {
        $user = auth()->user();

        if ($user === null) {
            return;
        }

        $access = app(DocumentationAccessService::class);

        if ($access->canManageHub($user)) {
            $this->links[] = [
                'label'       => __('documentation::filament/hub.nav.spaces'),
                'description' => __('documentation::filament/hub.manage.spaces_help'),
                'url'         => ListSpaces::getUrl(),
                'icon'        => 'heroicon-o-rectangle-stack',
            ];
        }

        if ($access->canManageTemplates($user)) {
            $this->links[] = [
                'label'       => __('documentation::filament/hub.nav.templates'),
                'description' => __('documentation::filament/hub.manage.templates_help'),
                'url'         => ManageTemplates::getUrl(),
                'icon'        => 'heroicon-o-document-duplicate',
            ];
        }

        if ($access->canManagePermissions($user)) {
            $this->links[] = [
                'label'       => __('documentation::filament/hub.nav.permissions'),
                'description' => __('documentation::filament/hub.manage.permissions_help'),
                'url'         => ManagePermissions::getUrl(),
                'icon'        => 'heroicon-o-shield-check',
            ];
        }

        if ($access->canViewAuditLogs($user)) {
            $this->links[] = [
                'label'       => __('documentation::filament/hub.nav.audit_logs'),
                'description' => __('documentation::filament/hub.manage.audit_help'),
                'url'         => ManageAuditLogs::getUrl(),
                'icon'        => 'heroicon-o-clipboard-document-list',
            ];
        }
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.manage');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }

    public static function canAccess(): bool
    {
        $user = auth()->user();

        if ($user === null) {
            return false;
        }

        $access = app(DocumentationAccessService::class);

        return InteractsWithDocumentationHubAuthorization::canAccess()
            && (
                $access->canManageHub($user)
                || $access->canManageTemplates($user)
                || $access->canManagePermissions($user)
                || $access->canViewAuditLogs($user)
            );
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.manage.title');
    }
}
