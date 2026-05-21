<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Security\Http\Resources\V1\UserResource;
use Webkul\Support\Http\Resources\V1\CompanyResource;

class DocumentationPermissionResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'                  => $this->id,
            'permission'          => $this->permission?->value ?? $this->permission,
            'permissionable_type' => $this->permissionable_type,
            'permissionable_id'   => $this->permissionable_id,
            'user_id'             => $this->user_id,
            'team_id'             => $this->team_id,
            'role_id'             => $this->role_id,
            'company_id'          => $this->company_id,
            'creator_id'          => $this->creator_id,
            'created_at'          => $this->created_at,
            'updated_at'          => $this->updated_at,
            'user'                => new UserResource($this->whenLoaded('user')),
            'company'             => new CompanyResource($this->whenLoaded('company')),
            'creator'             => new UserResource($this->whenLoaded('creator')),
        ];
    }
}
