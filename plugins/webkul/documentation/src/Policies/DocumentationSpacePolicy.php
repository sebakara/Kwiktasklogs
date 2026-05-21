<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationSpacePolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->canAccessHub($user);
    }

    public function view(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->canViewSpace($user, $space);
    }

    public function create(User $user): bool
    {
        return $this->access()->canManageSpaces($user);
    }

    public function update(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->canEditSpace($user, $space);
    }

    public function delete(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->canManageHub($user);
    }

    public function restore(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->canManageHub($user);
    }

    public function forceDelete(User $user, DocumentationSpace $space): bool
    {
        return $this->access()->isSuperAdmin($user);
    }
}
