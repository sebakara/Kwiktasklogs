<?php

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Illuminate\Auth\Access\HandlesAuthorization;

class PartnerPolicy
{
    use HandlesAuthorization;
    
    public function viewAny(AuthUser $authUser): bool
    {
        return $authUser->can('view_any_partner_partner');
    }

    public function view(AuthUser $authUser): bool
    {
        return $authUser->can('view_partner_partner');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_partner_partner');
    }

    public function update(AuthUser $authUser): bool
    {
        return $authUser->can('update_partner_partner');
    }

    public function delete(AuthUser $authUser): bool
    {
        return $authUser->can('delete_partner_partner');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_partner_partner');
    }

    public function restore(AuthUser $authUser): bool
    {
        return $authUser->can('restore_partner_partner');
    }

    public function restoreAny(AuthUser $authUser): bool
    {
        return $authUser->can('restore_any_partner_partner');
    }

    public function forceDelete(AuthUser $authUser): bool
    {
        return $authUser->can('force_delete_partner_partner');
    }

    public function forceDeleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('force_delete_any_partner_partner');
    }

}