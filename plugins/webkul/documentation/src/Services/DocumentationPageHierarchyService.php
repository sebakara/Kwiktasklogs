<?php

namespace Webkul\Documentation\Services;

use Illuminate\Support\Collection;
use Webkul\Documentation\Models\DocumentationPage;

class DocumentationPageHierarchyService
{
    /**
     * @return Collection<int, array<string, mixed>>
     */
    public function treeForSpace(int $spaceId, ?int $parentId = null): Collection
    {
        $pages = DocumentationPage::query()
            ->where('space_id', $spaceId)
            ->where('parent_id', $parentId)
            ->orderBy('sort_order')
            ->orderBy('title')
            ->get();

        return $pages->map(function (DocumentationPage $page): array {
            return [
                'id'           => $page->id,
                'title'        => $page->title,
                'slug'         => $page->slug,
                'parent_id'    => $page->parent_id,
                'sort_order'   => $page->sort_order,
                'is_published' => $page->is_published,
                'status'       => $page->status?->value ?? $page->status,
                'children'     => $this->treeForSpace($page->space_id, $page->id)->values()->all(),
            ];
        });
    }

    public function reorder(array $orderedPageIds): void
    {
        foreach ($orderedPageIds as $index => $pageId) {
            DocumentationPage::query()
                ->whereKey($pageId)
                ->update(['sort_order' => $index]);
        }
    }

    public function move(DocumentationPage $page, ?int $parentId, ?int $spaceId = null): DocumentationPage
    {
        if ($parentId !== null) {
            $parent = DocumentationPage::query()->findOrFail($parentId);

            $spaceId = $parent->space_id;
        }

        $page->update([
            'parent_id' => $parentId,
            'space_id'  => $spaceId ?? $page->space_id,
        ]);

        return $page->fresh();
    }
}
