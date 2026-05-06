<?php

namespace App\Services;

use App\Models\AuditLog;
use App\Models\Document;
use App\Models\DocumentUser;
use Illuminate\Http\Request;
use Webkul\Security\Models\User;

class AuditService
{
    /**
     * @param  array<string, mixed>  $metadata
     */
    public function log(
        string $action,
        ?User $user,
        Request $request,
        ?Document $document = null,
        ?DocumentUser $assignment = null,
        array $metadata = [],
    ): void {
        AuditLog::query()->create([
            'document_id'      => $document?->id,
            'document_user_id' => $assignment?->id,
            'user_id'          => $user?->id,
            'action'           => $action,
            'ip_address'       => $request->ip(),
            'user_agent'       => (string) $request->userAgent(),
            'metadata'         => $metadata,
            'created_at'       => now(),
        ]);
    }
}
