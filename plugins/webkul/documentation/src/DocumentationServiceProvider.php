<?php

namespace Webkul\Documentation;

use Filament\Panel;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Route;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Documentation\Policies\DocumentationArticlePolicy;
use Webkul\PluginManager\Console\Commands\InstallCommand;
use Webkul\PluginManager\Console\Commands\UninstallCommand;
use Webkul\PluginManager\Package;
use Webkul\PluginManager\PackageServiceProvider;

class DocumentationServiceProvider extends PackageServiceProvider
{
    public static string $name = 'documentation';

    public function configureCustomPackage(Package $package): void
    {
        $package->name(static::$name)
            ->hasTranslations()
            ->hasViews()
            ->hasMigrations([
                '2026_05_07_151000_create_documentation_articles_table',
                '2026_05_07_153500_add_project_and_assignee_to_documentation_articles_table',
                '2026_05_07_230000_add_documentation_assignee_to_projects_table',
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

        if (! Package::isPluginInstalled(static::$name)) {
            return;
        }

        Route::redirect('/admin/documentation', '/admin/documentation/features', 302)
            ->middleware('web');
    }
}
