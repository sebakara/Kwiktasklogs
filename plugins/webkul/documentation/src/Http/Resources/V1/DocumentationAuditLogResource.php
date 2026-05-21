<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Security\Http\Resources\V1\UserResource;

class DocumentationAuditLogResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->id,
            'action'     => $this->action?->value ?? $this->action,
            'ip_address' => $this->ip_address,
            'user_agent' => $this->user_agent,
            'metadata'   => $this->metadata,
            'space_id'   => $this->space_id,
            'page_id'    => $this->page_id,
            'user_id'    => $this->user_id,
            'company_id' => $this->company_id,
            'created_at' => $this->created_at,
            'space'      => new DocumentationSpaceResource($this->whenLoaded('space')),
            'page'       => new DocumentationPageResource($this->whenLoaded('page')),
            'user'       => new UserResource($this->whenLoaded('user')),
        ];
    }
}
