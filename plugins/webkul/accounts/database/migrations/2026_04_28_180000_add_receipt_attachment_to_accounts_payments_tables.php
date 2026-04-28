<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('accounts_account_payments', function (Blueprint $table) {
            if (! Schema::hasColumn('accounts_account_payments', 'receipt_attachment')) {
                $table->string('receipt_attachment')->nullable();
            }
        });

        Schema::table('accounts_payment_registers', function (Blueprint $table) {
            if (! Schema::hasColumn('accounts_payment_registers', 'receipt_attachment')) {
                $table->string('receipt_attachment')->nullable();
            }
        });
    }

    public function down(): void
    {
        Schema::table('accounts_account_payments', function (Blueprint $table) {
            if (Schema::hasColumn('accounts_account_payments', 'receipt_attachment')) {
                $table->dropColumn('receipt_attachment');
            }
        });

        Schema::table('accounts_payment_registers', function (Blueprint $table) {
            if (Schema::hasColumn('accounts_payment_registers', 'receipt_attachment')) {
                $table->dropColumn('receipt_attachment');
            }
        });
    }
};
