<?php

namespace Webkul\Performance\Filament\Resources\KpiResource\Pages;

use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;
use Webkul\Performance\Filament\Resources\KpiResource;

class ListKpis extends ListRecords
{
    protected static string $resource = KpiResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make()
                ->label('New KPI')
                ->icon('heroicon-o-plus-circle'),
        ];
    }
}
