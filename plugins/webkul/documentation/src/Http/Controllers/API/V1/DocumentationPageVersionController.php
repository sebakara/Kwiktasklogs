<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Http\Resources\V1\DocumentationPageResource;
use Webkul\Documentation\Http\Resources\V1\DocumentationPageVersionResource;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPageVersionService;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationPageVersionController extends Controller
{
    protected array $allowedIncludes = ['page', 'creator'];

    public function __construct(
        protected DocumentationPageVersionService $versionService,
        protected DocumentationAuditService $auditService,
    ) {}

    public function index(string $pageId)
    {
        $page = DocumentationPage::query()->findOrFail($pageId);

        Gate::authorize('viewAny', [DocumentationPageVersion::class, $page]);

        $versions = QueryBuilder::for(DocumentationPageVersion::query()->where('page_id', $pageId))
            ->allowedFilters([
                AllowedFilter::exact('version_number'),
            ])
            ->allowedSorts(['version_number', 'created_at'])
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationPageVersionResource::collection($versions);
    }

    public function store(string $pageId)
    {
        $page = DocumentationPage::query()->findOrFail($pageId);

        Gate::authorize('create', [DocumentationPageVersion::class, $page]);

        $version = $this->versionService->createSnapshot($page, request()->input('change_note'));

        $this->auditService->log(DocumentationAuditAction::VersionCreated, request()->user(), page: $page, metadata: [
            'version_id'     => $version->id,
            'version_number' => $version->version_number,
        ]);

        return (new DocumentationPageVersionResource($version->load(['creator'])))
            ->additional(['message' => 'Page version created successfully.'])
            ->response()
            ->setStatusCode(201);
    }

    public function show(string $pageId, string $versionId)
    {
        $version = DocumentationPageVersion::query()
            ->where('page_id', $pageId)
            ->whereKey($versionId)
            ->firstOrFail();

        Gate::authorize('view', $version);

        return new DocumentationPageVersionResource($version->load(['page', 'creator']));
    }

    public function restore(string $pageId, string $versionId)
    {
        $page = DocumentationPage::query()->findOrFail($pageId);

        $version = DocumentationPageVersion::query()
            ->where('page_id', $pageId)
            ->whereKey($versionId)
            ->firstOrFail();

        Gate::authorize('restore', $version);

        if ($this->versionService->isCurrentVersion($page, $version)) {
            return response()->json(['message' => 'Version already matches current page content.'], 422);
        }

        $restored = $this->versionService->restore($page, $version);

        $this->auditService->log(
            DocumentationAuditAction::VersionRestored,
            request()->user(),
            page: $restored,
            metadata: [
                'version_id'     => $version->id,
                'version_number' => $version->version_number,
            ],
        );

        return (new DocumentationPageResource($restored))
            ->additional(['message' => 'Page restored from version successfully.']);
    }
}
