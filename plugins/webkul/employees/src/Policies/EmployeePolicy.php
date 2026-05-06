<?php

namespace Webkul\Employee\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\Security\Traits\HasScopedPermissions;

class EmployeePolicy
{
    use HandlesAuthorization, HasScopedPermissions;

    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->can('view_any_employee_employee')
            || $user->can('view_employee_employee');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Employee $employee): bool
    {
        if (! $user->can('view_employee_employee')) {
            return false;
        }

        if ($user->can('view_any_employee_employee')) {
            return $this->hasAccess($user, $employee, 'coach');
        }

        return $this->ownsEmployeeProfile($user, $employee);
    }

    /**
     * True when this employee HR row belongs to the signed-in user's profile (portal / self-service).
     */
    private function ownsEmployeeProfile(User $user, Employee $employee): bool
    {
        $userEmail = mb_strtolower(trim((string) $user->email));
        $workEmail = mb_strtolower(trim((string) ($employee->work_email ?? '')));
        $privateEmail = mb_strtolower(trim((string) ($employee->private_email ?? '')));

        return (int) ($employee->user_id ?? 0) === (int) $user->id
            || ($userEmail !== '' && ($workEmail === $userEmail || $privateEmail === $userEmail));
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->can('create_employee_employee');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Employee $employee): bool
    {
        if (! $user->can('update_employee_employee')) {
            return false;
        }

        return $this->hasAccess($user, $employee, 'coach');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Employee $employee): bool
    {
        if (! $user->can('delete_employee_employee')) {
            return false;
        }

        return $this->hasAccess($user, $employee, 'coach');
    }

    /**
     * Determine whether the user can bulk delete.
     */
    public function deleteAny(User $user): bool
    {
        return $user->can('delete_any_employee_employee');
    }

    /**
     * Determine whether the user can permanently delete.
     */
    public function forceDelete(User $user, Employee $employee): bool
    {
        if (! $user->can('force_delete_employee_employee')) {
            return false;
        }

        return $this->hasAccess($user, $employee, 'coach');
    }

    /**
     * Determine whether the user can permanently bulk delete.
     */
    public function forceDeleteAny(User $user): bool
    {
        return $user->can('force_delete_any_employee_employee');
    }

    /**
     * Determine whether the user can restore.
     */
    public function restore(User $user, Employee $employee): bool
    {
        if (! $user->can('restore_employee_employee')) {
            return false;
        }

        return $this->hasAccess($user, $employee, 'coach');
    }
}
