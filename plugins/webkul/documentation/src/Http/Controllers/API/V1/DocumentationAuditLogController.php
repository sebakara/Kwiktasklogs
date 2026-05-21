<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Support\Facades\Gate;
use Knuckles\Scribe\Attributes\Authenticated;
use Knuckles\Scribe\Attributes\Group;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\QueryBuilder;
use Webkul\Documentation\Http\Resources\V1\DocumentationAuditLogResource;
use Webkul\Documentation\Models\DocumentationAuditLog;

#[Group('Documentation Hub API')]
#[Authenticated]
class DocumentationAuditLogController extends Controller
{
    protected array $allowedIncludes = ['space', 'page', 'user'];

    public function index()
    {
        Gate::authorize('viewAny', DocumentationAuditLog::class);

        $logs = QueryBuilder::for(DocumentationAuditLog::class)
            ->allowedFilters([
                AllowedFilter::exact('id'),
                AllowedFilter::exact('action'),
                AllowedFilter::exact('space_id'),
                AllowedFilter::exact('page_id'),
                AllowedFilter::exact('user_id'),
                AllowedFilter::exact('company_id'),
            ])
            ->allowedSorts(['id', 'created_at'])
            ->defaultSort('-created_at')
            ->allowedIncludes($this->allowedIncludes)
            ->paginate();

        return DocumentationAuditLogResource::collection($logs);
    }

    public function show(string $id)
    {
        $log = QueryBuilder::for(DocumentationAuditLog::query()->whereKey($id))
            ->allowedIncludes($this->allowedIncludes)
            ->firstOrFail();

        Gate::authorize('view', $log);

        return new DocumentationAuditLogResource($log);
    }
}
