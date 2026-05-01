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
        Schema::create('employees_reviews', function (Blueprint $table) {
            $table->id();

            $table->foreignId('employee_id')
                ->constrained('employees_employees')
                ->cascadeOnDelete();

            $table->foreignId('reviewer_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->string('period_type');

            $table->date('period_start');
            $table->date('period_end');

            $table->string('period_label');

            $table->json('metrics_snapshot')->nullable();

            $table->decimal('manager_rating', 5, 2)->nullable();

            $table->text('manager_comments')->nullable();

            $table->string('status');

            $table->foreignId('company_id')
                ->nullable()
                ->constrained('companies')
                ->nullOnDelete();

            $table->timestamps();

            $table->unique(
                ['employee_id', 'period_type', 'period_start', 'period_end'],
                'employees_reviews_period_unique'
            );
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees_reviews');
    }
};
