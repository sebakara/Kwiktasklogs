<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_audit_logs', function (Blueprint $table): void {
            $table->id();
            $table->string('action')->index();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->json('metadata')->nullable();

            $table->foreignId('space_id')
                ->nullable()
                ->constrained('documentation_spaces')
                ->nullOnDelete();

            $table->foreignId('page_id')
                ->nullable()
                ->constrained('documentation_pages')
                ->nullOnDelete();

            $table->foreignId('user_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->foreignId('company_id')
                ->nullable()
                ->constrained('companies')
                ->nullOnDelete();

            $table->timestamp('created_at')->useCurrent();

            $table->index(['page_id', 'created_at']);
            $table->index(['space_id', 'created_at']);
            $table->index(['user_id', 'action']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_audit_logs');
    }
};
