<?php

namespace Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource\Pages;

use Filament\Actions\Action;
use Webkul\Account\Enums\PaymentType;
use Webkul\Account\Filament\Resources\PaymentResource\Pages\CreatePayment as BaseCreatePayment;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource;

class CreatePayment extends BaseCreatePayment
{
    protected static string $resource = PaymentResource::class;

    public bool $printAfterSave = false;

    public function getSubNavigation(): array
    {
        if (filled($cluster = static::getCluster())) {
            return $this->generateNavigationItems($cluster::getClusteredComponents());
        }

        return [];
    }

    public function mount(): void
    {
        parent::mount();

        $this->data['payment_type'] ??= PaymentType::RECEIVE;

        $this->form->fill($this->data);
    }

    protected function getFormActions(): array
    {
        return [
            ...parent::getFormActions(),
            Action::make('save_and_print')
                ->label('Save & Print')
                ->icon('heroicon-o-printer')
                ->color('gray')
                ->action(function () {
                    $this->printAfterSave = true;
                    $this->create();
                }),
        ];
    }

    protected function getRedirectUrl(): string
    {
        $record = $this->getRecord();

        if ($this->printAfterSave && $record) {
            return route('payment-voucher.print', $record->id) . '?autoprint=1';
        }

        return $this->getResource()::getUrl('view', ['record' => $record]);
    }
}
