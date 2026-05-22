<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('time_off_leave_allocations', function (Blueprint $table) {
            $table->foreignId('package_id')
                ->nullable()
                ->after('accrual_plan_id')
                ->constrained('time_off_packages')
                ->nullOnDelete();
            $table->foreignId('package_assignment_id')
                ->nullable()
                ->after('package_id')
                ->constrained('time_off_package_assignments')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('time_off_leave_allocations', function (Blueprint $table) {
            $table->dropConstrainedForeignId('package_assignment_id');
            $table->dropConstrainedForeignId('package_id');
        });
    }
};
