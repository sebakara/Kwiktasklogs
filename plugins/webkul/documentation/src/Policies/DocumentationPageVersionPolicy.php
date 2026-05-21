<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationPageVersionPolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canViewPage($user, $page);
    }

    public function view(User $user, DocumentationPageVersion $version): bool
    {
        return $this->access()->canViewPage($user, $version->page);
    }

    public function create(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canEditPage($user, $page);
    }

    public function restore(User $user, DocumentationPageVersion $version): bool
    {
        return $this->access()->canEditPage($user, $version->page);
    }
}
