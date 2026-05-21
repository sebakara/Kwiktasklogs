<?php

namespace Webkul\Documentation\Services;

use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;

class DocumentationPageVersionService
{
    public function createSnapshot(DocumentationPage $page, ?string $changeNote = null): DocumentationPageVersion
    {
        $nextVersion = (int) $page->versions()->max('version_number') + 1;

        return $page->versions()->create([
            'version_number' => $nextVersion,
            'title'          => $page->title,
            'summary'        => $page->summary,
            'content'        => $page->content,
            'change_note'    => $changeNote,
            'creator_id'     => auth()->id(),
        ]);
    }

    public function restore(DocumentationPage $page, DocumentationPageVersion $version): DocumentationPage
    {
        $page->update([
            'title'          => $version->title,
            'summary'        => $version->summary,
            'content'        => $version->content,
            'last_editor_id' => auth()->id(),
        ]);

        $page = $page->fresh();

        $this->createSnapshot(
            $page,
            __('documentation::filament/hub.versions.restored_from', ['number' => $version->version_number]),
        );

        return $page;
    }

    /**
     * @param  array<string, mixed>  $validated
     */
    public function shouldCreateSnapshot(?DocumentationPage $existing, array $validated, bool $publish): bool
    {
        if ($existing === null) {
            return true;
        }

        if ($publish) {
            return true;
        }

        return $existing->title !== $validated['title']
            || (string) $existing->summary !== (string) ($validated['summary'] ?? '')
            || (string) $existing->content !== (string) ($validated['content'] ?? '');
    }

    public function isCurrentVersion(DocumentationPage $page, DocumentationPageVersion $version): bool
    {
        return $page->title === $version->title
            && (string) $page->summary === (string) $version->summary
            && (string) $page->content === (string) $version->content;
    }
}
