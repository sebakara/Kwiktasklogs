<?php

namespace Webkul\Documentation\Filament\Clusters;

use Filament\Clusters\Cluster;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationProjectIntegration;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationHubCluster extends Cluster
{
    public static function canAccess(): bool
    {
        $user = auth()->user();

        if (! $user instanceof User) {
            return false;
        }

        if (app(DocumentationAccessService::class)->canAccessHub($user)) {
            return true;
        }

        if ($user->can('view_any_project_project')) {
            return true;
        }

        if (DocumentationProjectIntegration::assigneeHasAnyProject($user)) {
            return true;
        }

        return Project::query()->where('user_id', $user->id)->exists();
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
