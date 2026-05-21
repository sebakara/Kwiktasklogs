<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;
use Webkul\Project\Models\Project;

class OpenProjectDocumentation extends Page
{
    use InteractsWithDocumentationHubAuthorization;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'portal/projects/{project}';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.portal.redirect';

    public function mount(int|string $project): void
    {
        $record = Project::query()->findOrFail($project);

        $space = app(DocumentationSpaceProvisioningService::class)->forProject($record);

        Gate::authorize('view', $space);

        $this->redirect(
            app(DocumentationSpaceProvisioningService::class)->defaultPageUrl($space),
            navigate: true,
        );
    }

    public static function portalUrl(int $projectId): string
    {
        return static::getUrl(['project' => $projectId]);
    }
}
