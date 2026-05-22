<?php

namespace Webkul\Documentation\Filament\Clusters;

use Filament\Clusters\Cluster;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Security\Models\User;

class DocumentationHubCluster extends Cluster
{
    public static function canAccess(): bool
    {
        $user = auth()->user();

        if (! $user instanceof User) {
            return false;
        }

        return app(DocumentationAccessService::class)->canAccessProjectDocumentationPortal($user);
    }

    protected static ?string $slug = 'documentation';

    protected static ?int $navigationSort = 1;

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.portal.catalog_title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('admin.navigation.documentation');
    }

    public static function getNavigationIcon(): ?string
    {
        return 'heroicon-o-book-open';
    }
}
