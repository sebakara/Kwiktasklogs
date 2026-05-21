<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Http\Requests\DocumentationTagRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationTagResource;
use Webkul\Documentation\Models\DocumentationTag;
use Webkul\Documentation\Services\DocumentationSlugService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationTagController extends Controller
{
    protected array $allowedIncludes = ['company', 'creator', 'pages'];

    public function __construct(protected DocumentationSlugService $slugService) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationTag::class);

        $tags = QueryBuilder::for(DocumentationTag::class)
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('company_id'),
                AllowedFilter::partial('name'),
                AllowedFilter::trashed(),
            ])
            ->allowedSorts(['id', 'name', 'sort_order', 'created_at', 'updated_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationTagResource::collection($tags);
    }

    public function store(DocumentationTagRequest $request)
    {
        Gate::authorize('create', DocumentationTag::class);

        $data = $request->validated();
        $data['slug'] = $data['slug'] ?? $this->slugService->uniqueFor(
            new DocumentationTag,
            $data['name'],
            scopes: array_filter(['company_id' => $data['company_id'] ?? null])
        );
        $data['color'] = $data['color'] ?? '#808080';

        $tag = DocumentationTag::query()->create($data);

        return (new DocumentationTagResource($tag->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation tag created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $id)
    {
        $tag = QueryBuilder::for(DocumentationTag::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $tag);

        return new DocumentationTagResource($tag);
    }

    public function update(DocumentationTagRequest $request, string $id)
    {
        $tag = DocumentationTag::query()->findOrFail($id);

        Gate::authorize('update', $tag);

        $data = $request->validated();

        if (isset($data['name']) && ! isset($data['slug'])) {
            $data['slug'] = $this->slugService->uniqueFor(
                $tag,
                $data['name'],
                scopes: array_filter(['company_id' => $data['company_id'] ?? $tag->company_id])
            );
        }

        $tag->update($data);

        return (new DocumentationTagResource($tag->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation tag updated successfully.']);
    }

    public function destroy(string $id)
    {
        $tag = DocumentationTag::query()->findOrFail($id);

        Gate::authorize('delete', $tag);

        $tag->delete();

        return response()->json(['message' => 'Documentation tag deleted successfully.']);
    }

    public function restore(string $id)
    {
        $tag = DocumentationTag::withTrashed()->findOrFail($id);

        Gate::authorize('restore', $tag);

        $tag->restore();

        return (new DocumentationTagResource($tag->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation tag restored successfully.']);
    }

    public function forceDestroy(string $id)
    {
        $tag = DocumentationTag::withTrashed()->findOrFail($id);

        Gate::authorize('forceDelete', $tag);

        $tag->forceDelete();

        return response()->json(['message' => 'Documentation tag permanently deleted.']);
    }
}
