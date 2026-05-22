<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages;

use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource;

class ListTimeOffPackages extends ListRecords
{
    protected static string $resource = TimeOffPackageResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
