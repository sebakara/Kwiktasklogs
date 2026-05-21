<?php

namespace Webkul\Documentation\Services;

use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Security\Models\User;

class DocumentationPageWorkflowService
{
    public function __construct(
        protected DocumentationPageVersionService $versions,
        protected DocumentationAuditService $audit,
    ) {}

    public function publish(DocumentationPage $page, ?User $user = null): DocumentationPage
    {
        $wasPublished = $page->is_published;

        $page->update([
            'status'       => DocumentationPageStatus::Published,
            'is_published' => true,
            'published_at' => $page->published_at ?? now(),
        ]);

        $page = $page->fresh();

        if ($this->versions->shouldCreateSnapshot($page, [
            'title'   => $page->title,
            'summary' => $page->summary,
            'content' => $page->content,
        ], true)) {
            $this->versions->createSnapshot($page, __('documentation::filament/hub.versions.published'));
        }

        if (! $wasPublished) {
            $this->audit->log(DocumentationAuditAction::Published, $user, page: $page);
        }

        return $page;
    }

    public function unpublish(DocumentationPage $page, ?User $user = null): DocumentationPage
    {
        $wasPublished = $page->is_published;

        $page->update([
            'status'       => DocumentationPageStatus::Draft,
            'is_published' => false,
            'published_at' => null,
        ]);

        $page = $page->fresh();

        if ($wasPublished) {
            $this->audit->log(DocumentationAuditAction::Unpublished, $user, page: $page);
        }

        return $page;
    }
}
