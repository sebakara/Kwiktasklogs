<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_pages', function (Blueprint $table): void {
            $table->id();
            $table->string('title');
            $table->string('slug');
            $table->text('summary')->nullable();
            $table->longText('content')->nullable();
            $table->string('status')->default('draft')->index();
            $table->string('module')->nullable()->index();
            $table->string('audience')->default('all');
            $table->boolean('is_published')->default(false)->index();
            $table->timestamp('published_at')->nullable();
            $table->unsignedInteger('sort_order')->default(0);

            $table->foreignId('space_id')
                ->constrained('documentation_spaces')
                ->cascadeOnDelete();

            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('documentation_pages')
                ->nullOnDelete();

            $table->foreignId('template_id')
                ->nullable()
                ->constrained('documentation_templates')
                ->nullOnDelete();

            $table->unsignedBigInteger('project_id')->nullable()->index();

            $table->foreignId('company_id')
                ->nullable()
                ->constrained('companies')
                ->nullOnDelete();

            $table->foreignId('creator_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->foreignId('last_editor_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->softDeletes();
            $table->timestamps();

            $table->unique(['space_id', 'slug']);
            $table->index(['space_id', 'parent_id', 'sort_order']);
            $table->index(['is_published', 'status']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_pages');
    }
};
