<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Http\Requests\DocumentationSpaceRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationSpaceResource;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationSlugService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationSpaceController extends Controller
{
    protected array $allowedIncludes = ['parent', 'children', 'pages', 'company', 'creator'];

    public function __construct(
        protected DocumentationAccessService $accessService,
        protected DocumentationAuditService $auditService,
        protected DocumentationSlugService $slugService,
    ) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationSpace::class);

        $spaces = QueryBuilder::for(
            $this->accessService->applyAccessibleSpaceScope(DocumentationSpace::query(), request()->user())
        )
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('company_id'),
                AllowedFilter::exact('project_id'),
                AllowedFilter::exact('visibility'),
                AllowedFilter::exact('is_active'),
                AllowedFilter::partial('name'),
                AllowedFilter::trashed(),
            ])
            ->allowedSorts(['id', 'name', 'sort_order', 'created_at', 'updated_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationSpaceResource::collection($spaces);
    }

    public function store(DocumentationSpaceRequest $request)
    {
        Gate::authorize('create', DocumentationSpace::class);

        $data = $request->validated();
        $data['slug'] = $data['slug'] ?? $this->slugService->uniqueFor(
            new DocumentationSpace,
            $data['name'],
            scopes: array_filter(['company_id' => $data['company_id'] ?? null])
        );

        $space = DocumentationSpace::query()->create($data);

        $this->auditService->log(DocumentationAuditAction::Created, request()->user(), $space);

        return (new DocumentationSpaceResource($space->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation space created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $id)
    {
        $space = QueryBuilder::for(DocumentationSpace::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $space);

        return new DocumentationSpaceResource($space);
    }

    public function update(DocumentationSpaceRequest $request, string $id)
    {
        $space = DocumentationSpace::query()->findOrFail($id);

        Gate::authorize('update', $space);

        $data = $request->validated();

        if (isset($data['name']) && ! isset($data['slug'])) {
            $data['slug'] = $this->slugService->uniqueFor(
                $space,
                $data['name'],
                scopes: array_filter(['company_id' => $data['company_id'] ?? $space->company_id])
            );
        }

        $space->update($data);

        $this->auditService->log(DocumentationAuditAction::Updated, request()->user(), $space);

        return (new DocumentationSpaceResource($space->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation space updated successfully.']);
    }

    public function destroy(string $id)
    {
        $space = DocumentationSpace::query()->findOrFail($id);

        Gate::authorize('delete', $space);

        $space->delete();

        $this->auditService->log(DocumentationAuditAction::Deleted, request()->user(), $space);

        return response()->json(['message' => 'Documentation space deleted successfully.']);
    }

    public function restore(string $id)
    {
        $space = DocumentationSpace::withTrashed()->findOrFail($id);

        Gate::authorize('restore', $space);

        $space->restore();

        $this->auditService->log(DocumentationAuditAction::Restored, request()->user(), $space);

        return (new DocumentationSpaceResource($space->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation space restored successfully.']);
    }

    public function forceDestroy(string $id)
    {
        $space = DocumentationSpace::withTrashed()->findOrFail($id);

        Gate::authorize('forceDelete', $space);

        $space->forceDelete();

        return response()->json(['message' => 'Documentation space permanently deleted.']);
    }
}
