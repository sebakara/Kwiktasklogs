<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Schema;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationCatalogService;
use Webkul\Documentation\Services\DocumentationHubQueryService;
use Webkul\Documentation\Services\DocumentationProjectIntegration;

class HubDashboard extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'hub';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-home';

    protected static ?int $navigationSort = 0;

    protected string $view = 'documentation::filament.hub.dashboard';

    public string $search = '';

    public string $tab = 'projects';

    public bool $projectsAvailable = false;

    public bool $productsAvailable = false;

    /** @var array<int, array<string, mixed>> */
    public array $projects = [];

    /** @var array<int, array<string, mixed>> */
    public array $products = [];

    /** @var array<int, array<string, mixed>> */
    public array $recentPages = [];

    /** @var array<int, array<string, mixed>> */
    public array $searchSpaces = [];

    /** @var array<int, array<string, mixed>> */
    public array $searchPages = [];

    public function mount(): void
    {
        Gate::authorize('viewAny', DocumentationSpace::class);

        $this->projectsAvailable = DocumentationProjectIntegration::isAvailable();
        $this->productsAvailable = Schema::hasTable('documentation_products');

        $tab = request()->query('tab');

        if (is_string($tab) && in_array($tab, ['projects', 'products', 'recent'], true)) {
            $this->tab = $tab;
        } elseif (! $this->projectsAvailable && $this->productsAvailable) {
            $this->tab = 'products';
        }

        $this->loadCatalog();
    }

    public function updatedSearch(): void
    {
        $this->loadCatalog();
    }

    public function setTab(string $tab): void
    {
        if (! in_array($tab, ['projects', 'products', 'recent'], true)) {
            return;
        }

        $this->tab = $tab;
        $this->loadCatalog();
    }

    public function clearSearch(): void
    {
        $this->search = '';
        $this->loadCatalog();
    }

    protected function loadCatalog(): void
    {
        $user = auth()->user();

        if ($user === null) {
            return;
        }

        $catalog = app(DocumentationCatalogService::class);
        $queries = app(DocumentationHubQueryService::class);
        $term = trim($this->search) !== '' ? $this->search : null;

        if ($term !== null) {
            $results = $queries->search($user, $term);
            $this->searchSpaces = $this->mapSpaces($results['spaces']);
            $this->searchPages = $this->mapPages($results['pages']);
            $this->projects = [];
            $this->products = [];
            $this->recentPages = [];

            return;
        }

        $this->searchSpaces = [];
        $this->searchPages = [];
        $this->projects = $this->projectsAvailable
            ? $catalog->projects($user, null)->all()
            : [];
        $this->products = $this->productsAvailable
            ? $catalog->products($user, null)->all()
            : [];
        $this->recentPages = $this->mapPages($queries->recentPages($user, 12));
    }

    /**
     * @param  Collection<int, DocumentationSpace>  $spaces
     * @return array<int, array<string, mixed>>
     */
    protected function mapSpaces($spaces): array
    {
        return $spaces->map(fn (DocumentationSpace $space): array => [
            'id'          => $space->id,
            'name'        => $space->name,
            'description' => $space->description,
            'color'       => $space->color ?? '#3b82f6',
            'pages_count' => $space->pages_count ?? $space->pages()->count(),
            'url'         => $space->project_id
                ? OpenProjectDocumentation::portalUrl((int) $space->project_id)
                : ($space->product_id
                    ? OpenProductDocumentation::portalUrl((int) $space->product_id)
                    : ViewSpace::getUrl(['documentationSpace' => $space->id])),
        ])->all();
    }

    /**
     * @param  Collection<int, DocumentationPage>  $pages
     * @return array<int, array<string, mixed>>
     */
    protected function mapPages($pages): array
    {
        return $pages->map(fn (DocumentationPage $page): array => [
            'id'           => $page->id,
            'title'        => $page->title,
            'slug'         => $page->slug,
            'space_id'     => $page->space_id,
            'space_name'   => $page->space?->name,
            'space_color'  => $page->space?->color ?? '#3b82f6',
            'is_published' => $page->is_published,
            'updated_at'   => $page->updated_at?->diffForHumans(),
            'url'          => ViewPage::getUrl(['documentationSpace' => $page->space_id, 'pageRecord' => $page->id]),
        ])->all();
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.home');
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.portal.catalog_headline');
    }

    public function getHeading(): string|Htmlable
    {
        return '';
    }

    public function getBreadcrumbs(): array
    {
        return [];
    }

    public function getSubheading(): ?string
    {
        return null;
    }

    public function getSubNavigation(): array
    {
        return [];
    }
}
