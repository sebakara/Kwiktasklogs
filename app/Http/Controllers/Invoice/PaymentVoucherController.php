<?php

namespace App\Http\Controllers\Invoice;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Webkul\Account\Models\Payment;
use Webkul\Invoice\Filament\Clusters\Customers\Resources\PaymentResource;

class PaymentVoucherController extends Controller
{
    public function print(int $payment)
    {
        $record = Payment::with([
            'journal',
            'paymentMethodLine',
            'partner',
            'chartOfAccount',
            'preparedBy',
            'verifiedBy',
            'approvedBy',
        ])->findOrFail($payment);

        $company = Auth::user()->defaultCompany;

        $amountInWord = $record->amount
            ? PaymentResource::amountToWords((float) $record->amount)
            : '';

        return view('payment-voucher', [
            'payment'      => $record,
            'company'      => $company,
            'amountInWord' => $amountInWord,
        ]);
    }
}
