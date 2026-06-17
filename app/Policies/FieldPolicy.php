<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Field\Models\Field;
use Illuminate\Auth\Access\HandlesAuthorization;

class FieldPolicy
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
        return $authUser->can('view_any_field_field');
    }

    public function view(AuthUser $authUser, Field $field): bool
    {
        return $authUser->can('view_field_field');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_field_field');
    }

    public function update(AuthUser $authUser, Field $field): bool
    {
        return $authUser->can('update_field_field');
    }

    public function delete(AuthUser $authUser, Field $field): bool
    {
        return $authUser->can('delete_field_field');
    }

    public function deleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('delete_any_field_field');
    }

    public function restore(AuthUser $authUser, Field $field): bool
    {
        return $authUser->can('restore_field_field');
    }

    public function restoreAny(AuthUser $authUser): bool
    {
        return $authUser->can('restore_any_field_field');
    }

    public function forceDelete(AuthUser $authUser, Field $field): bool
    {
        return $authUser->can('force_delete_field_field');
    }

    public function forceDeleteAny(AuthUser $authUser): bool
    {
        return $authUser->can('force_delete_any_field_field');
    }

    public function reorder(AuthUser $authUser): bool
    {
        return $authUser->can('reorder_field_field');
    }

}