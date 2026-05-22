<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages;

use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource;

class ViewTimeOffPackage extends ViewRecord
{
    protected static string $resource = TimeOffPackageResource::class;

    protected function getHeaderActions(): array
    {
        return [
            TimeOffPackageResource::getAssignAction(),
            EditAction::make(),
        ];
    }
}
