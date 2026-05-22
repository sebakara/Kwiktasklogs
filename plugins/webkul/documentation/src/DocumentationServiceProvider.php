<?php

namespace Webkul\Documentation;

use Filament\Panel;
use Filament\Support\Assets\Css;
use Filament\Support\Facades\FilamentAsset;
use Filament\Support\Facades\FilamentView;
use Filament\View\PanelsRenderHook;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\HtmlString;
use Livewire\Livewire;
use Webkul\Documentation\Livewire\PublicSharedPage;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Models\DocumentationTag;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Documentation\Observers\ProjectDocumentationObserver;
use Webkul\Documentation\Policies\DocumentationArticlePolicy;
use Webkul\Documentation\Policies\DocumentationAuditLogPolicy;
use Webkul\Documentation\Policies\DocumentationPagePolicy;
use Webkul\Documentation\Policies\DocumentationPageVersionPolicy;
use Webkul\Documentation\Policies\DocumentationPermissionPolicy;
use Webkul\Documentation\Policies\DocumentationShareLinkPolicy;
use Webkul\Documentation\Policies\DocumentationSpacePolicy;
use Webkul\Documentation\Policies\DocumentationTagPolicy;
use Webkul\Documentation\Policies\DocumentationTemplatePolicy;
use Webkul\PluginManager\Console\Commands\InstallCommand;
use Webkul\PluginManager\Console\Commands\UninstallCommand;
use Webkul\PluginManager\Package;
use Webkul\PluginManager\PackageServiceProvider;
use Webkul\Project\Models\Project;

class DocumentationServiceProvider extends PackageServiceProvider
{
    public static string $name = 'documentation';

    public function configureCustomPackage(Package $package): void
    {
        $package->name(static::$name)
            ->hasConfigFile(['documentation', 'filament-shield'])
            ->hasRoute('api')
            ->hasRoute('web')
            ->hasViews()
            ->hasTranslations()
            ->hasMigrations([
                '2026_05_07_151000_create_documentation_articles_table',
                '2026_05_07_153500_add_project_and_assignee_to_documentation_articles_table',
                '2026_05_07_230000_add_documentation_assignee_to_projects_table',
                '2026_05_19_120000_ensure_documentation_assignee_on_projects_table',
                '2026_05_21_140000_ensure_documentation_assignee_column_on_projects',
                '2026_05_18_100000_create_documentation_spaces_table',
                '2026_05_18_100100_create_documentation_templates_table',
                '2026_05_18_100200_create_documentation_pages_table',
                '2026_05_18_100300_create_documentation_page_versions_table',
                '2026_05_18_100400_create_documentation_tags_table',
                '2026_05_18_100500_create_documentation_page_tags_table',
                '2026_05_18_100600_create_documentation_permissions_table',
                '2026_05_18_101000_add_role_id_to_documentation_permissions_table',
                '2026_05_18_100700_create_documentation_attachments_table',
                '2026_05_18_100800_create_documentation_share_links_table',
                '2026_05_18_101100_add_visibility_to_documentation_share_links_table',
                '2026_05_18_100900_create_documentation_audit_logs_table',
                '2026_05_19_140000_create_documentation_products_table',
                '2026_05_19_140100_add_product_id_to_documentation_spaces_table',
            ])
            ->runsMigrations()
            ->hasSeeder('Webkul\\Documentation\\Database\\Seeders\\DatabaseSeeder')
            ->hasInstallCommand(function (InstallCommand $command) {
                $command->runsMigrations();
            })
            ->hasUninstallCommand(function (UninstallCommand $command) {})
            ->icon('documentation');
    }

    public function packageRegistered(): void
    {
        Panel::configureUsing(function (Panel $panel): void {
            $panel->plugin(DocumentationPlugin::make());
        });
    }

    public function packageBooted(): void
    {
        Gate::policy(DocumentationArticle::class, DocumentationArticlePolicy::class);
        Gate::policy(DocumentationSpace::class, DocumentationSpacePolicy::class);
        Gate::policy(DocumentationPage::class, DocumentationPagePolicy::class);
        Gate::policy(DocumentationTemplate::class, DocumentationTemplatePolicy::class);
        Gate::policy(DocumentationTag::class, DocumentationTagPolicy::class);
        Gate::policy(DocumentationPermission::class, DocumentationPermissionPolicy::class);
        Gate::policy(DocumentationShareLink::class, DocumentationShareLinkPolicy::class);
        Gate::policy(DocumentationPageVersion::class, DocumentationPageVersionPolicy::class);
        Gate::policy(DocumentationAuditLog::class, DocumentationAuditLogPolicy::class);

        if (! Package::isPluginInstalled(static::$name)) {
            return;
        }

        FilamentAsset::register([
            Css::make('documentation-portal', __DIR__.'/../resources/css/documentation-portal.css'),
        ], 'documentation');

        FilamentView::registerRenderHook(
            PanelsRenderHook::STYLES_AFTER,
            function (): ?HtmlString {
                if (! request()->routeIs('filament.admin.documentation.*')) {
                    return null;
                }

                return new HtmlString(
                    '<link rel="stylesheet" href="'.e(FilamentAsset::getStyleHref('documentation-portal', 'documentation')).'" />'
                );
            },
        );

        Livewire::component('documentation-public-shared-page', PublicSharedPage::class);

        $this->registerProjectDocumentationObserver();
    }

    protected function registerProjectDocumentationObserver(): void
    {
        if (! class_exists(Project::class)) {
            return;
        }

        Project::observe(ProjectDocumentationObserver::class);
    }
}
