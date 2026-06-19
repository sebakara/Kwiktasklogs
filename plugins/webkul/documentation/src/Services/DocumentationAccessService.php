<?php

namespace Webkul\Documentation\Services;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Webkul\Documentation\Enums\DocumentationHubRole;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;

class DocumentationAccessService
{
    public function resolveHubRole(?User $user): DocumentationHubRole
    {
        if ($user === null) {
            return DocumentationHubRole::PublicLink;
        }

        if ($this->isSuperAdmin($user)) {
            return DocumentationHubRole::SuperAdmin;
        }

        if ($this->isAdmin($user)) {
            return DocumentationHubRole::Admin;
        }

        if ($this->isEditor($user)) {
            return DocumentationHubRole::Editor;
        }

        // Project documentation assignees display as Editor even without a global editor permission
        if (DocumentationProjectIntegration::assigneeHasAnyProject($user)) {
            return DocumentationHubRole::Editor;
        }

        if ($this->isViewer($user)) {
            return DocumentationHubRole::Viewer;
        }

        if ($this->hasAnyExplicitGrant($user)) {
            return DocumentationHubRole::Viewer;
        }

        return DocumentationHubRole::Viewer;
    }

    public function canAccessHub(User $user): bool
    {
        return $this->isSuperAdmin($user)
            || $this->isAdmin($user)
            || $this->isEditor($user)
            || $this->isViewer($user)
            || $this->hasAnyExplicitGrant($user);
    }

    /**
     * Hub entry for users with documentation roles/grants or readable project documentation.
     */
    public function canAccessProjectDocumentationPortal(User $user): bool
    {
        return $this->canAccessHub($user)
            || DocumentationProjectIntegration::userHasAnyAccessibleProject();
    }

    public function isSuperAdmin(User $user): bool
    {
        if ($this->isPanelAdministrator($user)) {
            return true;
        }

        if ($user->can($this->permission('super_admin'))) {
            return true;
        }

        return $user->hasRole($this->roleName('super_admin'));
    }

    public function isAdmin(User $user): bool
    {
        if ($this->isSuperAdmin($user)) {
            return true;
        }

        if ($user->can($this->permission('manage'))) {
            return true;
        }

        // Check Shield permissions: update, delete, force delete indicate admin-level access
        try {
            if ($user->can('update_documentation_documentation::article') || $user->can('delete_documentation_documentation::article') || $user->can('force_delete_documentation_documentation::article')) {
                return true;
            }
        } catch (\Exception) {
            // Silently fail if Shield permissions don't exist
        }

        return $user->hasRole($this->roleName('admin'));
    }

    public function isEditor(User $user): bool
    {
        if ($this->isAdmin($user)) {
            return true;
        }

        if ($user->can($this->permission('editor'))) {
            return true;
        }

        // Check Shield permissions: create or update indicate editor-level access
        try {
            if ($user->can('create_documentation_documentation::article') || $user->can('update_documentation_documentation::article')) {
                return true;
            }
        } catch (\Exception) {
            // Silently fail if Shield permissions don't exist
        }

        return $user->hasRole($this->roleName('editor'));
    }

    public function isViewer(User $user): bool
    {
        if ($this->isEditor($user)) {
            return true;
        }

        if ($user->can($this->permission('viewer'))) {
            return true;
        }

        // Check Shield permissions: view_any_documentation_documentation::article indicates viewer-level access
        try {
            if ($user->can('view_any_documentation_documentation::article')) {
                return true;
            }
        } catch (\Exception) {
            // Silently fail if Shield permissions don't exist
        }

        return $user->hasRole($this->roleName('viewer'));
    }

    public function canManageHub(User $user): bool
    {
        return $this->isAdmin($user);
    }

    public function canManageSpaces(User $user): bool
    {
        return $this->canManageHub($user);
    }

    public function canManageTemplates(User $user): bool
    {
        return $this->canManageHub($user);
    }

    public function canManageTags(User $user): bool
    {
        return $this->canManageHub($user);
    }

    public function canManagePermissions(User $user): bool
    {
        return $this->canManageHub($user);
    }

    public function canViewAuditLogs(User $user): bool
    {
        return $this->canManageHub($user);
    }

    public function canViewPageAuditLogs(User $user, DocumentationPage $page): bool
    {
        return $this->canViewAuditLogs($user) || $this->canEditPage($user, $page);
    }

    public function canViewSpace(User $user, DocumentationSpace $space): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        if ($space->project_id !== null && DocumentationProjectIntegration::userCanViewProject((int) $space->project_id)) {
            return true;
        }

        if ($this->hasGrant($user, $space, DocumentationPermissionLevel::View)) {
            return true;
        }

        if ($this->canEditSpace($user, $space)) {
            return true;
        }

