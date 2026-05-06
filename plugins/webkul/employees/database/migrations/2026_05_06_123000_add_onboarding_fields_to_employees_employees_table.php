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
        Schema::table('employees_employees', function (Blueprint $table): void {
            $table->string('bank_name')->nullable()->after('bank_account_id');
            $table->string('bank_account_number')->nullable()->after('bank_name');
            $table->string('passport_image_path')->nullable()->after('passport_id');
            $table->string('national_id_file_path')->nullable()->after('identification_id');
            $table->string('emergency_contact_relation')->nullable()->after('emergency_phone');
            $table->boolean('agreed_to_terms')->default(false)->after('emergency_contact_relation');
            $table->timestamp('agreed_to_terms_at')->nullable()->after('agreed_to_terms');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employees_employees', function (Blueprint $table): void {
            $table->dropColumn([
                'bank_name',
                'bank_account_number',
                'passport_image_path',
                'national_id_file_path',
                'emergency_contact_relation',
                'agreed_to_terms',
                'agreed_to_terms_at',
            ]);
        });
    }
};
