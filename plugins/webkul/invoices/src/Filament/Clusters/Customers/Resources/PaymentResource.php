<?php

namespace Webkul\Invoice\Filament\Clusters\Customers\Resources;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ExportAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Pages\Page;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Group;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
use Filament\Schemas\Schema;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema as DbSchema;
use Webkul\Account\Enums\JournalType;
use Webkul\Account\Enums\PaymentStatus;
use Webkul\Account\Enums\PaymentType;
use Webkul\Account\Filament\Resources\PaymentResource as BasePaymentResource;
use Webkul\Account\Models\Account;
use Webkul\Account\Models\Journal;
use Webkul\Account\Models\Payment;
use Webkul\Account\Models\PaymentMethodLine;
use Webkul\Field\Filament\Forms\Components\ProgressStepper as FormProgressStepper;
use Webkul\Invoice\Filament\Clusters\Customers;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages\CreatePayment;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages\EditPayment;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages\ListPayments;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages\ManageInvoices;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages\ViewPayment;
use Webkul\Invoice\Filament\Exports\PaymentVoucherExporter;
use Webkul\Invoice\Models\Payment as InvoicePayment;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class PaymentResource extends BasePaymentResource
{
    protected static ?string $model = InvoicePayment::class;

    protected static bool $shouldRegisterNavigation = true;

    protected static bool $isGloballySearchable = true;

    protected static ?int $navigationSort = 4;

    protected static ?string $cluster = Customers::class;

    public static function getModelLabel(): string
    {
        return __('invoices::filament/clusters/customers/resources/payment.title');
    }

    public static function getNavigationLabel(): string
    {
        return __('invoices::filament/clusters/customers/resources/payment.navigation.title');
    }

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->disabled(fn ($record) => $record && $record->state !== PaymentStatus::DRAFT)
            ->components([
                FormProgressStepper::make('state')
                    ->hiddenLabel()
                    ->inline()
                    ->options(function ($record) {
                        $options = PaymentStatus::options();
                        if ($record && $record->state != PaymentStatus::NOT_PAID) {
                            unset($options[PaymentStatus::NOT_PAID->value]);
                        }
                        if ($record && $record->state != PaymentStatus::CANCELED) {
                            unset($options[PaymentStatus::CANCELED->value]);
                        }
                        if ($record && $record->state != PaymentStatus::REJECTED) {
                            unset($options[PaymentStatus::REJECTED->value]);
                        }
                        if ($record == null) {
                            unset($options[PaymentStatus::CANCELED->value]);
                        }
                        return $options;
                    })
                    ->default(PaymentStatus::DRAFT->value)
                    ->columnSpan('full')
                    ->disabled()
                    ->live()
                    ->reactive(),

                Section::make('Payment Voucher')
                    ->schema([
                        // Row 1: Date + Voucher No.
                        Grid::make(2)->schema([
                            DatePicker::make('date')
                                ->label('Date')
                                ->native(false)
                                ->default(now())
                                ->required(),
                            TextInput::make('name')
                                ->label('Voucher No.')
                                ->placeholder('Auto-generated after save')
                                ->disabled()
                                ->dehydrated(false),
                        ]),

                        // Row 2: Method of Payment + Vendor
                        Grid::make(2)->schema([
                            Select::make('payment_method_line_id')
                                ->label('Method of Payment')
                                ->relationship(
                                    name: 'paymentMethodLine',
                                    titleAttribute: 'name',
                                    modifyQueryUsing: function (Builder $query, Get $get) {
                                        $journal = Journal::find($get('journal_id'));
                                        if (! $journal) {
                                            return $query->whereRaw('1 = 0');
                                        }
                                        $paymentMethodLineIds = $journal->getAvailablePaymentMethodLines($get('payment_type'))->pluck('id');
                                        return $query->whereIn('id', $paymentMethodLineIds);
                                    }
                                )
                                ->required()
                                ->searchable()
                                ->preload()
                                ->live(),

                            Select::make('partner_id')
                                ->label('Vendor')
                                ->relationship('partner', 'name', fn (Builder $query) => $query->orderBy('name'))
                                ->searchable()
                                ->preload(),
                        ]),

                        // Row 3: Bank Payment + Chart of Account
                        Grid::make(2)->schema([
                            Select::make('journal_id')
                                ->label('Bank Payment')
                                ->relationship(
                                    'journal',
                                    'name',
                                    modifyQueryUsing: fn (Builder $query) => $query->whereIn('type', [JournalType::BANK, JournalType::CASH, JournalType::CREDIT_CARD]),
                                )
                                ->default(function () {
                                    return Journal::whereIn('type', [JournalType::BANK, JournalType::CASH, JournalType::CREDIT_CARD])->first()?->id;
                                })
                                ->afterStateUpdated(function (Set $set, Get $get) {
                                    $payment = new Payment;
                                    $payment->payment_type = $get('payment_type') ?? PaymentType::RECEIVE->value;
                                    $payment->journal_id = $get('journal_id');
                                    $payment->journal = Journal::find($get('journal_id'));
                                    $payment->computePaymentMethodLineId();
                                    $set('payment_method_line_id', $payment->payment_method_line_id);
                                })
                                ->required()
                                ->searchable()
                                ->preload()
                                ->live(),

                            Select::make('chart_of_account_id')
                                ->label('Chart of Account')
                                ->relationship('chartOfAccount', 'name')
                                ->searchable()
                                ->preload(),
                        ]),

                        // Row 4: Amount + Project
                        Grid::make(2)->schema([
                            Group::make()->schema([
                                TextInput::make('amount')
                                    ->label('Amount')
                                    ->default(0)
                                    ->numeric()
                                    ->minValue(0)
                                    ->maxValue(99999999999)
                                    ->required()
                                    ->live(onBlur: true)
                                    ->afterStateUpdated(function (Set $set, $state) {
                                        $set('amount_in_word', static::amountToWords((float) ($state ?? 0)));
                                    }),

                                Select::make('currency_id')
                                    ->label('Currency')
                                    ->relationship(
                                        name: 'currency',
                                        titleAttribute: 'name',
                                        modifyQueryUsing: fn (Builder $query) => $query->active(),
                                    )
                                    ->required()
                                    ->searchable()
                                    ->preload()
                                    ->default(fn () => Auth::user()->defaultCompany?->currency_id),
                            ]),

                            Select::make('project_id')
                                ->label('Project')
                                ->options(fn () => DbSchema::hasTable('projects_projects')
                                    ? Project::orderBy('name')->pluck('name', 'id')
                                    : [])
                                ->searchable()
                                ->preload(),
                        ]),

                        // Amount In Word (full width, auto-computed)
                        TextInput::make('amount_in_word')
                            ->label('Amount In Word')
                            ->placeholder('Enter amount to auto-fill')
                            ->disabled()
                            ->dehydrated(false)
                            ->columnSpan('full')
                            ->afterStateHydrated(function (Set $set, Get $get) {
                                $set('amount_in_word', static::amountToWords((float) ($get('amount') ?? 0)));
                            }),

                        // Purposes (full width)
                        Textarea::make('purposes')
                            ->label('Purposes')
                            ->rows(3)
                            ->columnSpan('full'),

                        // Row: Prepared By, Verified By, Approved By
                        Grid::make(3)->schema([
                            Select::make('prepared_by_id')
                                ->label('Prepared By')
                                ->options(fn () => User::orderBy('name')->pluck('name', 'id'))
                                ->searchable()
                                ->preload(),

                            Select::make('verified_by_id')
                                ->label('Verified By')
                                ->options(fn () => User::orderBy('name')->pluck('name', 'id'))
                                ->searchable()
                                ->preload(),

                            Select::make('approved_by_id')
                                ->label('Approved By')
                                ->options(fn () => User::orderBy('name')->pluck('name', 'id'))
                                ->searchable()
                                ->preload(),
                        ]),

                        // Hidden: payment_type always RECEIVE for customers
                        TextInput::make('payment_type')
                            ->hidden()
                            ->default(PaymentType::RECEIVE->value),
                    ])
                    ->columns(1),
            ])
            ->columns(1);
    }

    public static function table(Table $table): Table
    {
        $baseTable = parent::table($table);

        return $baseTable
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
                ExportAction::make('export_voucher')
                    ->label('Download Excel')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->exporter(PaymentVoucherExporter::class),
            ]);
    }

    public static function getRecordSubNavigation(Page $page): array
    {
        return $page->generateNavigationItems([
            ViewPayment::class,
            EditPayment::class,
            ManageInvoices::class,
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index'    => ListPayments::route('/'),
            'create'   => CreatePayment::route('/create'),
            'view'     => ViewPayment::route('/{record}'),
            'edit'     => EditPayment::route('/{record}/edit'),
            'invoices' => ManageInvoices::route('/{record}/invoices'),
        ];
    }

    public static function amountToWords(float $amount): string
    {
        $n = (int) round($amount);
        if ($n <= 0) {
            return '';
        }

        $ones = [
            '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
            'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen',
            'Seventeen', 'Eighteen', 'Nineteen',
        ];
        $tens = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

        $chunk = function (int $n) use ($ones, $tens): string {
            $str = '';
            if ($n >= 100) {
                $str .= $ones[intdiv($n, 100)] . ' Hundred';
                $n %= 100;
                if ($n > 0) {
                    $str .= ' ';
                }
            }
            if ($n >= 20) {
                $str .= $tens[intdiv($n, 10)];
                $n %= 10;
                if ($n > 0) {
                    $str .= '-' . $ones[$n];
                }
            } elseif ($n > 0) {
                $str .= $ones[$n];
            }
            return $str;
        };

        $parts = [];

        if ($n >= 1000000000) {
            $parts[] = $chunk(intdiv($n, 1000000000)) . ' Billion';
            $n %= 1000000000;
        }
        if ($n >= 1000000) {
            $parts[] = $chunk(intdiv($n, 1000000)) . ' Million';
            $n %= 1000000;
        }
        if ($n >= 1000) {
            $parts[] = $chunk(intdiv($n, 1000)) . ' Thousand';
            $n %= 1000;
        }
        if ($n > 0) {
            $parts[] = $chunk($n);
        }

        return implode(' ', $parts) . ' Rwandan Francs Only';
    }
}
