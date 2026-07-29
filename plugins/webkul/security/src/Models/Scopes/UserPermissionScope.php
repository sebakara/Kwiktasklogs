<?php

namespace Webkul\Security\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Illuminate\Support\Facades\Auth;
use Webkul\Security\Enums\PermissionType;

class UserPermissionScope implements Scope
{
    protected $ownerRelation;

    /**
     * Create a new scope instance.
     */
    public function __construct(string $ownerRelation)
    {
        $this->ownerRelation = $ownerRelation;
    }

    /**
     * Apply the scope to a given Eloquent query builder.
     */
    public function apply(Builder $builder, Model $model): void
    {
        $user = Auth::user();

        if (! $user?->resource_permission) {
            return;
        }

        if ($user->resource_permission === PermissionType::GLOBAL) {
            return;
        }

        $table = $model->getTable();
        $hasDocumentationAssigneeColumn = $model->getConnection()->getSchemaBuilder()->hasColumn(
            $table,
            'documentation_assignee_id',
        );

        if ($user->resource_permission === PermissionType::INDIVIDUAL) {
            $builder->where(function ($q) use ($user, $table, $hasDocumentationAssigneeColumn) {
                $q->whereHas($this->ownerRelation, function ($q2) use ($user) {
                    $q2->where('users.id', $user->id);
                });

                $q->orWhereHas('followers', function ($q2) use ($user) {
                    $q2->where('chatter_followers.partner_id', $user->partner_id);
                });

                if ($hasDocumentationAssigneeColumn) {
                    $q->orWhere($table.'.documentation_assignee_id', $user->id);
                }

                if (method_exists($q->getModel(), 'members')) {
                    $q->orWhereHas('members', function ($q2) use ($user) {
                        $q2->where('users.id', $user->id);
                    });
                }
            });
        }

        if ($user->resource_permission === PermissionType::GROUP) {
            $teamIds = $user->teams()->pluck('id');

            $builder->whereHas("$this->ownerRelation.teams", function ($q) use ($teamIds) {
                $q->whereIn('teams.id', $teamIds);
            });

            if ($hasDocumentationAssigneeColumn) {
                $builder->orWhere($table.'.documentation_assignee_id', $user->id);
            }
        }
    }
}
