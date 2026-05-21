<?php

namespace Webkul\Documentation\Http\Resources\V1;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Security\Http\Resources\V1\UserResource;

class DocumentationPageVersionResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'             => $this->id,
            'version_number' => $this->version_number,
            'title'          => $this->title,
            'summary'        => $this->summary,
            'content'        => $this->content,
            'change_note'    => $this->change_note,
            'page_id'        => $this->page_id,
            'creator_id'     => $this->creator_id,
            'created_at'     => $this->created_at,
            'updated_at'     => $this->updated_at,
            'page'           => new DocumentationPageResource($this->whenLoaded('page')),
            'creator'        => new UserResource($this->whenLoaded('creator')),
        ];
    }
}
