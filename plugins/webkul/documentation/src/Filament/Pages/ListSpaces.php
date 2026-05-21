<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationSpaceActions;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;

class ListSpaces extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use ManagesDocumentationSpaceActions;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?int $navigationSort = 1;

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.spaces.index';

    public string $filter = 'active';

    public bool $canCreateSpace = false;

    /** @var array<int, array<string, mixed>> */
    public array $spaces = [];

    public function mount(): void
    {
        Gate::authorize('viewAny', DocumentationSpace::class);

        $this->canCreateSpace = auth()->user() !== null
            && app(DocumentationAccessService::class)->canManageSpaces(auth()->user());

        $this->loadSpaces();
    }

    public function setFilter(string $filter): void
    {
        $this->filter = in_array($filter, ['active', 'archived', 'all'], true) ? $filter : 'active';

        $this->loadSpaces();
    }

    protected function loadSpaces(): void
    {
        $query = DocumentationSpace::query()
            ->withCount('pages')
            ->orderBy('sort_order')
            ->orderBy('name');

        if ($this->filter === 'active') {
            $query->active();
        } elseif ($this->filter === 'archived') {
            $query->where('is_active', false);
        }

        $user = auth()->user();

        if ($user) {
            app(DocumentationAccessService::class)->applyAccessibleSpaceScope($query, $user);
        }

        $access = app(DocumentationAccessService::class);

        $this->spaces = $query->get()->map(function (DocumentationSpace $space) use ($access, $user): array {
            $canEdit = $user && $access->canEditSpace($user, $space);
            $canDelete = $user && $access->canManageHub($user);

            return [
                'id'           => $space->id,
                'name'         => $space->name,
                'slug'         => $space->slug,
                'description'  => $space->description,
                'visibility'   => $space->visibility?->value ?? $space->visibility,
                'color'        => $space->color ?? '#3b82f6',
                'pages_count'  => $space->pages_count,
                'is_active'    => $space->is_active,
                'url'          => ViewSpace::getUrl(['documentationSpace' => $space->id]),
                'edit_url'     => $canEdit ? EditSpace::getUrl(['documentationSpace' => $space->id]) : null,
                'can_edit'     => $canEdit,
                'can_delete'   => $canDelete,
            ];
        })->all();
    }

    protected function afterSpaceMutation(DocumentationSpace $space, bool $deleted = false): void
    {
        if ($deleted) {
            $this->loadSpaces();

            return;
        }

        $this->loadSpaces();
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.spaces');
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.spaces.title');
    }

    public function getSubheading(): ?string
    {
        return __('documentation::filament/hub.spaces.subtitle');
    }
}
