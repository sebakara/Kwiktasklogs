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
        Schema::create('employees_employee_documents', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('employee_id');
            $table->unsignedBigInteger('creator_id')->nullable()->comment('Created By');
            $table->unsignedBigInteger('requested_by_user_id')->nullable()->comment('Requested By');
            $table->unsignedBigInteger('signed_by_user_id')->nullable()->comment('Signed By');
            $table->string('title');
            $table->string('document_type')->nullable();
            $table->string('status')->default('draft');
            $table->string('original_file_path');
            $table->string('signed_file_path')->nullable();
            $table->text('notes')->nullable();
            $table->timestamp('sent_at')->nullable();
            $table->timestamp('signed_at')->nullable();
            $table->timestamps();

            $table->foreign('employee_id')->references('id')->on('employees_employees')->cascadeOnDelete();
            $table->foreign('creator_id')->references('id')->on('users')->nullOnDelete();
            $table->foreign('requested_by_user_id')->references('id')->on('users')->nullOnDelete();
            $table->foreign('signed_by_user_id')->references('id')->on('users')->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees_employee_documents');
    }
};
