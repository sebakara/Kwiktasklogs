<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_share_links', function (Blueprint $table): void {
            $table->id();
            $table->string('token')->unique();
            $table->string('password')->nullable();
            $table->timestamp('expires_at')->nullable()->index();
            $table->unsignedInteger('max_views')->nullable();
            $table->unsignedInteger('view_count')->default(0);
            $table->boolean('is_active')->default(true)->index();

            $table->foreignId('page_id')
                ->constrained('documentation_pages')
                ->cascadeOnDelete();

            $table->foreignId('company_id')
                ->nullable()
                ->constrained('companies')
                ->nullOnDelete();

            $table->foreignId('creator_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_share_links');
    }
};
