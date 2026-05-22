<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages;

use Filament\Resources\Pages\CreateRecord;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource;

class CreateTimeOffPackage extends CreateRecord
{
    protected static string $resource = TimeOffPackageResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('edit', ['record' => $this->getRecord()]);
    }
}
