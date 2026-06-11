<?php

namespace Webkul\Performance\Filament\Resources;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Webkul\Performance\Filament\Resources\KpiResource\Pages;
use Webkul\Performance\Models\Kpi;

class KpiResource extends Resource
{
    protected static ?string $model = Kpi::class;

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-presentation-chart-line';

    protected static ?int $navigationSort = 2;

    public static function getNavigationLabel(): string
    {
        return 'KPIs';
    }

    public static function getNavigationGroup(): string
    {
        return 'Performance';
    }

    public static function form(Schema $schema): Schema
    {
        return $schema->components([
            Section::make('KPI Details')
                ->schema([
                    TextInput::make('name')
                        ->label('Name')
                        ->required()
                        ->maxLength(255)
                        ->columnSpanFull(),
                    Textarea::make('description')
                        ->label('Description')
                        ->rows(3)
                        ->columnSpanFull(),
                    TextInput::make('target_value')
                        ->label('Target Value')
                        ->numeric()
                        ->default(0)
                        ->minValue(0)
                        ->required(),
                    TextInput::make('current_value')
                        ->label('Current Value')
                        ->numeric()
                        ->default(0)
                        ->minValue(0)
                        ->required(),
                    TextInput::make('unit')
                        ->label('Unit')
                        ->maxLength(50)
                        ->placeholder('e.g. RWF, %, units'),
                    TextInput::make('period')
                        ->label('Period')
                        ->maxLength(100)
                        ->placeholder('e.g. Monthly, Q1 2026'),
                    Select::make('owner_id')
                        ->label('Owner')
                        ->relationship('owner', 'name')
                        ->searchable()
                        ->preload()
                        ->nullable(),
                ])
                ->columns(2),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label('Name')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('owner.name')
                    ->label('Owner')
                    ->sortable(),
                TextColumn::make('target_value')
                    ->label('Target')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('current_value')
                    ->label('Current')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('unit')
                    ->label('Unit'),
                TextColumn::make('period')
                    ->label('Period'),
                TextColumn::make('progress')
                    ->label('Progress')
                    ->suffix('%')
                    ->badge()
                    ->color(fn (Kpi $record): string => match (true) {
                        $record->progress >= 80 => 'success',
                        $record->progress >= 50 => 'warning',
                        default                 => 'danger',
                    }),
                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'on_track'  => 'On Track',
                        'at_risk'   => 'At Risk',
                        'off_track' => 'Off Track',
                        default     => $state,
                    })
                    ->color(fn (string $state): string => match ($state) {
                        'on_track'  => 'success',
                        'at_risk'   => 'warning',
                        'off_track' => 'danger',
                        default     => 'gray',
                    }),
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListKpis::route('/'),
            'create' => Pages\CreateKpi::route('/create'),
            'view'   => Pages\ViewKpi::route('/{record}'),
            'edit'   => Pages\EditKpi::route('/{record}/edit'),
        ];
    }
}
