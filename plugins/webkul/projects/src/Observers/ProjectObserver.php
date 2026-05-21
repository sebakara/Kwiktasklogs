<?php

namespace Webkul\Project\Observers;

use Webkul\Project\Models\Project;
use Webkul\Project\Services\ProjectAssignmentNotifier;

class ProjectObserver
{
    public function created(Project $project): void
    {
        app(ProjectAssignmentNotifier::class)->notifyOnCreate($project);
    }
}
