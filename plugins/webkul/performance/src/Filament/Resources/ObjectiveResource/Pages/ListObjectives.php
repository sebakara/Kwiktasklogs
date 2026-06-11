<?php

namespace Webkul\Performance\Filament\Resources\ObjectiveResource\Pages;

use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;
use Webkul\Performance\Filament\Resources\ObjectiveResource;

class ListObjectives extends ListRecords
{
    protected static string $resource = ObjectiveResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make()
                ->label('New Objective')
                ->icon('heroicon-o-plus-circle'),
        ];
    }
}
