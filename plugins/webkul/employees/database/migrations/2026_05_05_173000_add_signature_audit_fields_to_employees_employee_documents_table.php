<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('employees_employee_documents', function (Blueprint $table): void {
            $table->string('signed_name')->nullable()->after('signed_by_user_id');
            $table->string('signed_ip_address', 45)->nullable()->after('signed_name');
            $table->text('signed_user_agent')->nullable()->after('signed_ip_address');
            $table->string('signature_hash')->nullable()->after('signed_user_agent');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employees_employee_documents', function (Blueprint $table): void {
            $table->dropColumn([
                'signed_name',
                'signed_ip_address',
                'signed_user_agent',
                'signature_hash',
            ]);
        });
    }
};
