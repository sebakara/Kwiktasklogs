<?php

namespace Webkul\Documentation\Services;

use Illuminate\Http\Request;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\User;

class DocumentationAuditService
{
    public function log(
        DocumentationAuditAction $action,
        ?User $user = null,
        ?DocumentationSpace $space = null,
        ?DocumentationPage $page = null,
        ?array $metadata = null,
        ?Request $request = null,
    ): DocumentationAuditLog {
        $request ??= request();

        return DocumentationAuditLog::query()->create([
            'action'     => $action,
            'space_id'   => $space?->id ?? $page?->space_id,
            'page_id'    => $page?->id,
            'user_id'    => $user?->id,
            'company_id' => $page?->company_id ?? $space?->company_id ?? $user?->default_company_id,
            'ip_address' => $request?->ip(),
            'user_agent' => $request?->userAgent(),
            'metadata'   => $metadata,
            'created_at' => now(),
        ]);
    }
}
