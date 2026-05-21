<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationPermissionPolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->canManagePermissions($user);
    }

    public function view(User $user, DocumentationPermission $permission): bool
    {
        return $this->access()->canManagePermissions($user);
    }

    public function create(User $user): bool
    {
        return $this->access()->canManagePermissions($user);
    }

    public function update(User $user, DocumentationPermission $permission): bool
    {
        return $this->access()->canManagePermissions($user);
    }

    public function delete(User $user, DocumentationPermission $permission): bool
    {
        return $this->access()->canManagePermissions($user);
    }
}
