<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\RelationManagers;

use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class PackageLineRelationManager extends RelationManager
{
    protected static string $relationship = 'lines';

    public static function getTitle(Model $ownerRecord, string $pageClass): string
    {
        return __('time-off::filament/clusters/configurations/resources/time-off-package.relation-managers.lines.title');
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('leave_type_id')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.relation-managers.lines.fields.leave-type'))
                    ->relationship('leaveType', 'name', fn ($query) => $query->where('is_active', true))
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('number_of_days')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.relation-managers.lines.fields.days'))
                    ->numeric()
                    ->minValue(0.5)
                    ->step(0.5)
                    ->required()
                    ->default(1),
                TextInput::make('sort')
                    ->numeric()
                    ->default(0)
                    ->hidden(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('leaveType.name')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.relation-managers.lines.fields.leave-type'))
                    ->searchable(),
                TextColumn::make('number_of_days')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.relation-managers.lines.fields.days'))
                    ->numeric(decimalPlaces: 1),
            ])
            ->headerActions([
                CreateAction::make(),
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->defaultSort('sort');
    }
}
