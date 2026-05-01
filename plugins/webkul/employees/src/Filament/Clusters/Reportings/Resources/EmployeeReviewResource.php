<?php

namespace Webkul\Employee\Filament\Clusters\Reportings\Resources;

use Filament\Actions\ActionGroup;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions\ViewAction;
use Filament\Infolists\Components\TextEntry;
use Filament\Panel;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\QueryBuilder;
use Filament\Tables\Filters\QueryBuilder\Constraints\DateConstraint;
use Filament\Tables\Filters\QueryBuilder\Constraints\RelationshipConstraint;
use Filament\Tables\Filters\QueryBuilder\Constraints\RelationshipConstraint\Operators\IsRelatedToOperator;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Grouping\Group;
use Filament\Tables\Table;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Employee\Filament\Clusters\Reportings;
use Webkul\Employee\Filament\Clusters\Reportings\Resources\EmployeeReviewResource\Pages\ListEmployeeReviews;
use Webkul\Employee\Filament\Clusters\Reportings\Resources\EmployeeReviewResource\Pages\ViewEmployeeReview;
use Webkul\Employee\Models\EmployeeReview;

class EmployeeReviewResource extends Resource
{
    protected static ?string $model = EmployeeReview::class;

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->with([
                'employee.department',
                'reviewer',
            ]);
    }

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-clipboard-document-check';

    protected static ?string $cluster = Reportings::class;

    protected static ?int $navigationSort = 5;

    public static function getModelLabel(): string
    {
        return __('employees::filament/clusters/reportings/resources/employee-review.title');
    }

    public static function getPluralModelLabel(): string
    {
        return __('employees::filament/clusters/reportings/resources/employee-review.navigation.title');
    }

    public static function getNavigationLabel(): string
    {
        return __('employees::filament/clusters/reportings/resources/employee-review.navigation.title');
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('employee.name')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.employee'))
                    ->searchable()
                    ->sortable(),
                TextColumn::make('employee.department.name')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.department'))
                    ->toggleable()
                    ->sortable(),
                TextColumn::make('period_label')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-label'))
                    ->searchable()
                    ->sortable(),
                TextColumn::make('period_type')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-type'))
                    ->formatStateUsing(function ($state): string {
                        if ($state instanceof EmployeeReviewPeriodType) {
                            return $state->getLabel();
                        }

                        return EmployeeReviewPeriodType::from((string) $state)->getLabel();
                    })
                    ->badge(),
                TextColumn::make('period_start')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-start'))
                    ->date()
                    ->sortable(),
                TextColumn::make('period_end')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-end'))
                    ->date()
                    ->sortable(),
                TextColumn::make('status')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.status'))
                    ->badge()
                    ->formatStateUsing(function ($state): string {
                        if ($state instanceof EmployeeReviewStatus) {
                            return $state->getLabel();
                        }

                        return EmployeeReviewStatus::from((string) $state)->getLabel();
                    }),
                TextColumn::make('manager_rating')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.manager-rating'))
                    ->sortable(),
                TextColumn::make('reviewer.name')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.reviewer'))
                    ->sortable(),
                TextColumn::make('created_at')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.created-at'))
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->defaultSort('period_start', 'desc')
            ->paginated([10, 25, 50])
            ->groups([
                Group::make('employee.name')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.employee'))
                    ->collapsible(),
                Group::make('period_type')
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-type'))
                    ->collapsible(),
            ])
            ->filtersFormColumns(2)
            ->filters([
                SelectFilter::make('employee')
                    ->relationship('employee', 'name')
                    ->preload()
                    ->searchable()
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.employee')),
                SelectFilter::make('reviewer')
                    ->relationship('reviewer', 'name')
                    ->preload()
                    ->searchable()
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.reviewer')),
                SelectFilter::make('period_type')
                    ->options(EmployeeReviewPeriodType::options())
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.period-type')),
                SelectFilter::make('status')
                    ->options(EmployeeReviewStatus::options())
                    ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.status')),
                QueryBuilder::make()
                    ->constraintPickerColumns(2)
                    ->constraints([
                        RelationshipConstraint::make('employee')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.employee'))
                            ->icon('heroicon-o-user')
                            ->multiple()
                            ->selectable(
                                IsRelatedToOperator::make()
                                    ->titleAttribute('name')
                                    ->searchable()
                                    ->multiple()
                                    ->preload(),
                            ),
                        RelationshipConstraint::make('reviewer')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.reviewer'))
                            ->icon('heroicon-o-user')
                            ->multiple()
                            ->selectable(
                                IsRelatedToOperator::make()
                                    ->titleAttribute('name')
                                    ->searchable()
                                    ->multiple()
                                    ->preload(),
                            ),
                        DateConstraint::make('period_start')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.filters.period-start')),
                    ]),
            ])
            ->recordActions([
                ActionGroup::make([
                    ViewAction::make(),
                ]),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('employees::filament/clusters/reportings/resources/employee-review.infolist.sections.review.title'))
                    ->schema([
                        TextEntry::make('employee.name')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.employee')),
                        TextEntry::make('employee.department.name')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.department')),
                        TextEntry::make('period_label')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-label')),
                        TextEntry::make('period_type')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-type'))
                            ->formatStateUsing(function ($state): string {
                                if ($state instanceof EmployeeReviewPeriodType) {
                                    return $state->getLabel();
                                }

                                return EmployeeReviewPeriodType::from((string) $state)->getLabel();
                            }),
                        TextEntry::make('period_start')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-start'))
                            ->date(),
                        TextEntry::make('period_end')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.period-end'))
                            ->date(),
                        TextEntry::make('status')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.status'))
                            ->badge(),
                        TextEntry::make('manager_rating')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.manager-rating')),
                        TextEntry::make('manager_comments')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.form.manager-comments'))
                            ->columnSpanFull(),
                        TextEntry::make('reviewer.name')
                            ->label(__('employees::filament/clusters/reportings/resources/employee-review.table.columns.reviewer')),
                    ])
                    ->columns(2),
                Section::make(__('employees::filament/clusters/reportings/resources/employee-review.infolist.sections.metrics.title'))
                    ->schema([
                        TextEntry::make('metrics_snapshot')
                            ->label(__('employees::filament/resources/employee/pages/manage-review.infolist.metrics.label'))
                            ->formatStateUsing(function (?array $state): string {
                                if ($state === null || $state === []) {
                                    return '—';
                                }

                                return json_encode($state, JSON_PRETTY_PRINT);
                            })
                            ->columnSpanFull(),
                    ]),
            ]);
    }

    public static function getSlug(?Panel $panel = null): string
    {
        return 'employees/reviews';
    }

    public static function getPages(): array
    {
        return [
            'index' => ListEmployeeReviews::route('/'),
            'view' => ViewEmployeeReview::route('/{record}'),
        ];
    }
}
