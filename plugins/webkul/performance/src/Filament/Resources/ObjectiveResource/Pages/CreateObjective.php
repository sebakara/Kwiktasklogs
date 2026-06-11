<?php

namespace Webkul\Performance\Filament\Resources\ObjectiveResource\Pages;

use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Webkul\Performance\Filament\Resources\ObjectiveResource;

class CreateObjective extends CreateRecord
{
    protected static string $resource = ObjectiveResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', ['record' => $this->getRecord()]);
    }

    protected function getCreatedNotification(): Notification
    {
        return Notification::make()
            ->success()
            ->title('Objective created')
            ->body('The objective has been created successfully.');
    }
}
