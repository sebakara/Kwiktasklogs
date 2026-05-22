<?php

namespace Webkul\TimeOff\Filament\Clusters\Configurations\Resources;

use BackedEnum;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Gate;
use Webkul\TimeOff\Filament\Clusters\Configurations;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages\CreateTimeOffPackage;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages\EditTimeOffPackage;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages\ListTimeOffPackages;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\Pages\ViewTimeOffPackage;
use Webkul\TimeOff\Filament\Clusters\Configurations\Resources\TimeOffPackageResource\RelationManagers\PackageLineRelationManager;
use Webkul\TimeOff\Models\TimeOffPackage;
use Webkul\TimeOff\Services\TimeOffPackageAssignmentService;

class TimeOffPackageResource extends Resource
{
    protected static ?string $model = TimeOffPackage::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-gift';

    protected static ?string $cluster = Configurations::class;

    protected static ?int $navigationSort = 3;

    protected static ?string $recordTitleAttribute = 'name';

    public static function getModelLabel(): string
    {
        return __('time-off::filament/clusters/configurations/resources/time-off-package.title');
    }

    public static function getPluralModelLabel(): string
    {
        return __('time-off::filament/clusters/configurations/resources/time-off-package.plural');
    }

    public static function getNavigationLabel(): string
    {
        return __('time-off::filament/clusters/configurations/resources/time-off-package.navigation.title');
    }

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('time-off::filament/clusters/configurations/resources/time-off-package.form.sections.general.title'))
                    ->schema([
                        TextInput::make('name')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.name'))
                            ->required()
                            ->maxLength(255)
                            ->columnSpanFull(),
                        Textarea::make('description')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.description'))
                            ->rows(3)
                            ->columnSpanFull(),
                        Select::make('company_id')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.company'))
                            ->relationship('company', 'name')
                            ->searchable()
                            ->preload(),
                        Toggle::make('is_active')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.is-active'))
                            ->default(true),
                    ])
                    ->columns(2),
                Section::make(__('time-off::filament/clusters/configurations/resources/time-off-package.form.sections.validity.title'))
                    ->schema([
                        DatePicker::make('valid_from')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.valid-from'))
                            ->required()
                            ->default(now()->startOfYear()),
                        DatePicker::make('valid_to')
                            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.valid-to'))
                            ->placeholder(__('time-off::filament/clusters/configurations/resources/time-off-package.form.fields.valid-to-placeholder'))
                            ->after('valid_from'),
                    ])
                    ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.name'))
                    ->searchable()
                    ->sortable(),
                TextColumn::make('valid_from')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.valid-from'))
                    ->date()
                    ->sortable(),
                TextColumn::make('valid_to')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.valid-to'))
                    ->date()
                    ->placeholder('—')
                    ->sortable(),
                TextColumn::make('lines_count')
                    ->counts('lines')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.lines')),
                TextColumn::make('total_days')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.total-days'))
                    ->state(fn (TimeOffPackage $record): string => (string) round($record->lines()->sum('number_of_days'), 1)),
                IconColumn::make('is_active')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.active'))
                    ->boolean(),
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                static::getAssignAction(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getAssignAction(): Action
    {
        return Action::make('assign')
            ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.label'))
            ->icon('heroicon-o-user-plus')
            ->color('primary')
            ->visible(fn (TimeOffPackage $record): bool => Gate::check('assign', $record))
            ->modalHeading(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.modal.heading'))
            ->modalDescription(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.modal.description'))
            ->schema([
                Toggle::make('assign_all_active')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.assign-all-active'))
                    ->live()
                    ->default(false),
                Select::make('employee_ids')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.fields.employees'))
                    ->multiple()
                    ->searchable()
                    ->preload()
                    ->options(function (TimeOffPackage $record): array {
                        return app(TimeOffPackageAssignmentService::class)
                            ->activeEmployeesForCompany($record->company_id)
                            ->pluck('name', 'id')
                            ->all();
                    })
                    ->required(fn (Get $get): bool => ! $get('assign_all_active'))
                    ->hidden(fn (Get $get): bool => (bool) $get('assign_all_active')),
                Toggle::make('auto_approve')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.fields.auto-approve'))
                    ->default(true),
                Textarea::make('notes')
                    ->label(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.fields.notes'))
                    ->rows(2),
            ])
            ->action(function (TimeOffPackage $record, array $data): void {
                $service = app(TimeOffPackageAssignmentService::class);

                $employeeIds = ($data['assign_all_active'] ?? false)
                    ? $service->activeEmployeesForCompany(scopeToCompany: false)->pluck('id')->all()
                    : ($data['employee_ids'] ?? []);

                $result = $service->assignToEmployees(
                    $record,
                    $employeeIds,
                    (bool) ($data['auto_approve'] ?? true),
                    $data['notes'] ?? null,
                );

                if ($result->allocationsCreated === 0) {
                    $body = $result->messages[0]
                        ?? ($result->allocationsSkipped > 0
                            ? __('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.empty.all-skipped')
                            : __('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.empty.body'));

                    Notification::make()
                        ->warning()
                        ->title(__('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.empty.title'))
                        ->body($body)
                        ->send();

                    return;
                }

                $notification = Notification::make()
                    ->title($result->hasWarnings()
                        ? __('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.warning.title')
                        : __('time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.success.title'))
                    ->body(__($result->hasWarnings()
                        ? 'time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.warning.body'
                        : 'time-off::filament/clusters/configurations/resources/time-off-package.actions.assign.notification.success.body', [
                            'created'   => $result->allocationsCreated,
                            'employees' => $result->employeesProcessed,
                            'skipped'   => $result->allocationsSkipped,
                        ]));

                if ($result->hasWarnings()) {
                    $notification->warning();
                } else {
                    $notification->success();
                }

                $notification->send();
            });
    }

    public static function getRelations(): array
    {
        return [
            PackageLineRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => ListTimeOffPackages::route('/'),
            'create' => CreateTimeOffPackage::route('/create'),
            'view'   => ViewTimeOffPackage::route('/{record}'),
            'edit'   => EditTimeOffPackage::route('/{record}/edit'),
        ];
    }

    public static function getGloballySearchableAttributes(): array
    {
        return ['name'];
    }

    public static function getGlobalSearchResultDetails(Model $record): array
    {
        return [
            __('time-off::filament/clusters/configurations/resources/time-off-package.table.columns.valid-from') => $record->valid_from?->format('Y-m-d') ?? '—',
        ];
    }
}
