<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Support\Models\Currency;
use Illuminate\Auth\Access\HandlesAuthorization;

class CurrencyPolicy
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
        return $authUser->can('view_any_support_currency');
    }

    public function view(AuthUser $authUser, Currency $currency): bool
    {
        return $authUser->can('view_support_currency');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_support_currency');
    }

    public function update(AuthUser $authUser, Currency $currency): bool
    {
        return $authUser->can('update_support_currency');
    }

    public function delete(AuthUser $authUser, Currency $currency): bool
    {
        return $authUser->can('delete_support_currency');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_support_currency');
    }

}