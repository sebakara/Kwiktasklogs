<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;
use Livewire\Attributes\Locked;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubActions;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationPagePersistence;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Models\DocumentationTag;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationPageHierarchyService;

class EditPage extends Page
{
    use InteractsWithDocumentationHubActions;
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use ManagesDocumentationPagePersistence;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}/pages/{pageRecord}/edit';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.pages.edit';

    public DocumentationSpace $space;

    public ?DocumentationPage $record = null;

    #[Locked]
    public int $documentationSpaceId = 0;

    #[Locked]
    public int|string $pageRecordKey = 'create';

    public bool $isCreating = false;

    public string $pageTitle = '';

    public string $pageSlug = '';

    public string $pageSummary = '';

    public string $pageContent = '';

    public int $space_id = 0;

    public ?int $parent_id = null;

    /** @var array<int> */
    public array $tag_ids = [];

    /** @var array<int, string> */
    public array $spaceOptions = [];

    /** @var array<int, string> */
    public array $parentOptions = [];

    /** @var array<int, string> */
    public array $tagOptions = [];

    /** @var array<int, array<string, mixed>> */
    public array $pageTree = [];

    public function mount(int|string $documentationSpace, int|string $pageRecord): void
    {
        $this->documentationSpaceId = (int) $documentationSpace;
        $this->pageRecordKey = $pageRecord;

        $this->space = DocumentationSpace::query()->findOrFail($this->documentationSpaceId);
        $this->space_id = $this->space->id;

        $this->loadFormOptions();
        $this->loadPageTree();

        if ($pageRecord === 'create') {
            Gate::authorize('createInSpace', [DocumentationPage::class, $this->space]);
            $this->isCreating = true;
            $this->fillPageFormFromDefaults();

            return;
        }

        $this->record = DocumentationPage::query()
            ->with('tags')
            ->where('space_id', $this->space->id)
            ->findOrFail($pageRecord);

        Gate::authorize('update', $this->record);

        $this->fillPageFormFromRecord();

        $this->loadParentOptions();
    }

    protected function fillPageFormFromDefaults(): void
    {
        $this->pageTitle = '';
        $this->pageSlug = '';
        $this->pageSummary = '';
        $this->pageContent = '';
        $this->parent_id = null;
        $this->tag_ids = [];
    }

    protected function fillPageFormFromRecord(): void
    {
        if ($this->record === null) {
            $this->fillPageFormFromDefaults();

            return;
        }

        $this->pageTitle = $this->record->title;
        $this->pageSlug = $this->record->slug;
        $this->pageSummary = (string) $this->record->summary;
        $this->pageContent = (string) $this->record->content;
        $this->space_id = $this->record->space_id;
        $this->parent_id = $this->record->parent_id;
        $this->tag_ids = $this->record->tags->pluck('id')->all();
    }

    public function updatedPageTitle(): void
    {
        if ($this->pageSlug === '' || ! $this->isCreating) {
            return;
        }

        $this->pageSlug = Str::slug($this->pageTitle);
    }

    public function updatedSpaceId(): void
    {
        if ($this->parent_id !== null) {
            $validParentIds = array_map('intval', array_keys($this->getParentOptionsForSpace($this->space_id)));

            if (! in_array($this->parent_id, $validParentIds, true)) {
                $this->parent_id = null;
            }
        }

        $this->loadParentOptions();
    }

    public function saveDraft(): void
    {
        $redirectUrl = null;

        $this->runHubAction(function () use (&$redirectUrl): void {
            $page = $this->persistPage($this->pageValidated(), publish: false);

            $redirectUrl = ViewPage::getUrl([
                'documentationSpace' => $page->space_id,
                'pageRecord'         => $page->id,
            ]);
        }, successTitle: __('documentation::filament/hub.pages.draft_saved'));

        if ($redirectUrl !== null) {
            $this->redirect($redirectUrl);
        }
    }

    public function publish(): void
    {
        $redirectUrl = null;

        $this->runHubAction(function () use (&$redirectUrl): void {
            $page = $this->persistPage($this->pageValidated(), publish: true);

            $redirectUrl = ViewPage::getUrl([
                'documentationSpace' => $page->space_id,
                'pageRecord'         => $page->id,
            ]);
        }, successTitle: __('documentation::filament/hub.pages.published'));

        if ($redirectUrl !== null) {
            $this->redirect($redirectUrl);
        }
    }

    public function save(): void
    {
        $redirectUrl = null;

        $this->runHubAction(function () use (&$redirectUrl): void {
            $publish = (bool) ($this->record?->is_published ?? false);

            $page = $this->persistPage($this->pageValidated(), publish: $publish, changeNote: 'Updated via hub editor');

            $redirectUrl = ViewPage::getUrl([
                'documentationSpace' => $page->space_id,
                'pageRecord'         => $page->id,
            ]);
        }, successTitle: __('documentation::filament/hub.pages.saved'));

        if ($redirectUrl !== null) {
            $this->redirect($redirectUrl);
        }
    }

    /**
     * @return array<string, mixed>
     */
    protected function pageValidationRules(): array
    {
        return [
            'pageTitle'   => ['required', 'string', 'max:255'],
            'pageSlug'    => ['nullable', 'string', 'max:255'],
            'pageSummary' => ['nullable', 'string'],
            'pageContent' => ['nullable', 'string'],
            'space_id'    => ['required', 'integer', 'exists:documentation_spaces,id'],
            'parent_id'   => [
                'nullable',
                'integer',
                'exists:documentation_pages,id',
            ],
            'tag_ids'     => ['nullable', 'array'],
            'tag_ids.*'   => ['integer', 'exists:documentation_tags,id'],
        ];
    }

    /**
     * @return array<string, mixed>
     */
    protected function pageValidated(): array
    {
        $validated = $this->validate($this->pageValidationRules());

        return [
            'title'     => $validated['pageTitle'],
            'slug'      => $validated['pageSlug'] ?? $this->pageSlug,
            'summary'   => $validated['pageSummary'] ?? '',
            'content'   => $validated['pageContent'] ?? '',
            'space_id'  => $validated['space_id'],
            'parent_id' => $validated['parent_id'] ?? null,
            'tag_ids'   => $validated['tag_ids'] ?? [],
        ];
    }

    protected function loadFormOptions(): void
    {
        $user = auth()->user();

        $spacesQuery = DocumentationSpace::query()
            ->active()
            ->orderBy('sort_order')
            ->orderBy('name');

        if ($user) {
            app(DocumentationAccessService::class)->applyAccessibleSpaceScope($spacesQuery, $user);
        }

        $access = app(DocumentationAccessService::class);

        $this->spaceOptions = $spacesQuery->get()
            ->filter(function (DocumentationSpace $space) use ($access, $user): bool {
                if ($this->record && (int) $this->record->space_id === (int) $space->id) {
                    return true;
                }

                return $user !== null && (
                    $access->canCreatePageInSpace($user, $space)
                    || $access->canEditSpace($user, $space)
                );
            })
            ->pluck('name', 'id')
            ->all();

        $tagsQuery = DocumentationTag::query()->orderBy('name');

        if ($user?->default_company_id) {
            $tagsQuery->where(function ($query) use ($user): void {
                $query->whereNull('company_id')
                    ->orWhere('company_id', $user->default_company_id);
            });
        }

        $this->tagOptions = $tagsQuery->pluck('name', 'id')->all();

        $this->loadParentOptions();
    }

    protected function loadParentOptions(): void
    {
        $this->parentOptions = $this->getParentOptionsForSpace($this->space_id);
    }

    /**
     * @return array<int, string>
     */
    protected function getParentOptionsForSpace(int $spaceId): array
    {
        $query = DocumentationPage::query()
            ->where('space_id', $spaceId)
            ->orderBy('title');

        if ($this->record) {
            $excluded = $this->descendantIds($this->record);
            $excluded[] = $this->record->id;
            $query->whereNotIn('id', $excluded);
        }

        return $query->pluck('title', 'id')->all();
    }

    protected function loadPageTree(): void
    {
        $this->pageTree = app(DocumentationPageHierarchyService::class)
            ->treeForSpace($this->space->id)
            ->all();
    }

    public function getTitle(): string|Htmlable
    {
        return $this->isCreating
            ? __('documentation::filament/hub.pages.create_title')
            : __('documentation::filament/hub.pages.edit_title', ['title' => $this->record?->title]);
    }

    public function getHeading(): string|Htmlable
    {
        return '';
    }

    public function getBreadcrumbs(): array
    {
        return [];
    }

    public function getSubNavigation(): array
    {
        return [];
    }

    public function cancelUrl(): string
    {
        if ($this->isCreating) {
            return ViewSpace::getUrl(['documentationSpace' => $this->space->id]);
        }

        return ViewPage::getUrl([
            'documentationSpace' => $this->space->id,
            'pageRecord'         => $this->record?->id,
        ]);
    }
}
