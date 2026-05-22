<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('time_off_package_lines', function (Blueprint $table) {
            $table->id();
            $table->foreignId('package_id')->constrained('time_off_packages')->cascadeOnDelete();
            $table->foreignId('leave_type_id')->constrained('time_off_leave_types')->restrictOnDelete();
            $table->decimal('number_of_days', 15, 4)->default(0);
            $table->unsignedInteger('sort')->default(0);
            $table->timestamps();

            $table->unique(['package_id', 'leave_type_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('time_off_package_lines');
    }
};
