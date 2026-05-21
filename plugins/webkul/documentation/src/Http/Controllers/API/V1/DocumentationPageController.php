<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Http\Requests\DocumentationPageMoveRequest;
use Webkul\Documentation\Http\Requests\DocumentationPageReorderRequest;
use Webkul\Documentation\Http\Requests\DocumentationPageRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationPageResource;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPageHierarchyService;
use Webkul\Documentation\Services\DocumentationPageVersionService;
use Webkul\Documentation\Services\DocumentationSlugService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationPageController extends Controller
{
    protected array $allowedIncludes = [
        'space', 'parent', 'children', 'template', 'tags', 'versions', 'shareLinks', 'company', 'creator', 'lastEditor',
    ];

    public function __construct(
        protected DocumentationAccessService $accessService,
        protected DocumentationAuditService $auditService,
        protected DocumentationPageVersionService $versionService,
        protected DocumentationPageHierarchyService $hierarchyService,
        protected DocumentationSlugService $slugService,
    ) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationPage::class);

        $pages = QueryBuilder::for(
            $this->accessService->applyAccessiblePageScope(DocumentationPage::query(), request()->user())
        )
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('space_id'),
                AllowedFilter::exact('parent_id'),
                AllowedFilter::exact('template_id'),
                AllowedFilter::exact('project_id'),
                AllowedFilter::exact('company_id'),
                AllowedFilter::exact('status'),
                AllowedFilter::exact('is_published'),
                AllowedFilter::partial('title'),
                AllowedFilter::trashed(),
            ])
            ->allowedSorts(['id', 'title', 'sort_order', 'published_at', 'created_at', 'updated_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationPageResource::collection($pages);
    }

    public function store(DocumentationPageRequest $request)
    {
        $space = DocumentationSpace::query()->findOrFail($request->input('space_id'));

        Gate::authorize('createInSpace', [DocumentationPage::class, $space]);

        $data = $request->validated();
        $tagIds = $data['tag_ids'] ?? [];
        $changeNote = $data['change_note'] ?? null;
        unset($data['tag_ids'], $data['change_note']);

        $data['slug'] = $data['slug'] ?? $this->slugService->uniqueFor(
            new DocumentationPage,
            $data['title'],
            scopes: ['space_id' => $data['space_id']]
        );
        $data['last_editor_id'] = request()->id();

        return DB::transaction(function () use ($data, $tagIds, $changeNote, $request) {
            $page = DocumentationPage::query()->create($data);

            if ($request->has('tag_ids')) {
                $page->tags()->sync($tagIds);
            }

            $this->versionService->createSnapshot($page, $changeNote ?? 'Initial version');
            $this->auditService->log(DocumentationAuditAction::Created, request()->user(), page: $page);

            if ($page->is_published) {
                $this->auditService->log(DocumentationAuditAction::Published, request()->user(), page: $page);
            }

            return (new DocumentationPageResource($page->load(['space', 'tags', 'creator', 'lastEditor'])))
                ->additional(['message' => 'Documentation page created successfully.'])
                ->response()
                ->setStatusCode(201);
        });
    }

    public function show(string $id)
    {
        $page = QueryBuilder::for(DocumentationPage::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $page);

        $this->auditService->log(DocumentationAuditAction::Viewed, request()->user(), page: $page);

        return new DocumentationPageResource($page);
    }

    public function update(DocumentationPageRequest $request, string $id)
    {
        $page = DocumentationPage::query()->findOrFail($id);

        Gate::authorize('update', $page);

        $data = $request->validated();
        $tagIds = $data['tag_ids'] ?? null;
        $changeNote = $data['change_note'] ?? 'Content updated';
        unset($data['tag_ids'], $data['change_note']);

        $wasPublished = $page->is_published;
        $data['last_editor_id'] = request()->id();

        if (isset($data['title']) && ! isset($data['slug'])) {
            $data['slug'] = $this->slugService->uniqueFor(
                $page,
                $data['title'],
                scopes: ['space_id' => $data['space_id'] ?? $page->space_id]
            );
        }

        return DB::transaction(function () use ($page, $data, $tagIds, $changeNote, $request, $wasPublished) {
            $page->update($data);

            if ($request->has('tag_ids')) {
                $page->tags()->sync($tagIds ?? []);
            }

            $this->versionService->createSnapshot($page->fresh(), $changeNote);
            $this->auditService->log(DocumentationAuditAction::Updated, request()->user(), page: $page);

            if (! $wasPublished && $page->is_published) {
                $this->auditService->log(DocumentationAuditAction::Published, request()->user(), page: $page);
            }

            if ($wasPublished && ! $page->is_published) {
                $this->auditService->log(DocumentationAuditAction::Unpublished, request()->user(), page: $page);
            }

            if (($data['status'] ?? null) === DocumentationPageStatus::Archived->value) {
                $this->auditService->log(DocumentationAuditAction::Archived, request()->user(), page: $page);
            }

            return (new DocumentationPageResource($page->load(['space', 'tags', 'creator', 'lastEditor'])))
                ->additional(['message' => 'Documentation page updated successfully.']);
        });
    }

    public function destroy(string $id)
    {
        $page = DocumentationPage::query()->findOrFail($id);

        Gate::authorize('delete', $page);

        $page->delete();

        $this->auditService->log(DocumentationAuditAction::Deleted, request()->user(), page: $page);

        return response()->json(['message' => 'Documentation page deleted successfully.']);
    }

    public function restore(string $id)
    {
        $page = DocumentationPage::withTrashed()->findOrFail($id);

        Gate::authorize('restore', $page);

        $page->restore();

        $this->auditService->log(DocumentationAuditAction::Restored, request()->user(), page: $page);

        return (new DocumentationPageResource($page->load(['space', 'creator'])))
            ->additional(['message' => 'Documentation page restored successfully.']);
    }

    public function forceDestroy(string $id)
    {
        $page = DocumentationPage::withTrashed()->findOrFail($id);

        Gate::authorize('forceDelete', $page);

        $page->forceDelete();

        return response()->json(['message' => 'Documentation page permanently deleted.']);
    }

    public function tree(string $spaceId)
    {
        $space = DocumentationSpace::query()->findOrFail($spaceId);

        Gate::authorize('view', $space);

        $tree = $this->hierarchyService->treeForSpace((int) $spaceId);

        return response()->json(['data' => $tree]);
    }

    public function reorder(DocumentationPageReorderRequest $request)
    {
        Gate::authorize('reorder', DocumentationPage::class);

        $this->hierarchyService->reorder($request->validated('page_ids'));

        return response()->json(['message' => 'Page order updated successfully.']);
    }

    public function move(DocumentationPageMoveRequest $request, string $id)
    {
        $page = DocumentationPage::query()->findOrFail($id);

        Gate::authorize('move', $page);

        $page = $this->hierarchyService->move(
            $page,
            $request->input('parent_id'),
            $request->input('space_id'),
        );

        $this->auditService->log(DocumentationAuditAction::Updated, request()->user(), page: $page, metadata: [
            'action'    => 'moved',
            'parent_id' => $page->parent_id,
            'space_id'  => $page->space_id,
        ]);

        return (new DocumentationPageResource($page->load(['space', 'parent'])))
            ->additional(['message' => 'Documentation page moved successfully.']);
    }
}
