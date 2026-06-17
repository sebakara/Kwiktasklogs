<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Support\Models\State;
use Illuminate\Auth\Access\HandlesAuthorization;

class StatePolicy
{
    use HandlesAuthorization;
    

    public function before(AuthUser $authUser, string $ability): ?bool
    {
        if ($authUser->roles()->whereIn('name', ['admin', 'super_admin'])->exists()) {
            return true;
        }

        return null;
    }
    public function viewAny(AuthUser $authUser): bool
    {
        return $authUser->can('view_any_support_state');
    }

    public function view(AuthUser $authUser, State $state): bool
    {
        return $authUser->can('view_support_state');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_support_state');
    }

    public function update(AuthUser $authUser, State $state): bool
    {
        return $authUser->can('update_support_state');
    }

    public function delete(AuthUser $authUser, State $state): bool
    {
        return $authUser->can('delete_support_state');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_support_state');
    }

}