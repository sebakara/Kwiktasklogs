<?php

namespace Webkul\Invoice\Filament\Clusters\Configuration\Resources;

use Webkul\Account\Filament\Resources\AccountResource as BaseAccountResource;
use Webkul\Invoice\Filament\Clusters\Configuration;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\ChartOfAccountResource\Pages\ManageAccounts;

class ChartOfAccountResource extends BaseAccountResource
{
    protected static bool $shouldRegisterNavigation = true;

    protected static ?int $navigationSort = 11;

    protected static ?string $cluster = Configuration::class;

    public static function getModelLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/chart-of-account.model-label');
    }

    public static function getNavigationLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/chart-of-account.navigation.title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('invoices::filament/clusters/configurations/resources/chart-of-account.navigation.group');
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageAccounts::route('/'),
        ];
    }
}
