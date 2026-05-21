<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationTemplatePolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->isViewer($user);
    }

    public function view(User $user, DocumentationTemplate $template): bool
    {
        return $this->access()->isViewer($user);
    }

    public function create(User $user): bool
    {
        return $this->access()->canManageTemplates($user);
    }

    public function update(User $user, DocumentationTemplate $template): bool
    {
        return $this->access()->canManageTemplates($user);
    }

    public function delete(User $user, DocumentationTemplate $template): bool
    {
        return $this->access()->canManageTemplates($user);
    }

    public function restore(User $user, DocumentationTemplate $template): bool
    {
        return $this->access()->canManageTemplates($user);
    }

    public function forceDelete(User $user, DocumentationTemplate $template): bool
    {
        return $this->access()->isSuperAdmin($user);
    }
}
