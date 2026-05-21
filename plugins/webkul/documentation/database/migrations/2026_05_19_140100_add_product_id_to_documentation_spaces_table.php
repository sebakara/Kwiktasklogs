<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('documentation_spaces')) {
            return;
        }

        if (Schema::hasColumn('documentation_spaces', 'product_id')) {
            return;
        }

        Schema::table('documentation_spaces', function (Blueprint $table): void {
            $table->foreignId('product_id')
                ->nullable()
                ->after('project_id')
                ->constrained('documentation_products')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        if (! Schema::hasTable('documentation_spaces') || ! Schema::hasColumn('documentation_spaces', 'product_id')) {
            return;
        }

        Schema::table('documentation_spaces', function (Blueprint $table): void {
            $table->dropConstrainedForeignId('product_id');
        });
    }
};
