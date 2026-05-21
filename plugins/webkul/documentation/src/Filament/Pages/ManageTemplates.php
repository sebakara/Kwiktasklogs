<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Documentation\Services\DocumentationAccessService;

class ManageTemplates extends Page
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'templates';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-document-duplicate';

    protected static ?int $navigationSort = 2;

    protected string $view = 'documentation::filament.hub.templates.index';

    /** @var array<int, array<string, mixed>> */
    public array $templates = [];

    public function mount(): void
    {
        Gate::authorize('viewAny', DocumentationTemplate::class);

        $this->templates = DocumentationTemplate::query()
            ->orderBy('name')
            ->get()
            ->map(fn (DocumentationTemplate $template): array => [
                'id'          => $template->id,
                'name'        => $template->name,
                'slug'        => $template->slug,
                'module'      => $template->module,
                'description' => $template->description,
                'is_active'   => $template->is_active,
            ])
            ->all();
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.templates');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }

    public static function canAccess(): bool
    {
        $user = auth()->user();

        return InteractsWithDocumentationHubAuthorization::canAccess()
            && $user !== null
            && app(DocumentationAccessService::class)->canManageTemplates($user);
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.templates.title');
    }
}
