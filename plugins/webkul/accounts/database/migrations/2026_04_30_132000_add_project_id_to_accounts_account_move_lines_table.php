<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('accounts_account_move_lines', function (Blueprint $table) {
            $table->unsignedBigInteger('project_id')->nullable()->after('product_id');
        });
    }

    public function down(): void
    {
        Schema::table('accounts_account_move_lines', function (Blueprint $table) {
            $table->dropColumn('project_id');
        });
    }
};
