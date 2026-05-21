<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_page_tags', function (Blueprint $table): void {
            $table->foreignId('page_id')
                ->constrained('documentation_pages')
                ->cascadeOnDelete();

            $table->foreignId('tag_id')
                ->constrained('documentation_tags')
                ->cascadeOnDelete();

            $table->primary(['page_id', 'tag_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_page_tags');
    }
};
