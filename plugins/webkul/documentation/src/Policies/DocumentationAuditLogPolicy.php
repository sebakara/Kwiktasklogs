<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Policies\Concerns\InteractsWithDocumentationAccess;
use Webkul\Security\Models\User;

class DocumentationAuditLogPolicy
{
    use HandlesAuthorization, InteractsWithDocumentationAccess;

    public function viewAny(User $user): bool
    {
        return $this->access()->canViewAuditLogs($user);
    }

    public function view(User $user, DocumentationAuditLog $auditLog): bool
    {
        return $this->access()->canViewAuditLogs($user);
    }
}
