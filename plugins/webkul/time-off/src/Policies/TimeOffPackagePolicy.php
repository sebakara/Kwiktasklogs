<?php

namespace Webkul\TimeOff\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Security\Models\User;
use Webkul\TimeOff\Models\TimeOffPackage;

class TimeOffPackagePolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can('view_any_time_off_time::off::package');
    }

    public function view(User $user, TimeOffPackage $timeOffPackage): bool
    {
        return $user->can('view_time_off_time::off::package');
    }

    public function create(User $user): bool
    {
        return $user->can('create_time_off_time::off::package');
    }

    public function update(User $user, TimeOffPackage $timeOffPackage): bool
    {
        return $user->can('update_time_off_time::off::package');
    }

    public function delete(User $user, TimeOffPackage $timeOffPackage): bool
    {
        return $user->can('delete_time_off_time::off::package');
    }

    public function deleteAny(User $user): bool
    {
        return $user->can('delete_any_time_off_time::off::package');
    }

    public function assign(User $user, TimeOffPackage $timeOffPackage): bool
    {
        return $user->can('update_time_off_time::off::package');
    }
}
