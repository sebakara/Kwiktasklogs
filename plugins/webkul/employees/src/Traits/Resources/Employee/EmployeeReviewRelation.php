<?php

namespace Webkul\Employee\Traits\Resources\Employee;

use Carbon\Carbon;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Actions\Contracts\HasActions;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;
use Filament\Notifications\Notification;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Contracts\HasSchemas;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Employee\Models\EmployeeReview;
use Webkul\Employee\Services\EmployeeReviewMetricsService;
use Webkul\Employee\Services\EmployeeReviewPeriodResolver;

trait EmployeeReviewRelation
{
    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('employees::filament/resources/employee/pages/manage-review.form.section.period.title'))
                    ->schema([
                        Select::make('period_type')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.period-type'))
                            ->options(EmployeeReviewPeriodType::options())
                            ->required()
                            ->live(),
                        DatePicker::make('reference_date')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.reference-date'))
                            ->default(now())
                            ->native(false)
                            ->visible(fn (Get $get): bool => $get('period_type') !== EmployeeReviewPeriodType::Custom->value),
                        DatePicker::make('custom_period_start')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.custom-period-start'))
                            ->native(false)
                            ->visible(fn (Get $get): bool => $get('period_type') === EmployeeReviewPeriodType::Custom->value),
                        DatePicker::make('custom_period_end')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.custom-period-end'))
                            ->native(false)
                            ->visible(fn (Get $get): bool => $get('period_type') === EmployeeReviewPeriodType::Custom->value),
                        TextInput::make('manager_rating')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-rating'))
                            ->numeric()
                            ->minValue(0)
                            ->maxValue(100)
                            ->step(0.01),
                        Textarea::make('manager_comments')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-comments'))
                            ->rows(4)
                            ->columnSpanFull(),
                    ])
                    ->columns(2)
                    ->columnSpanFull(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('period_label')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-label'))
                    ->searchable()
                    ->sortable(),
                TextColumn::make('period_type')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-type'))
                    ->formatStateUsing(function ($state): string {
                        if ($state instanceof EmployeeReviewPeriodType) {
                            return $state->getLabel();
                        }

                        return EmployeeReviewPeriodType::from((string) $state)->getLabel();
                    })
                    ->badge(),
                TextColumn::make('period_start')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-start'))
                    ->date()
                    ->sortable(),
                TextColumn::make('period_end')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-end'))
                    ->date()
                    ->sortable(),
                TextColumn::make('status')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.status'))
                    ->badge()
                    ->formatStateUsing(function ($state): string {
                        if ($state instanceof EmployeeReviewStatus) {
                            return $state->getLabel();
                        }

                        return EmployeeReviewStatus::from((string) $state)->getLabel();
                    }),
                TextColumn::make('manager_rating')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.manager-rating'))
                    ->sortable(),
                TextColumn::make('reviewer.name')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.reviewer'))
                    ->sortable(),
                TextColumn::make('created_at')
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.created-at'))
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->defaultSort('period_start', 'desc')
            ->headerActions([
                CreateAction::make()
                    ->label(__('employees::filament/resources/employee/pages/manage-review.table.header-actions.create'))
                    ->icon(Heroicon::OutlinedPlusCircle)
                    ->createAnother(false)
                    ->using(function (array $data, HasActions & HasSchemas $livewire): EmployeeReview {
                        $employee = $livewire->getOwnerRecord();

                        $periodType = EmployeeReviewPeriodType::from($data['period_type']);
                        $resolver = app(EmployeeReviewPeriodResolver::class);

                        if ($periodType === EmployeeReviewPeriodType::Custom) {
                            if (empty($data['custom_period_start']) || empty($data['custom_period_end'])) {
                                throw ValidationException::withMessages([
                                    'custom_period_start' => __('validation.required', ['attribute' => 'start date']),
                                ]);
                            }

                            $period = $resolver->resolveCustom(
                                Carbon::parse($data['custom_period_start']),
                                Carbon::parse($data['custom_period_end'])
                            );
                        } else {
                            $reference = isset($data['reference_date'])
                                ? Carbon::parse($data['reference_date'])
                                : now();

                            $period = $resolver->resolve($periodType, $reference);
                        }

                        $exists = EmployeeReview::query()
                            ->where('employee_id', $employee->getKey())
                            ->where('period_type', $periodType->value)
                            ->whereDate('period_start', $period['start']->toDateString())
                            ->whereDate('period_end', $period['end']->toDateString())
                            ->exists();

                        if ($exists) {
                            Notification::make()
                                ->danger()
                                ->title(__('employees::filament/resources/employee/pages/manage-review.notifications.duplicate-period.title'))
                                ->body(__('employees::filament/resources/employee/pages/manage-review.notifications.duplicate-period.body'))
                                ->send();

                            throw ValidationException::withMessages([
                                'period_type' => __('employees::filament/resources/employee/pages/manage-review.notifications.duplicate-period.body'),
                            ]);
                        }

                        $metrics = app(EmployeeReviewMetricsService::class)->compute(
                            $employee,
                            $period['start'],
                            $period['end']
                        );

                        $review = new EmployeeReview([
                            'employee_id' => $employee->getKey(),
                            'reviewer_id' => Auth::id(),
                            'period_type' => $periodType,
                            'period_start' => $period['start']->toDateString(),
                            'period_end' => $period['end']->toDateString(),
                            'period_label' => $period['label'],
                            'metrics_snapshot' => $metrics,
                            'manager_rating' => $data['manager_rating'] ?? null,
                            'manager_comments' => $data['manager_comments'] ?? null,
                            'status' => EmployeeReviewStatus::Draft,
                            'company_id' => $employee->company_id,
                        ]);

                        $employee->reviews()->save($review);

                        return $review;
                    }),
            ])
            ->recordActions([
                ActionGroup::make([
                    ViewAction::make(),
                    EditAction::make()
                        ->visible(fn (EmployeeReview $record): bool => $record->status === EmployeeReviewStatus::Draft)
                        ->schema([
                            TextInput::make('manager_rating')
                                ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-rating'))
                                ->numeric()
                                ->minValue(0)
                                ->maxValue(100)
                                ->step(0.01),
                            Textarea::make('manager_comments')
                                ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-comments'))
                                ->rows(4),
                        ]),
                    Action::make('finalize')
                        ->label(__('employees::filament/resources/employee/pages/manage-review.table.actions.finalize.label'))
                        ->icon(Heroicon::OutlinedCheckCircle)
                        ->color('success')
                        ->visible(fn (EmployeeReview $record): bool => $record->status === EmployeeReviewStatus::Draft)
                        ->authorize(fn (EmployeeReview $record): bool => Auth::user()?->can('update', $record) ?? false)
                        ->requiresConfirmation()
                        ->modalHeading(__('employees::filament/resources/employee/pages/manage-review.table.actions.finalize.modal-heading'))
                        ->modalDescription(__('employees::filament/resources/employee/pages/manage-review.table.actions.finalize.modal-description'))
                        ->action(fn (EmployeeReview $record) => $record->update([
                            'status' => EmployeeReviewStatus::Finalized,
                        ])),
                    DeleteAction::make()
                        ->visible(fn (EmployeeReview $record): bool => $record->status === EmployeeReviewStatus::Draft),
                ]),
            ]);
    }

    public function infolist(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('employees::filament/resources/employee/pages/manage-review.infolist.section.review.title'))
                    ->schema([
                        TextEntry::make('period_label')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-label')),
                        TextEntry::make('period_type')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-type'))
                            ->formatStateUsing(function ($state): string {
                                if ($state instanceof EmployeeReviewPeriodType) {
                                    return $state->getLabel();
                                }

                                return EmployeeReviewPeriodType::from((string) $state)->getLabel();
                            }),
                        TextEntry::make('period_start')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-start'))
                            ->date(),
                        TextEntry::make('period_end')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.period-end'))
                            ->date(),
                        TextEntry::make('status')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.status'))
                            ->badge()
                            ->formatStateUsing(function ($state): string {
                                if ($state instanceof EmployeeReviewStatus) {
                                    return $state->getLabel();
                                }

                                return EmployeeReviewStatus::from((string) $state)->getLabel();
                            }),
                        TextEntry::make('manager_rating')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.manager-rating')),
                        TextEntry::make('manager_comments')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-comments'))
                            ->columnSpanFull(),
                        TextEntry::make('reviewer.name')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.table.columns.reviewer')),
                        TextEntry::make('metrics_snapshot')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.infolist.metrics.label'))
                            ->formatStateUsing(function (?array $state): string {
                                if ($state === null || $state === []) {
                                    return '—';
                                }

                                return json_encode($state, JSON_PRETTY_PRINT);
                            })
                            ->columnSpanFull(),
                    ])
                    ->columns(2)
                    ->columnSpanFull(),
            ]);
    }
}
