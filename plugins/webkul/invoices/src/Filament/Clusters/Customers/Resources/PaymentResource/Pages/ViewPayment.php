<?php

namespace Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages;

use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Notifications\Notification;
use Webkul\Account\Filament\Resources\PaymentResource\Actions as BaseActions;
use Webkul\Account\Filament\Resources\PaymentResource\Pages\ViewPayment as BaseViewPayment;
use Webkul\Chatter\Filament\Actions\ChatterAction;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource;

class ViewPayment extends BaseViewPayment
{
    protected static string $resource = PaymentResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('print_voucher')
                ->label('Print Voucher')
                ->icon('heroicon-o-printer')
                ->color('gray')
                ->url(fn () => route('payment-voucher.print', $this->record->id) . '?autoprint=0')
                ->openUrlInNewTab(),

            ChatterAction::make()
                ->resource(static::$resource),
            BaseActions\ConfirmAction::make(),
            BaseActions\ResetToDraftAction::make(),
            BaseActions\MarkAsSendAdnUnsentAction::make(),
            BaseActions\CancelAction::make(),
            BaseActions\RejectAction::make(),
            DeleteAction::make()
                ->successNotification(
                    Notification::make()
                        ->success()
                        ->title(__('accounts::filament/resources/payment/pages/view-payment.header-actions.delete.notification.title'))
                        ->body(__('accounts::filament/resources/payment/pages/view-payment.header-actions.delete.notification.body'))
                ),
        ];
    }
}
