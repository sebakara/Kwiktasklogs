<?php

namespace Webkul\Performance\Filament\Resources\KpiResource\Pages;

use Filament\Actions\DeleteAction;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Webkul\Performance\Filament\Resources\KpiResource;

class EditKpi extends EditRecord
{
    protected static string $resource = KpiResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', ['record' => $this->getRecord()]);
    }

    protected function getSavedNotification(): Notification
    {
        return Notification::make()
            ->success()
            ->title('KPI updated')
            ->body('The KPI has been updated successfully.');
    }

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
