<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationShareLinkPolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->isEditor($user);
    }

    public function view(User $user, DocumentationShareLink $shareLink): bool
    {
        return $this->access()->canViewPage($user, $shareLink->page);
    }

    public function create(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canEditPage($user, $page);
    }

    public function update(User $user, DocumentationShareLink $shareLink): bool
    {
        return $this->access()->canEditPage($user, $shareLink->page);
    }

    public function delete(User $user, DocumentationShareLink $shareLink): bool
    {
        return $this->access()->canEditPage($user, $shareLink->page)
            || $this->access()->canManageHub($user);
    }
}
