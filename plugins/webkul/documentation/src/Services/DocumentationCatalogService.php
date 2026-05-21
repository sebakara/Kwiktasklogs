<?php

namespace Webkul\Documentation\Services;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Schema;
use Webkul\Documentation\Filament\Pages\OpenProductDocumentation;
use Webkul\Documentation\Filament\Pages\OpenProjectDocumentation;
use Webkul\Documentation\Models\DocumentationProduct;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationCatalogService
{
    public function __construct(
        protected DocumentationAccessService $access,
        protected DocumentationHubQueryService $queries,
    ) {}

    /**
     * @return Collection<int, array<string, mixed>>
     */
    public function projects(User $user, ?string $search = null, int $limit = 48): Collection
    {
        if (! DocumentationProjectIntegration::isAvailable()) {
            return collect();
        }

        $query = Project::query()
            ->where('is_active', true)
            ->orderBy('name');

        if (! $this->access->canManageHub($user) && ! $user->can('view_any_project_project')) {
            $accessibleProjectIds = $this->accessibleProjectIds($user);

            if ($accessibleProjectIds === []) {
                return collect();
            }

            $query->whereIn('id', $accessibleProjectIds);
        }

        if ($search !== null && trim($search) !== '') {
            $like = '%'.trim($search).'%';
            $query->where(function (Builder $builder) use ($like): void {
                $builder->where('name', 'like', $like)
                    ->orWhere('description', 'like', $like);
            });
        }

        return $query
            ->limit($limit)
            ->get()
            ->map(fn (Project $project): array => $this->mapProject($project));
    }

    /**
     * @return Collection<int, array<string, mixed>>
     */
    public function products(User $user, ?string $search = null, int $limit = 48): Collection
    {
        if (! $this->tableExists('documentation_products')) {
            return collect();
        }

        $query = DocumentationProduct::query()
            ->active()
            ->orderBy('sort_order')
            ->orderBy('name');

        if (! $this->access->canManageHub($user)) {
            $productIds = DocumentationSpace::query()
                ->whereNotNull('product_id')
                ->when(true, fn (Builder $spaceQuery) => $this->access->applyAccessibleSpaceScope($spaceQuery, $user))
                ->pluck('product_id')
                ->unique()
                ->filter()
                ->values()
                ->all();

            if ($productIds === []) {
                return collect();
            }

            $query->whereIn('id', $productIds);
        }

        if ($search !== null && trim($search) !== '') {
            $like = '%'.trim($search).'%';
            $query->where(function (Builder $builder) use ($like): void {
                $builder->where('name', 'like', $like)
                    ->orWhere('description', 'like', $like)
                    ->orWhere('slug', 'like', $like);
            });
        }

        return $query
            ->limit($limit)
            ->get()
            ->map(fn (DocumentationProduct $product): array => $this->mapProduct($product));
    }

    /**
     * @return array<int, int>
     */
    protected function accessibleProjectIds(User $user): array
    {
        $ids = DocumentationProjectIntegration::projectIdsForAssignee($user)->all();

        $spaceProjectIds = DocumentationSpace::query()
            ->whereNotNull('project_id')
            ->when(true, fn (Builder $query) => $this->access->applyAccessibleSpaceScope($query, $user))
            ->pluck('project_id')
            ->all();

        $ids = array_merge($ids, $spaceProjectIds);

        if ($user->can('view_any_project_project')) {
            return array_values(array_unique($ids));
        }

        $viewable = Project::query()
            ->where('is_active', true)
            ->whereIn('id', array_unique($ids))
            ->get()
            ->filter(fn (Project $project): bool => Gate::forUser($user)->allows('view', $project))
            ->pluck('id')
            ->all();

        return array_values(array_unique(array_merge($ids, $viewable)));
    }

    /**
     * @return array<string, mixed>
     */
    protected function mapProject(Project $project): array
    {
        $pagesCount = DocumentationSpace::query()
            ->where('project_id', $project->id)
            ->withCount('pages')
            ->first()
            ?->pages_count;

        return [
            'id'          => $project->id,
            'name'        => $project->name,
            'description' => $project->description,
            'color'       => $project->color ?? '#3b82f6',
            'pages_count' => $pagesCount,
            'url'         => OpenProjectDocumentation::portalUrl($project->id),
        ];
    }

    /**
     * @return array<string, mixed>
     */
    protected function mapProduct(DocumentationProduct $product): array
    {
        $pagesCount = $product->spaces()->withCount('pages')->first()?->pages_count;

        return [
            'id'          => $product->id,
            'name'        => $product->name,
            'description' => $product->description,
            'color'       => $product->color ?? '#8b5cf6',
            'pages_count' => $pagesCount,
            'url'         => OpenProductDocumentation::portalUrl($product->id),
        ];
    }

    protected function tableExists(string $table): bool
    {
        return Schema::hasTable($table);
    }
}
