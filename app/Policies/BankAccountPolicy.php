<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Partner\Models\BankAccount;
use Illuminate\Auth\Access\HandlesAuthorization;

class BankAccountPolicy
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
        return $authUser->can('view_any_partner_bank::account');
    }

    public function view(AuthUser $authUser, BankAccount $bankAccount): bool
    {
        return $authUser->can('view_partner_bank::account');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_partner_bank::account');
    }

    public function update(AuthUser $authUser, BankAccount $bankAccount): bool
    {
        return $authUser->can('update_partner_bank::account');
    }

    public function delete(AuthUser $authUser, BankAccount $bankAccount): bool
    {
        return $authUser->can('delete_partner_bank::account');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_partner_bank::account');
    }

    public function restore(AuthUser $authUser, BankAccount $bankAccount): bool
    {
        return $authUser->can('restore_partner_bank::account');
    }

    public function restoreAny(AuthUser $authUser): bool
    {
        return $authUser->can('restore_any_partner_bank::account');
    }

    public function forceDelete(AuthUser $authUser, BankAccount $bankAccount): bool
    {
        return $authUser->can('force_delete_partner_bank::account');
    }

    public function forceDeleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('force_delete_any_partner_bank::account');
    }

}