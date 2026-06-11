<?php

namespace Webkul\Performance\Filament\Resources\ObjectiveResource\Pages;

use Filament\Actions\DeleteAction;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Webkul\Performance\Filament\Resources\ObjectiveResource;

class EditObjective extends EditRecord
{
    protected static string $resource = ObjectiveResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', ['record' => $this->getRecord()]);
    }

    protected function getSavedNotification(): Notification
    {
        return Notification::make()
            ->success()
            ->title('Objective updated')
            ->body('The objective has been updated successfully.');
    }

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
