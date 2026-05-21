<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Http\Requests\DocumentationTemplateRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationTemplateResource;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Documentation\Services\DocumentationSlugService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationTemplateController extends Controller
{
    protected array $allowedIncludes = ['company', 'creator'];

    public function __construct(protected DocumentationSlugService $slugService) {}

    public function index()
    {
        Gate::authorize('viewAny', DocumentationTemplate::class);

        $templates = QueryBuilder::for(DocumentationTemplate::class)
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('company_id'),
                AllowedFilter::exact('module'),
                AllowedFilter::exact('is_active'),
                AllowedFilter::partial('name'),
                AllowedFilter::trashed(),
            ])
            ->allowedSorts(['id', 'name', 'created_at', 'updated_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationTemplateResource::collection($templates);
    }

    public function store(DocumentationTemplateRequest $request)
    {
        Gate::authorize('create', DocumentationTemplate::class);

        $data = $request->validated();
        $data['slug'] = $data['slug'] ?? $this->slugService->uniqueFor(
            new DocumentationTemplate,
            $data['name'],
            scopes: array_filter(['company_id' => $data['company_id'] ?? null])
        );

        $template = DocumentationTemplate::query()->create($data);

        return (new DocumentationTemplateResource($template->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation template created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $id)
    {
        $template = QueryBuilder::for(DocumentationTemplate::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $template);

        return new DocumentationTemplateResource($template);
    }

    public function update(DocumentationTemplateRequest $request, string $id)
    {
        $template = DocumentationTemplate::query()->findOrFail($id);

        Gate::authorize('update', $template);

        $data = $request->validated();

        if (isset($data['name']) && ! isset($data['slug'])) {
            $data['slug'] = $this->slugService->uniqueFor(
                $template,
                $data['name'],
                scopes: array_filter(['company_id' => $data['company_id'] ?? $template->company_id])
            );
        }

        $template->update($data);

        return (new DocumentationTemplateResource($template->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation template updated successfully.']);
    }

    public function destroy(string $id)
    {
        $template = DocumentationTemplate::query()->findOrFail($id);

        Gate::authorize('delete', $template);

        $template->delete();

        return response()->json(['message' => 'Documentation template deleted successfully.']);
    }

    public function restore(string $id)
    {
        $template = DocumentationTemplate::withTrashed()->findOrFail($id);

        Gate::authorize('restore', $template);

        $template->restore();

        return (new DocumentationTemplateResource($template->load(['company', 'creator'])))
            ->additional(['message' => 'Documentation template restored successfully.']);
    }

    public function forceDestroy(string $id)
    {
        $template = DocumentationTemplate::withTrashed()->findOrFail($id);

        Gate::authorize('forceDelete', $template);

        $template->forceDelete();

        return response()->json(['message' => 'Documentation template permanently deleted.']);
    }
}
