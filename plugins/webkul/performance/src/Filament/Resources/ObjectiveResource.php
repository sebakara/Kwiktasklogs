<?php

namespace Webkul\Performance\Filament\Resources;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Webkul\Performance\Filament\Resources\ObjectiveResource\Pages;
use Webkul\Performance\Filament\Resources\ObjectiveResource\RelationManagers\KeyResultsRelationManager;
use Webkul\Performance\Models\Objective;

class ObjectiveResource extends Resource
{
    protected static ?string $model = Objective::class;

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-chart-bar';

    protected static ?int $navigationSort = 1;

    public static function getNavigationLabel(): string
    {
        return 'Objectives';
    }

    public static function getNavigationGroup(): string
    {
        return 'Performance';
    }

    public static function form(Schema $schema): Schema
    {
        return $schema->components([
            Section::make('Objective Details')
                ->schema([
                    TextInput::make('title')
                        ->label('Title')
                        ->required()
                        ->maxLength(255)
                        ->columnSpanFull(),
                    Textarea::make('description')
                        ->label('Description')
                        ->rows(3)
                        ->columnSpanFull(),
                    Select::make('owner_id')
                        ->label('Owner')
                        ->relationship('owner', 'name')
                        ->searchable()
                        ->preload()
                        ->nullable(),
                    Select::make('status')
                        ->label('Status')
                        ->options([
                            'draft'     => 'Draft',
                            'active'    => 'Active',
                            'completed' => 'Completed',
                            'cancelled' => 'Cancelled',
                        ])
                        ->default('draft')
                        ->required(),
                    DatePicker::make('start_date')
                        ->label('Start Date')
                        ->native(false)
                        ->suffixIcon('heroicon-o-calendar'),
                    DatePicker::make('end_date')
                        ->label('End Date')
                        ->native(false)
                        ->suffixIcon('heroicon-o-calendar'),
                ])
                ->columns(2),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn ($query) => $query->with('keyResults'))
            ->columns([
                TextColumn::make('title')
                    ->label('Title')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('owner.name')
                    ->label('Owner')
                    ->sortable(),
                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'active'    => 'success',
                        'completed' => 'info',
                        'cancelled' => 'danger',
                        default     => 'gray',
                    }),
                TextColumn::make('start_date')
                    ->label('Start Date')
                    ->date()
                    ->sortable(),
                TextColumn::make('end_date')
                    ->label('End Date')
                    ->date()
                    ->sortable(),
                TextColumn::make('progress')
                    ->label('Progress')
                    ->suffix('%')
                    ->badge()
                    ->color(fn (Objective $record): string => match (true) {
                        $record->progress >= 100 => 'success',
                        $record->progress >= 50  => 'warning',
                        default                  => 'danger',
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

    public static function getRelations(): array
    {
        return [
            KeyResultsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListObjectives::route('/'),
            'create' => Pages\CreateObjective::route('/create'),
            'view'   => Pages\ViewObjective::route('/{record}'),
            'edit'   => Pages\EditObjective::route('/{record}/edit'),
        ];
    }
}