        return DocumentationPage::query()
            ->where('space_id', $space->id)
            ->where(function (Builder $query) use ($user): void {
                $this->applyAccessiblePageConstraints($query, $user);
            })
            ->exists();
    }

    public function canEditSpace(User $user, DocumentationSpace $space): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        if (! $this->isEditor($user)) {
            return false;
        }

        return $this->hasGrant($user, $space, DocumentationPermissionLevel::Edit)
            || $this->hasGrant($user, $space, DocumentationPermissionLevel::Manage);
    }

    public function canViewPage(User $user, DocumentationPage $page): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        if ($page->project_id !== null && DocumentationProjectIntegration::userCanViewProject((int) $page->project_id)) {
            return true;
        }

        if ($this->canEditPage($user, $page)) {
            return true;
        }

        if ($this->hasGrant($user, $page, DocumentationPermissionLevel::View)) {
            return true;
        }

        if ($page->space && $this->hasGrant($user, $page->space, DocumentationPermissionLevel::View)) {
            return $page->is_published || $this->canEditSpace($user, $page->space);
        }

        return $page->is_published
            && (
                in_array($page->id, $this->idsForUser($user, DocumentationPage::class, $this->viewLevels()), true)
                || in_array($page->space_id, $this->idsForUser($user, DocumentationSpace::class, $this->viewLevels()), true)
            );
    }

    public function canEditPage(User $user, DocumentationPage $page): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        // Project documentation assignees can edit pages in their assigned project
        // regardless of global editor permission — checked before the isEditor gate
        if ($this->isProjectDocumentationAssignee($user, $page->project_id)) {
            return true;
        }

        if (! $this->isEditor($user)) {
            return false;
        }

        if ($this->hasGrant($user, $page, DocumentationPermissionLevel::Edit)) {
            return true;
        }

        if ($this->hasGrant($user, $page, DocumentationPermissionLevel::Manage)) {
            return true;
        }

        if ($page->space && $this->hasGrant($user, $page->space, DocumentationPermissionLevel::Edit)) {
            return true;
        }

        if ($page->space && $this->hasGrant($user, $page->space, DocumentationPermissionLevel::Manage)) {
            return true;
        }

        return false;
    }

    public function canCreatePageInSpace(User $user, DocumentationSpace $space): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        if (! $this->isEditor($user)) {
            return false;
        }

        return $this->canEditSpace($user, $space);
    }

    public function canDeletePage(User $user, DocumentationPage $page): bool
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return true;
        }

        return $this->hasGrant($user, $page, DocumentationPermissionLevel::Manage)
            || ($page->space && $this->hasGrant($user, $page->space, DocumentationPermissionLevel::Manage));
    }

    /**
     * @param  Builder<DocumentationSpace>  $query
     * @return Builder<DocumentationSpace>
     */
    public function applyAccessibleSpaceScope(Builder $query, User $user): Builder
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return $query;
        }

        $editSpaceIds = $this->idsForUser($user, DocumentationSpace::class, [
            DocumentationPermissionLevel::Edit,
            DocumentationPermissionLevel::Manage,
        ]);

        $viewSpaceIds = $this->idsForUser($user, DocumentationSpace::class, $this->viewLevels());

        return $query->where(function (Builder $spaceQuery) use ($user, $editSpaceIds, $viewSpaceIds): void {
            $spaceQuery
                ->whereIn('id', array_merge($editSpaceIds, $viewSpaceIds))
                ->orWhereHas('pages', function (Builder $pageQuery) use ($user): void {
                    $this->applyAccessiblePageConstraints($pageQuery, $user);
                });
        });
    }

    /**
     * @param  Builder<DocumentationPage>  $query
     * @return Builder<DocumentationPage>
     */
    public function applyAccessiblePageScope(Builder $query, User $user): Builder
    {
        if ($this->isSuperAdmin($user) || $this->canManageHub($user)) {
            return $query;
        }

        return $query->where(function (Builder $pageQuery) use ($user): void {
            $this->applyAccessiblePageConstraints($pageQuery, $user);
        });
    }

    /**
     * @param  Builder<DocumentationPage>  $query
     */
    public function applyAccessiblePageConstraints(Builder $query, User $user): void
    {
        $editPageIds = $this->idsForUser($user, DocumentationPage::class, [
            DocumentationPermissionLevel::Edit,
            DocumentationPermissionLevel::Manage,
        ]);

        $editSpaceIds = $this->idsForUser($user, DocumentationSpace::class, [
            DocumentationPermissionLevel::Edit,
            DocumentationPermissionLevel::Manage,
        ]);

        $viewPageIds = $this->idsForUser($user, DocumentationPage::class, $this->viewLevels());

        $viewSpaceIds = $this->idsForUser($user, DocumentationSpace::class, $this->viewLevels());

        $projectIds = DocumentationProjectIntegration::accessibleProjectIdsForUser();

        $query->where(function (Builder $accessibleQuery) use ($editPageIds, $editSpaceIds, $viewPageIds, $viewSpaceIds, $projectIds): void {
            if ($editPageIds !== []) {
                $accessibleQuery->whereIn('id', $editPageIds);
            }

            if ($editSpaceIds !== []) {
                $accessibleQuery->orWhereIn('space_id', $editSpaceIds);
            }

            if ($viewPageIds !== [] || $viewSpaceIds !== []) {
                $accessibleQuery->orWhere(function (Builder $publishedQuery) use ($viewPageIds, $viewSpaceIds): void {
                    $publishedQuery->where('is_published', true)
                        ->where(function (Builder $publishedAccessQuery) use ($viewPageIds, $viewSpaceIds): void {
                            if ($viewPageIds !== []) {
                                $publishedAccessQuery->whereIn('id', $viewPageIds);
                            }

                            if ($viewSpaceIds !== []) {
                                $publishedAccessQuery->orWhereIn('space_id', $viewSpaceIds);
                            }
                        });
                });
            }

            if ($projectIds->isNotEmpty()) {
                $accessibleQuery->orWhereIn('project_id', $projectIds);
            }
        });
    }

    public function hasAnyExplicitGrant(User $user): bool
    {
        return $this->grantQueryForUser($user)->exists();
    }

    protected function hasGrant(User $user, ?Model $permissionable, DocumentationPermissionLevel $level): bool
    {
        if ($permissionable === null) {
            return false;
        }

        $levels = $this->levelsIncluding($level);

        return $this->grantQueryForUser($user)
            ->where('permissionable_type', $permissionable::class)
            ->where('permissionable_id', $permissionable->getKey())
            ->whereIn('permission', array_map(fn (DocumentationPermissionLevel $item) => $item->value, $levels))
            ->exists();
    }

    /**
     * @param  array<int, DocumentationPermissionLevel>  $levels
     * @return array<int, int>
     */
    protected function idsForUser(User $user, string $permissionableType, array $levels): array
    {
        $levelValues = array_map(
            fn (DocumentationPermissionLevel $level) => $level->value,
            $levels
        );

        return $this->grantQueryForUser($user)
            ->where('permissionable_type', $permissionableType)
            ->whereIn('permission', $levelValues)
            ->pluck('permissionable_id')
            ->unique()
            ->values()
            ->all();
    }

    /**
     * @return Builder<DocumentationPermission>
     */
    protected function grantQueryForUser(User $user): Builder
    {
        return DocumentationPermission::query()->where(function (Builder $query) use ($user): void {
            $query->where('user_id', $user->id);

            $roleIds = $user->roles()->pluck('roles.id');

            if ($roleIds->isNotEmpty()) {
                $query->orWhereIn('role_id', $roleIds);
            }

            $teamIds = $user->teams()->pluck('teams.id');

            if ($teamIds->isNotEmpty()) {
                $query->orWhereIn('team_id', $teamIds);
            }
        });
    }

    /**
     * @return array<int, DocumentationPermissionLevel>
     */
    protected function viewLevels(): array
    {
        return [
            DocumentationPermissionLevel::View,
            DocumentationPermissionLevel::Comment,
            DocumentationPermissionLevel::Edit,
            DocumentationPermissionLevel::Manage,
        ];
    }

    /**
     * @return array<int, DocumentationPermissionLevel>
     */
    protected function levelsIncluding(DocumentationPermissionLevel $level): array
    {
        return match ($level) {
            DocumentationPermissionLevel::View => [
                DocumentationPermissionLevel::View,
                DocumentationPermissionLevel::Comment,
                DocumentationPermissionLevel::Edit,
                DocumentationPermissionLevel::Manage,
            ],
            DocumentationPermissionLevel::Comment => [
                DocumentationPermissionLevel::Comment,
                DocumentationPermissionLevel::Edit,
                DocumentationPermissionLevel::Manage,
            ],
            DocumentationPermissionLevel::Edit => [
                DocumentationPermissionLevel::Edit,
                DocumentationPermissionLevel::Manage,
            ],
            DocumentationPermissionLevel::Manage => [
                DocumentationPermissionLevel::Manage,
            ],
        };
    }

    protected function isProjectDocumentationAssignee(User $user, ?int $projectId): bool
    {
        if ($projectId === null) {
            return false;
        }

        return DocumentationProjectIntegration::isAssigneeForProject($user, $projectId);
    }

    /**
     * Filament Shield panel administrators (e.g. the "Admin" role) always have full hub access.
     */
    protected function isPanelAdministrator(User $user): bool
    {
        $user->loadMissing('roles');

        return $user->roles->contains(
            fn ($role): bool => $role instanceof Role && $role->isSystemRole()
        );
    }

    protected function roleName(string $key): string
    {
        return (string) config("documentation.roles.{$key}");
    }

    protected function permission(string $key): string
    {
        return (string) config("documentation.permissions.{$key}");
    }
}
