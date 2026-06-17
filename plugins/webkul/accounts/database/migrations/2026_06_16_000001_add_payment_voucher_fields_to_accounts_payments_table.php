<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('accounts_account_payments', function (Blueprint $table) {
            if (! Schema::hasColumn('accounts_account_payments', 'chart_of_account_id')) {
                $table->foreignId('chart_of_account_id')->nullable()->constrained('accounts_accounts')->nullOnDelete();
            }
            if (! Schema::hasColumn('accounts_account_payments', 'project_id')) {
                $table->unsignedBigInteger('project_id')->nullable();
            }
            if (! Schema::hasColumn('accounts_account_payments', 'purposes')) {
                $table->text('purposes')->nullable();
            }
            if (! Schema::hasColumn('accounts_account_payments', 'prepared_by_id')) {
                $table->foreignId('prepared_by_id')->nullable()->constrained('users')->nullOnDelete();
            }
            if (! Schema::hasColumn('accounts_account_payments', 'verified_by_id')) {
                $table->foreignId('verified_by_id')->nullable()->constrained('users')->nullOnDelete();
            }
            if (! Schema::hasColumn('accounts_account_payments', 'approved_by_id')) {
                $table->foreignId('approved_by_id')->nullable()->constrained('users')->nullOnDelete();
            }
        });
    }

    public function down(): void
    {
        Schema::table('accounts_account_payments', function (Blueprint $table) {
            if (Schema::hasColumn('accounts_account_payments', 'chart_of_account_id')) {
                $table->dropForeign(['chart_of_account_id']);
                $table->dropColumn('chart_of_account_id');
            }
            if (Schema::hasColumn('accounts_account_payments', 'project_id')) {
                $table->dropColumn('project_id');
            }
            if (Schema::hasColumn('accounts_account_payments', 'purposes')) {
                $table->dropColumn('purposes');
            }
            if (Schema::hasColumn('accounts_account_payments', 'prepared_by_id')) {
                $table->dropForeign(['prepared_by_id']);
                $table->dropColumn('prepared_by_id');
            }
            if (Schema::hasColumn('accounts_account_payments', 'verified_by_id')) {
                $table->dropForeign(['verified_by_id']);
                $table->dropColumn('verified_by_id');
            }
            if (Schema::hasColumn('accounts_account_payments', 'approved_by_id')) {
                $table->dropForeign(['approved_by_id']);
                $table->dropColumn('approved_by_id');
            }
        });
    }
};
