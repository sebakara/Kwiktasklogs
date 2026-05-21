<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Http\Requests\DocumentationPermissionRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationPermissionResource;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPermissionAssignmentService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationPermissionController extends Controller
{
    protected array $allowedIncludes = ['user', 'company', 'creator'];

    public function __construct(
        protected DocumentationAuditService $auditService,
        protected DocumentationPermissionAssignmentService $assignmentService,
    ) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationPermission::class);

        $permissions = QueryBuilder::for(DocumentationPermission::class)
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('permission'),
                AllowedFilter::exact('permissionable_type'),
                AllowedFilter::exact('permissionable_id'),
                AllowedFilter::exact('user_id'),
                AllowedFilter::exact('team_id'),
                AllowedFilter::exact('company_id'),
            ])
            ->allowedSorts(['id', 'created_at', 'updated_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationPermissionResource::collection($permissions);
    }

    public function store(DocumentationPermissionRequest $request)
    {
        Gate::authorize('create', DocumentationPermission::class);

        $permission = $this->assignmentService->assign($request->validated());

        $this->auditService->log(
            DocumentationAuditAction::PermissionChanged,
            request()->user(),
            metadata: ['permission_id' => $permission->id, 'action' => 'created']
        );

        return (new DocumentationPermissionResource($permission->load(['user', 'creator'])))
            ->additional(['message' => 'Documentation permission created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $id)
    {
        $permission = QueryBuilder::for(DocumentationPermission::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $permission);

        return new DocumentationPermissionResource($permission);
    }

    public function update(DocumentationPermissionRequest $request, string $id)
    {
        $permission = DocumentationPermission::query()->findOrFail($id);

        Gate::authorize('update', $permission);

        $permission->update($request->validated());

        $this->auditService->log(
            DocumentationAuditAction::PermissionChanged,
            request()->user(),
            metadata: ['permission_id' => $permission->id, 'action' => 'updated']
        );

        return (new DocumentationPermissionResource($permission->load(['user', 'creator'])))
            ->additional(['message' => 'Documentation permission updated successfully.']);
    }

    public function destroy(string $id)
    {
        $permission = DocumentationPermission::query()->findOrFail($id);

        Gate::authorize('delete', $permission);

        $permission->delete();

        $this->auditService->log(
            DocumentationAuditAction::PermissionChanged,
            request()->user(),
            metadata: ['permission_id' => $permission->id, 'action' => 'deleted']
        );

        return response()->json(['message' => 'Documentation permission deleted successfully.']);
    }
}
