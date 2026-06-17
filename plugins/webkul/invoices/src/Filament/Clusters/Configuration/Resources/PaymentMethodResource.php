<?php

namespace Webkul\Invoice\Filament\Clusters\Configuration\Resources;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Webkul\Account\Enums\PaymentType;
use Webkul\Account\Models\PaymentMethod;
use Webkul\Invoice\Filament\Clusters\Configuration;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\PaymentMethodResource\Pages\ManagePaymentMethods;

class PaymentMethodResource extends Resource
{
    protected static ?string $model = PaymentMethod::class;

    protected static bool $shouldRegisterNavigation = true;

    protected static ?int $navigationSort = 10;

    protected static ?string $cluster = Configuration::class;

    protected static bool $isGloballySearchable = false;

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-credit-card';

    public static function getModelLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/payment-method.model-label');
    }

    public static function getNavigationLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/payment-method.navigation.title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('invoices::filament/clusters/configurations/resources/payment-method.navigation.group');
    }

    public static function form(Schema $schema): Schema
    {
        return $schema->components([
            Section::make()->schema([
                TextInput::make('name')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.form.fields.name'))
                    ->required()
                    ->maxLength(255),

                TextInput::make('code')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.form.fields.code'))
                    ->required()
                    ->maxLength(255),

                Select::make('payment_type')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.form.fields.payment-type'))
                    ->options(PaymentType::options())
                    ->required(),
            ])->columns(2),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.table.columns.name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('code')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.table.columns.code'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('payment_type')
                    ->label(__('invoices::filament/clusters/configurations/resources/payment-method.table.columns.payment-type'))
                    ->badge()
                    ->sortable(),
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => ManagePaymentMethods::route('/'),
        ];
    }
}
