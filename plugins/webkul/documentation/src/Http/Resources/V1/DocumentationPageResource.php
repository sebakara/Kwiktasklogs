<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Security\Http\Resources\V1\UserResource;
use Webkul\Support\Http\Resources\V1\CompanyResource;

class DocumentationPageResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'              => $this->id,
            'title'           => $this->title,
            'slug'            => $this->slug,
            'summary'         => $this->summary,
            'content'         => $this->content,
            'status'          => $this->status?->value ?? $this->status,
            'module'          => $this->module,
            'audience'        => $this->audience,
            'is_published'    => $this->is_published,
            'published_at'    => $this->published_at,
            'sort_order'      => $this->sort_order,
            'space_id'        => $this->space_id,
            'parent_id'       => $this->parent_id,
            'template_id'     => $this->template_id,
            'project_id'      => $this->project_id,
            'company_id'      => $this->company_id,
            'creator_id'      => $this->creator_id,
            'last_editor_id'  => $this->last_editor_id,
            'created_at'      => $this->created_at,
            'updated_at'      => $this->updated_at,
            'deleted_at'      => $this->deleted_at,
            'space'           => new DocumentationSpaceResource($this->whenLoaded('space')),
            'parent'          => new self($this->whenLoaded('parent')),
            'children'        => self::collection($this->whenLoaded('children')),
            'template'        => new DocumentationTemplateResource($this->whenLoaded('template')),
            'tags'            => DocumentationTagResource::collection($this->whenLoaded('tags')),
            'versions'        => DocumentationPageVersionResource::collection($this->whenLoaded('versions')),
            'share_links'     => DocumentationShareLinkResource::collection($this->whenLoaded('shareLinks')),
            'company'         => new CompanyResource($this->whenLoaded('company')),
            'creator'         => new UserResource($this->whenLoaded('creator')),
            'last_editor'     => new UserResource($this->whenLoaded('lastEditor')),
        ];
    }
}
