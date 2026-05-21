<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Http\Requests\DocumentationShareLinkRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationShareLinkResource;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationShareLinkService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationShareLinkController extends Controller
{
    protected array $allowedIncludes = ['page', 'company', 'creator'];

    public function __construct(
        protected DocumentationShareLinkService $shareLinkService,
        protected DocumentationAuditService $auditService,
    ) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationShareLink::class);

        $links = QueryBuilder::for(DocumentationShareLink::class)
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('page_id'),
                AllowedFilter::exact('is_active'),
                AllowedFilter::trashed(),
            ])
            ->allowedSorts(['id', 'expires_at', 'view_count', 'created_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationShareLinkResource::collection($links);
    }

    public function store(DocumentationShareLinkRequest $request, string $pageId)
    {
        $page = DocumentationPage::query()->findOrFail($pageId);

        Gate::authorize('create', [DocumentationShareLink::class, $page]);

        $link = $this->shareLinkService->create($page, $request->validated());

        $this->auditService->log(DocumentationAuditAction::Shared, request()->user(), page: $page, metadata: [
            'share_link_id' => $link->id,
        ]);

        return (new DocumentationShareLinkResource($link->load(['page', 'creator'])))
            ->additional(['message' => 'Share link created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $id)
    {
        $link = QueryBuilder::for(DocumentationShareLink::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $link);

        return new DocumentationShareLinkResource($link);
    }

    public function update(DocumentationShareLinkRequest $request, string $id)
    {
        $link = DocumentationShareLink::query()->findOrFail($id);

        Gate::authorize('update', $link);

        if ($request->boolean('revoke')) {
            $this->shareLinkService->revoke($link);

            $this->auditService->log(
                DocumentationAuditAction::ShareRevoked,
                request()->user(),
                page: $link->page,
                metadata: ['share_link_id' => $link->id],
            );

            return (new DocumentationShareLinkResource($link->load(['page', 'creator'])))
                ->additional(['message' => 'Share link revoked successfully.']);
        }

        $data = $request->validated();

        if (array_key_exists('password', $data) && filled($data['password'])) {
            $data['password'] = bcrypt($data['password']);
        } else {
            unset($data['password']);
        }

        $link->update($data);

        return (new DocumentationShareLinkResource($link->load(['page', 'creator'])))
            ->additional(['message' => 'Share link updated successfully.']);
    }

    public function revoke(string $id)
    {
        $link = DocumentationShareLink::query()->findOrFail($id);

        Gate::authorize('update', $link);

        $this->shareLinkService->revoke($link);

        $this->auditService->log(
            DocumentationAuditAction::ShareRevoked,
            request()->user(),
            page: $link->page,
            metadata: ['share_link_id' => $link->id],
        );

        return (new DocumentationShareLinkResource($link->load(['page', 'creator'])))
            ->additional(['message' => 'Share link revoked successfully.']);
    }

    public function destroy(string $id)
    {
        $link = DocumentationShareLink::query()->findOrFail($id);

        Gate::authorize('delete', $link);

        $link->delete();

        return response()->json(['message' => 'Share link deleted successfully.']);
    }
}
