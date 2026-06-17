<?php

namespace Webkul\Invoice\Filament\Clusters\Configuration\Resources\ChartOfAccountResource\Pages;

use Webkul\Account\Filament\Resources\AccountResource\Pages\ManageAccounts as BaseManageAccounts;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\ChartOfAccountResource;

class ManageAccounts extends BaseManageAccounts
{
    protected static string $resource = ChartOfAccountResource::class;
}
