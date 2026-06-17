<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Partner\Models\Industry;
use Illuminate\Auth\Access\HandlesAuthorization;

class IndustryPolicy
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
        return $authUser->can('view_any_partner_industry');
    }

    public function view(AuthUser $authUser, Industry $industry): bool
    {
        return $authUser->can('view_partner_industry');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_partner_industry');
    }

    public function update(AuthUser $authUser, Industry $industry): bool
    {
        return $authUser->can('update_partner_industry');
    }

    public function delete(AuthUser $authUser, Industry $industry): bool
    {
        return $authUser->can('delete_partner_industry');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_partner_industry');
    }

    public function restore(AuthUser $authUser, Industry $industry): bool
    {
        return $authUser->can('restore_partner_industry');
    }

    public function restoreAny(AuthUser $authUser): bool
    {
        return $authUser->can('restore_any_partner_industry');
    }

    public function forceDelete(AuthUser $authUser, Industry $industry): bool
    {
        return $authUser->can('force_delete_partner_industry');
    }

    public function forceDeleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('force_delete_any_partner_industry');
    }

}