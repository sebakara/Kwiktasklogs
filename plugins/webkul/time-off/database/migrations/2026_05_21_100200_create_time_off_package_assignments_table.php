<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('time_off_package_assignments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('package_id')->constrained('time_off_packages')->cascadeOnDelete();
            $table->foreignId('employee_id')->constrained('employees_employees')->restrictOnDelete();
            $table->foreignId('assigned_by')->nullable()->constrained('users')->nullOnDelete();
            $table->boolean('auto_approved')->default(true);
            $table->unsignedInteger('allocations_created')->default(0);
            $table->unsignedInteger('allocations_skipped')->default(0);
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['package_id', 'employee_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('time_off_package_assignments');
    }
};
