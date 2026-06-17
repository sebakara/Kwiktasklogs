<?php

namespace Webkul\Invoice\Filament\Clusters\Configuration\Resources\PaymentMethodResource\Pages;

use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\PaymentMethodResource;

class ManagePaymentMethods extends ManageRecords
{
    protected static string $resource = PaymentMethodResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make()
                ->icon('heroicon-o-plus-circle'),
        ];
    }
}
