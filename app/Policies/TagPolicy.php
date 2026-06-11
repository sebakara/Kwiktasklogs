<?php

declare(strict_types=1);

namespace App\Policies;

use Illuminate\Foundation\Auth\User as AuthUser;
use Webkul\Partner\Models\Tag;
use Illuminate\Auth\Access\HandlesAuthorization;

class TagPolicy
{
    use HandlesAuthorization;
    
    public function viewAny(AuthUser $authUser, Tag $tag): bool
    {
        return $authUser->can('view_any_partner_tag');
    }

    public function view(AuthUser $authUser, Tag $tag): bool
    {
        return $authUser->can('view_partner_tag');
    }

    public function create(AuthUser $authUser): bool
    {
        return $authUser->can('create_partner_tag');
    }

    public function update(AuthUser $authUser, Tag $tag): bool
    {
        return $authUser->can('update_partner_tag');
    }

    public function delete(AuthUser $authUser, Tag $tag): bool
    {
        return $authUser->can('delete_partner_tag');
    }

    public function deleteAny(AuthUser $authUser, Tag $tag): bool
    {
        return $authUser->can('delete_any_partner_tag');
    }

}