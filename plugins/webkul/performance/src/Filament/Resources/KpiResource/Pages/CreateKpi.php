<?php

namespace Webkul\Performance\Filament\Resources\KpiResource\Pages;

use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Webkul\Performance\Filament\Resources\KpiResource;

class CreateKpi extends CreateRecord
{
    protected static string $resource = KpiResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', ['record' => $this->getRecord()]);
    }

    protected function getCreatedNotification(): Notification
    {
        return Notification::make()
            ->success()
            ->title('KPI created')
            ->body('The KPI has been created successfully.');
    }
}
