<?php

namespace Webkul\Documentation\Services;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\User;

class DocumentationHubQueryService
{
    public function __construct(
        protected DocumentationAccessService $access,
    ) {}

    /**
     * @return Collection<int, DocumentationPage>
     */
    public function recentPages(User $user, int $limit = 8): Collection
    {
        $query = DocumentationPage::query()
            ->with('space:id,name,slug,color')
            ->orderByDesc('updated_at');

        $this->access->applyAccessiblePageScope($query, $user);

        return $query->limit($limit)->get();
    }

    /**
     * @return Collection<int, DocumentationSpace>
     */
    public function assignedSpaces(User $user, int $limit = 6): Collection
    {
        $assignedIds = $this->assignedSpaceIdsForUser($user);

        if ($assignedIds === []) {
            return collect();
        }

        $query = DocumentationSpace::query()
            ->withCount('pages')
            ->whereIn('id', $assignedIds)
            ->active()
            ->orderBy('sort_order')
            ->orderBy('name');

        $this->access->applyAccessibleSpaceScope($query, $user);

        return $query->limit($limit)->get();
    }

    /**
     * @return Collection<int, DocumentationPage>
     */
    public function popularPages(User $user, int $limit = 6): Collection
    {
        $accessiblePageQuery = DocumentationPage::query()->select('id');
        $this->access->applyAccessiblePageScope($accessiblePageQuery, $user);
        $accessiblePageIds = $accessiblePageQuery->pluck('id');

        if ($accessiblePageIds->isEmpty()) {
            return collect();
        }

        $popularIds = DocumentationAuditLog::query()
            ->selectRaw('page_id, COUNT(*) as view_count')
            ->where('action', DocumentationAuditAction::Viewed)
            ->whereIn('page_id', $accessiblePageIds)
            ->where('created_at', '>=', now()->subDays(90))
            ->groupBy('page_id')
            ->orderByDesc('view_count')
            ->limit($limit)
            ->pluck('page_id');

        if ($popularIds->isNotEmpty()) {
            return DocumentationPage::query()
                ->with('space:id,name,slug,color')
                ->whereIn('id', $popularIds)
                ->where('is_published', true)
                ->get()
                ->sortBy(fn (DocumentationPage $page) => array_search($page->id, $popularIds->all(), true))
                ->values();
        }

        $fallback = DocumentationPage::query()
            ->with('space:id,name,slug,color')
            ->where('is_published', true)
            ->orderByDesc('updated_at');

        $this->access->applyAccessiblePageScope($fallback, $user);

        return $fallback->limit($limit)->get();
    }

    /**
     * @return array{spaces: Collection<int, DocumentationSpace>, pages: Collection<int, DocumentationPage>}
     */
    public function search(User $user, string $term, int $limit = 10): array
    {
        $term = trim($term);

        if ($term === '') {
            return ['spaces' => collect(), 'pages' => collect()];
        }

        $like = '%'.$term.'%';

        $spacesQuery = DocumentationSpace::query()
            ->withCount('pages')
            ->where(function (Builder $query) use ($like): void {
                $query->where('name', 'like', $like)
                    ->orWhere('description', 'like', $like)
                    ->orWhere('slug', 'like', $like);
            })
            ->orderBy('name');

        $this->access->applyAccessibleSpaceScope($spacesQuery, $user);

        $pagesQuery = DocumentationPage::query()
            ->with('space:id,name,slug,color')
            ->where(function (Builder $query) use ($like): void {
                $query->where('title', 'like', $like)
                    ->orWhere('summary', 'like', $like)
                    ->orWhere('slug', 'like', $like);
            })
            ->orderByDesc('updated_at');

        $this->access->applyAccessiblePageScope($pagesQuery, $user);

        return [
            'spaces' => $spacesQuery->limit($limit)->get(),
            'pages'  => $pagesQuery->limit($limit)->get(),
        ];
    }

    /**
     * @return array<int, int>
     */
    public function assignedSpaceIdsForUser(User $user): array
    {
        $permissionSpaceIds = DocumentationPermission::query()
            ->where('permissionable_type', DocumentationSpace::class)
            ->where(function (Builder $query) use ($user): void {
                $query->where('user_id', $user->id);

                $teamIds = $user->teams()->pluck('teams.id');

                if ($teamIds->isNotEmpty()) {
                    $query->orWhereIn('team_id', $teamIds);
                }
            })
            ->pluck('permissionable_id');

        $creatorSpaceIds = DocumentationSpace::query()
            ->where('creator_id', $user->id)
            ->pluck('id');

        $projectIds = DocumentationProjectIntegration::projectIdsForAssignee($user);

        $projectSpaceIds = collect();

        if ($projectIds->isNotEmpty()) {
            $projectSpaceIds = DocumentationSpace::query()
                ->whereIn('project_id', $projectIds)
                ->pluck('id');
        }

        return $permissionSpaceIds
            ->merge($creatorSpaceIds)
            ->merge($projectSpaceIds)
            ->unique()
            ->values()
            ->all();
    }
}
