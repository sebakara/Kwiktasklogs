<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages;

use Filament\Resources\Pages\EditRecord;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource;

class EditTimeOffPackage extends EditRecord
{
    protected static string $resource = TimeOffPackageResource::class;

    protected function getHeaderActions(): array
    {
        return [
            TimeOffPackageResource::getAssignAction(),
        ];
    }
}
