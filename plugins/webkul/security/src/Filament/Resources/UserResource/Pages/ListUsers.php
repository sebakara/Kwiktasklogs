<?php

namespace Webkul\Security\Filament\Resources\UserResource\Pages;

use Filament\Resources\Pages\ListRecords;
use Filament\Schemas\Components\Tabs\Tab;
use Webkul\Security\Filament\Resources\UserResource;

class ListUsers extends ListRecords
{
    protected static string $resource = UserResource::class;

    public function getTabs(): array
    {
        $query = static::getResource()::getEloquentQuery();

        return [
            'all' => Tab::make(__('security::filament/resources/user/pages/list-user.tabs.all'))
                ->badge($query->count()),
            'archived' => Tab::make(__('security::filament/resources/user/pages/list-user.tabs.archived'))
                ->badge($query->onlyTrashed()->count())
                ->modifyQueryUsing(function ($query) {
                    return $query->onlyTrashed();
                }),
        ];
    }

    protected function getHeaderActions(): array
    {
        return [];
    }
}
