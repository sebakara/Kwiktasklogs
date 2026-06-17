<?php

namespace Webkul\Invoice\Filament\Exports;

use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;
use Illuminate\Support\Facades\Schema;
use Webkul\Account\Models\Payment;

class PaymentVoucherExporter extends Exporter
{
    protected static ?string $model = Payment::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('name')
                ->label('Voucher No.'),
            ExportColumn::make('date')
                ->label('Date'),
            ExportColumn::make('paymentMethodLine.name')
                ->label('Method of Payment'),
            ExportColumn::make('journal.name')
                ->label('Bank Payment'),
            ExportColumn::make('amount')
                ->label('Amount'),
            ExportColumn::make('purposes')
                ->label('Purposes'),
            ExportColumn::make('chartOfAccount.name')
                ->label('Chart of Account'),
            ExportColumn::make('project_id')
                ->label('Project')
                ->formatStateUsing(fn ($state) => $state ? (Schema::hasTable('projects_projects') ? optional(\Webkul\Project\Models\Project::find($state))->name : $state) : ''),
            ExportColumn::make('partner.name')
                ->label('Vendor'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        return 'Payment voucher export completed: ' . number_format($export->successful_rows) . ' records exported.';
    }
}
