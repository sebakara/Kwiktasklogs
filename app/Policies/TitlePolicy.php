<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Partner\Models\Title;
use Illuminate\Auth\Access\HandlesAuthorization;

class TitlePolicy
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
        return $authUser->can('view_any_partner_title');
    }

    public function view(AuthUser $authUser, Title $title): bool
    {
        return $authUser->can('view_partner_title');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_partner_title');
    }

    public function update(AuthUser $authUser, Title $title): bool
    {
        return $authUser->can('update_partner_title');
    }

    public function delete(AuthUser $authUser, Title $title): bool
    {
        return $authUser->can('delete_partner_title');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_partner_title');
    }

}