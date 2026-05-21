<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_page_versions', function (Blueprint $table): void {
            $table->id();
            $table->unsignedInteger('version_number');
            $table->string('title');
            $table->text('summary')->nullable();
            $table->longText('content')->nullable();
            $table->text('change_note')->nullable();

            $table->foreignId('page_id')
                ->constrained('documentation_pages')
                ->cascadeOnDelete();

            $table->foreignId('creator_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->timestamps();

            $table->unique(['page_id', 'version_number']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_page_versions');
    }
};
