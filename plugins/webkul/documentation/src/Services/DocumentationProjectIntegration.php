<?php

namespace Webkul\Documentation\Services;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Schema;
use Webkul\PluginManager\Package;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationProjectIntegration
{
    public static function isAvailable(): bool
    {
        return Schema::hasTable('projects_projects')
            && Schema::hasColumn('projects_projects', 'documentation_assignee_id');
    }

    public static function shouldAutoProvisionSpace(): bool
    {
        if (! config('documentation.auto_provision_project_space', true)) {
            return false;
        }

        if (! Package::isPluginInstalled('documentation')) {
            return false;
        }

        return Schema::hasTable('projects_projects')
            && Schema::hasTable('documentation_spaces')
            && Schema::hasColumn('documentation_spaces', 'project_id')
            && Schema::hasTable('documentation_pages');
    }

    /**
     * @return Collection<int, int>
     */
    public static function projectIdsForAssignee(User $user): Collection
    {
        if (! self::isAvailable()) {
            return collect();
        }

        return Project::query()
            ->where('documentation_assignee_id', $user->id)
            ->pluck('id');
    }

    public static function assigneeHasAnyProject(User $user): bool
    {
        if (! self::isAvailable()) {
            return false;
        }

        return Project::query()
            ->where('documentation_assignee_id', $user->id)
            ->exists();
    }

    public static function isAssigneeForProject(User $user, ?int $projectId): bool
    {
        if ($projectId === null || ! self::isAvailable()) {
            return false;
        }

        return Project::query()
            ->whereKey($projectId)
            ->where('documentation_assignee_id', $user->id)
            ->exists();
    }

    public static function documentationAssigneeIdForProject(?int $projectId): ?int
    {
        if ($projectId === null || ! self::isAvailable()) {
            return null;
        }

        $assigneeId = Project::query()->whereKey($projectId)->value('documentation_assignee_id');

        return $assigneeId !== null ? (int) $assigneeId : null;
    }

    /**
     * Whether the user can see this project in the Projects module (same scopes as Filament).
     */
    public static function userCanViewProject(int $projectId): bool
    {
        if (! self::isAvailable()) {
            return false;
        }

        return Project::query()->whereKey($projectId)->exists();
    }

    /**
     * Whether the user has access to at least one project in the Projects module.
     */
    public static function userHasAnyAccessibleProject(): bool
    {
        if (! self::isAvailable()) {
            return false;
        }

        return Project::query()->exists();
    }

    /**
     * @return Collection<int, int>
     */
    public static function accessibleProjectIdsForUser(): Collection
    {
        if (! self::isAvailable()) {
            return collect();
        }

        return Project::query()->pluck('id');
    }
}
