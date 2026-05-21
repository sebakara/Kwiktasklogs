<?php

namespace Webkul\Documentation\Observers;

use Webkul\Documentation\Services\DocumentationProjectIntegration;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;
use Webkul\Project\Models\Project;

class ProjectDocumentationObserver
{
    public function created(Project $project): void
    {
        if (! DocumentationProjectIntegration::shouldAutoProvisionSpace()) {
            return;
        }

        app(DocumentationSpaceProvisioningService::class)->provisionForProject($project);
    }
}
