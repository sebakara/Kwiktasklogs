<?php

namespace Webkul\Performance\Filament\Resources\ObjectiveResource\RelationManagers;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Notifications\Notification;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Webkul\Performance\Models\KeyResult;

class KeyResultsRelationManager extends RelationManager
{
    protected static string $relationship = 'keyResults';

    public static function getTitle(\Illuminate\Database\Eloquent\Model $ownerRecord, string $pageClass): string
    {
        return 'Key Results';
    }

    public function form(Schema $schema): Schema
    {
        return $schema->components([
            TextInput::make('title')
                ->label('Title')
                ->required()
                ->maxLength(255)
                ->columnSpanFull(),
            TextInput::make('target_value')
                ->label('Target Value')
                ->numeric()
                ->default(0)
                ->minValue(0),
            TextInput::make('current_value')
                ->label('Current Value')
                ->numeric()
                ->default(0)
                ->minValue(0),
            TextInput::make('unit')
                ->label('Unit')
                ->maxLength(20)
                ->placeholder('%'),
        ])->columns(2);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')
                    ->label('Title')
                    ->searchable(),
                TextColumn::make('target_value')
                    ->label('Target')
                    ->numeric(),
                TextColumn::make('current_value')
                    ->label('Current')
                    ->numeric(),
                TextColumn::make('unit')
                    ->label('Unit'),
                TextColumn::make('progress')
                    ->label('Progress')
                    ->suffix('%')
                    ->badge()
                    ->color(fn (KeyResult $record): string => match (true) {
                        $record->progress >= 100 => 'success',
                        $record->progress >= 50  => 'warning',
                        default                  => 'danger',
                    }),
            ])
            ->headerActions([
                CreateAction::make()
                    ->label('Add Key Result')
                    ->icon('heroicon-o-plus-circle')
                    ->successNotification(
                        Notification::make()
                            ->success()
                            ->title('Key result added')
                            ->body('The key result has been added successfully.'),
                    ),
            ])
            ->recordActions([
                EditAction::make()
                    ->successNotification(
                        Notification::make()
                            ->success()
                            ->title('Key result updated')
                            ->body('The key result has been updated successfully.'),
                    ),
                DeleteAction::make()
                    ->successNotification(
                        Notification::make()
                            ->success()
                            ->title('Key result deleted')
                            ->body('The key result has been deleted successfully.'),
                    ),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
