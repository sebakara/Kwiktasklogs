<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Security\Models\Team;
use Illuminate\Auth\Access\HandlesAuthorization;

class TeamPolicy
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
        return $authUser->can('view_any_security_team');
    }

    public function view(AuthUser $authUser, Team $team): bool
    {
        return $authUser->can('view_security_team');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_security_team');
    }

    public function update(AuthUser $authUser, Team $team): bool
    {
        return $authUser->can('update_security_team');
    }

    public function delete(AuthUser $authUser, Team $team): bool
    {
        return $authUser->can('delete_security_team');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_security_team');
    }

}