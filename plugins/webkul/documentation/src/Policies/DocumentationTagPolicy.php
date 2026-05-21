<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationTag;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationTagPolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->isViewer($user);
    }

    public function view(User $user, DocumentationTag $tag): bool
    {
        return $this->access()->isViewer($user);
    }

    public function create(User $user): bool
    {
        return $this->access()->canManageTags($user) || $this->access()->isEditor($user);
    }

    public function update(User $user, DocumentationTag $tag): bool
    {
        return $this->access()->canManageTags($user);
    }

    public function delete(User $user, DocumentationTag $tag): bool
    {
        return $this->access()->canManageTags($user);
    }

    public function restore(User $user, DocumentationTag $tag): bool
    {
        return $this->access()->canManageTags($user);
    }

    public function forceDelete(User $user, DocumentationTag $tag): bool
    {
        return $this->access()->isSuperAdmin($user);
    }
}
