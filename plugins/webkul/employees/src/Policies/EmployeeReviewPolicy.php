<?php

namespace Webkul\Employee\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Employee\Models\EmployeeReview;
use Webkul\Security\Models\User;

class EmployeeReviewPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can('view_any_employee_employee::review');
    }

    public function view(User $user, EmployeeReview $employeeReview): bool
    {
        return $user->can('view_employee_employee::review');
    }

    public function create(User $user): bool
    {
        return $user->can('create_employee_employee::review');
    }

    public function update(User $user, EmployeeReview $employeeReview): bool
    {
        if (! $user->can('update_employee_employee::review')) {
            return false;
        }

        return $employeeReview->status === EmployeeReviewStatus::Draft;
    }

    public function delete(User $user, EmployeeReview $employeeReview): bool
    {
        if (! $user->can('delete_employee_employee::review')) {
            return false;
        }

        return $employeeReview->status === EmployeeReviewStatus::Draft;
    }
}
