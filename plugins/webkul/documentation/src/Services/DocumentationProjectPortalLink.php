<?php

namespace Webkul\Documentation\Services;

use Webkul\Documentation\Filament\Pages\OpenProjectDocumentation;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource;
use Webkul\PluginManager\Package;
use Webkul\Project\Models\Project;

class DocumentationProjectPortalLink
{
    /**
     * URL to open project documentation (portal reader when hub is installed).
     */
    public static function urlForProject(int $projectId): string
    {
        if (! Package::isPluginInstalled('documentation')) {
            return DocumentationArticleResource::getUrl('index', [
                'project' => $projectId,
            ]);
        }

        $project = Project::query()->find($projectId);

        if ($project === null) {
            return OpenProjectDocumentation::portalUrl($projectId);
        }

        return OpenProjectDocumentation::portalUrl($project->id);
    }
}
