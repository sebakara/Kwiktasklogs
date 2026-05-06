<?php

namespace App\Policies;

use App\Models\Document;
use Webkul\Security\Models\User;

class DocumentPolicy
{
    public function viewAny(User $user): bool
    {
        return $this->isHrUser($user);
    }

    public function view(User $user, Document $document): bool
    {
        return $this->isHrUser($user)
            || $document->assignments()->where('user_id', $user->id)->exists();
    }

    public function create(User $user): bool
    {
        return $this->isHrUser($user);
    }

    public function assign(User $user, Document $document): bool
    {
        return $this->isHrUser($user);
    }

    public function sign(User $user, Document $document): bool
    {
        return $document->assignments()->where('user_id', $user->id)->exists();
    }

    private function isHrUser(User $user): bool
    {
        return $user->hasRole(['hr', 'admin', 'super-admin'])
            || $user->can('create_employee_employee::employee')
            || $user->can('update_employee_employee::employee');
    }
}
