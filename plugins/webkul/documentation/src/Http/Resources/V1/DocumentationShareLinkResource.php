<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Documentation\Services\DocumentationShareLinkService;
use Webkul\Security\Http\Resources\V1\UserResource;
use Webkul\Support\Http\Resources\V1\CompanyResource;

class DocumentationShareLinkResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'          => $this->id,
            'token'       => $this->when($request->user() !== null, $this->token),
            'url'         => $this->when($request->user() !== null && $this->is_active, fn () => app(DocumentationShareLinkService::class)->publicUrl($this->resource)),
            'visibility'  => $this->visibility?->value ?? $this->visibility,
            'expires_at'  => $this->expires_at,
            'max_views'   => $this->max_views,
            'view_count'  => $this->view_count,
            'is_active'   => $this->is_active,
            'has_password'=> $this->password !== null,
            'page_id'     => $this->page_id,
            'company_id'  => $this->company_id,
            'creator_id'  => $this->creator_id,
            'created_at'  => $this->created_at,
            'updated_at'  => $this->updated_at,
            'deleted_at'  => $this->deleted_at,
            'page'        => new DocumentationPageResource($this->whenLoaded('page')),
            'company'     => new CompanyResource($this->whenLoaded('company')),
            'creator'     => new UserResource($this->whenLoaded('creator')),
        ];
    }
}
