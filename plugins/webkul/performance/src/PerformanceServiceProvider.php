<?php

namespace Webkul\Performance;

use Filament\Panel;
use Webkul\PluginManager\Console\Commands\InstallCommand;
use Webkul\PluginManager\Console\Commands\UninstallCommand;
use Webkul\PluginManager\Package;
use Webkul\PluginManager\PackageServiceProvider;

class PerformanceServiceProvider extends PackageServiceProvider
{
    public static string $name = 'performance';

    public static string $viewNamespace = 'performance';

    public function configureCustomPackage(Package $package): void
    {
        $package->name(static::$name)
            ->hasMigrations([
                '2026_06_10_000001_create_performance_objectives_table',
                '2026_06_10_000002_create_performance_key_results_table',
                '2026_06_10_000003_create_performance_kpis_table',
            ])
            ->runsMigrations()
            ->hasInstallCommand(function (InstallCommand $command) {
                $command->runsMigrations();
            })
            ->hasUninstallCommand(function (UninstallCommand $command) {});
    }

    public function packageRegistered(): void
    {
        Panel::configureUsing(function (Panel $panel): void {
            $panel->plugin(PerformancePlugin::make());
        });
    }
}
