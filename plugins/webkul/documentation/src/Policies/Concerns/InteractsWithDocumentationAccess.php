<?php

namespace Webkul\Documentation\Policies\Concerns;

use Webkul\Documentation\Services\DocumentationAccessService;

trait InteractsWithDocumentationAccess
{
    protected function access(): DocumentationAccessService
    {
        return app(DocumentationAccessService::class);
    }
}
