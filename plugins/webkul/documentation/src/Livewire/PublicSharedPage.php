<?php

namespace Webkul\Documentation\Livewire;

use Livewire\Attributes\Layout;
use Livewire\Component;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationShareLinkService;
use Webkul\Documentation\Services\DocumentationTableOfContentsService;

#[Layout('documentation::public.shared-layout')]
class PublicSharedPage extends Component
{
    public string $token;

    public string $password = '';

    public ?DocumentationPage $page = null;

    public string $renderedContent = '';

    /** @var array<int, array{id: string, level: int, text: string}> */
    public array $tableOfContents = [];

    public bool $requiresPassword = false;

    public bool $accessDenied = false;

    public bool $invalidPassword = false;

    public function mount(string $token): void
    {
        $this->token = $token;

        $this->loadPage();
    }

    public function submitPassword(): void
    {
        $this->invalidPassword = false;
        $this->loadPage();
    }

    public function render()
    {
        return view('documentation::public.shared-page');
    }

    protected function loadPage(): void
    {
        $this->page = null;
        $this->renderedContent = '';
        $this->tableOfContents = [];
        $this->requiresPassword = false;
        $this->accessDenied = false;

        $shareLinkService = app(DocumentationShareLinkService::class);
        $link = $shareLinkService->findActiveByToken($this->token);

        if ($link === null) {
            $this->accessDenied = true;

            return;
        }

        $page = $link->page()->first();

        if ($page === null || ! $page->is_published) {
            $this->accessDenied = true;

            return;
        }

        if ($shareLinkService->isRestricted($link)) {
            $this->requiresPassword = true;

            if ($this->password === '') {
                return;
            }

            if (! $shareLinkService->validateAccess($link, $this->password)) {
                $this->invalidPassword = true;

                return;
            }
        } elseif (! $shareLinkService->validateAccess($link)) {
            $this->accessDenied = true;

            return;
        }

        $processed = app(DocumentationTableOfContentsService::class)->process($page->content);

        $shareLinkService->recordView($link);

        app(DocumentationAuditService::class)->log(
            DocumentationAuditAction::Viewed,
            user: null,
            page: $page,
            metadata: [
                'share_link_id' => $link->id,
                'public'        => true,
                'visibility'    => $link->visibility?->value ?? $link->visibility,
            ],
        );

        $this->page = $page;
        $this->renderedContent = $processed['content'];
        $this->tableOfContents = $processed['items'];
    }
}
