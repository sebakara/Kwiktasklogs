<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationPagePolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->canAccessHub($user);
    }

    public function view(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canViewPage($user, $page);
    }

    public function create(User $user): bool
    {
        return $this->access()->isEditor($user);
    }

    public function createInSpace(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->canCreatePageInSpace($user, $space);
    }

    public function update(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canEditPage($user, $page);
    }

    public function delete(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canDeletePage($user, $page);
    }

    public function restore(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canManageHub($user);
    }

    public function forceDelete(User $user, DocumentationPage $page): bool
    {
        return $this->access()->isSuperAdmin($user);
    }

    public function reorder(User $user): bool
    {
        return $this->access()->isEditor($user);
    }

    public function move(User $user, DocumentationPage $page): bool
    {
        return $this->access()->canEditPage($user, $page);
    }
}
