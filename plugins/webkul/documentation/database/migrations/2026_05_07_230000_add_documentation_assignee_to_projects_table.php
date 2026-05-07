<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('projects_projects', function (Blueprint $table): void {
            $table->foreignId('documentation_assignee_id')
                ->nullable()
                ->after('user_id')
                ->constrained('users')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('projects_projects', function (Blueprint $table): void {
            $table->dropConstrainedForeignId('documentation_assignee_id');
        });
    }
};
