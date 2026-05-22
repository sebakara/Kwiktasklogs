<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (
            Schema::hasTable('employees_calendar_attendances')
            && ! Schema::hasTable('calendar_attendances')
        ) {
            Schema::rename('employees_calendar_attendances', 'calendar_attendances');
        } elseif (! Schema::hasTable('calendar_attendances') && Schema::hasTable('calendars')) {
            Schema::create('calendar_attendances', function (Blueprint $table) {
                $table->id();
                $table->integer('sort')->nullable();
                $table->string('name');
                $table->string('day_of_week');
                $table->string('day_period');
                $table->string('week_type')->nullable();
                $table->string('display_type')->nullable();
                $table->string('date_from')->nullable();
                $table->string('date_to')->nullable();
                $table->string('duration_days')->nullable();
                $table->string('hour_from');
                $table->string('hour_to');
                $table->unsignedBigInteger('calendar_id');
                $table->unsignedBigInteger('creator_id')->nullable();
                $table->foreign('calendar_id')->references('id')->on('calendars')->cascadeOnDelete();
                $table->foreign('creator_id')->references('id')->on('users')->nullOnDelete();
                $table->timestamps();
            });
        }

        if (
            Schema::hasTable('employees_calendar_leaves')
            && ! Schema::hasTable('calendar_leaves')
        ) {
            Schema::rename('employees_calendar_leaves', 'calendar_leaves');
        } elseif (! Schema::hasTable('calendar_leaves')) {
            Schema::create('calendar_leaves', function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->string('time_type');
                $table->string('date_from');
                $table->string('date_to');
                $table->unsignedBigInteger('company_id')->nullable();
                $table->unsignedBigInteger('calendar_id')->nullable();
                $table->unsignedBigInteger('creator_id')->nullable();
                $table->foreign('company_id')->references('id')->on('companies')->nullOnDelete();
                $table->foreign('calendar_id')->references('id')->on('calendars')->nullOnDelete();
                $table->foreign('creator_id')->references('id')->on('users')->nullOnDelete();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        // Intentionally empty — do not drop tables that may have been created by the original migration.
    }
};
