<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Security\Models\Role;
use Illuminate\Auth\Access\HandlesAuthorization;

class RolePolicy
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
        return $authUser->can('view_any_role');
    }

    public function view(AuthUser $authUser, Role $role): bool
    {
        return $authUser->can('view_role');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_role');
    }

    public function update(AuthUser $authUser, Role $role): bool
    {
        return $authUser->can('update_role');
    }

    public function delete(AuthUser $authUser, Role $role): bool
    {
        return $authUser->can('delete_role');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_role');
    }

}