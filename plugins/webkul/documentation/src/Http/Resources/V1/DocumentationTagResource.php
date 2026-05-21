<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Security\Http\Resources\V1\UserResource;
use Webkul\Support\Http\Resources\V1\CompanyResource;

class DocumentationTagResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->id,
            'name'       => $this->name,
            'slug'       => $this->slug,
            'color'      => $this->color,
            'sort_order' => $this->sort_order,
            'company_id' => $this->company_id,
            'creator_id' => $this->creator_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'deleted_at' => $this->deleted_at,
            'company'    => new CompanyResource($this->whenLoaded('company')),
            'creator'    => new UserResource($this->whenLoaded('creator')),
            'pages'      => DocumentationPageResource::collection($this->whenLoaded('pages')),
        ];
    }
}
