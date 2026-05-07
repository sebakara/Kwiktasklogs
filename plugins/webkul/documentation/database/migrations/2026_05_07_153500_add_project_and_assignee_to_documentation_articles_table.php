<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('documentation_articles', function (Blueprint $table): void {
            $table->foreignId('project_id')
                ->nullable()
                ->after('module')
                ->constrained('projects_projects')
                ->nullOnDelete();

            $table->foreignId('assignee_id')
                ->nullable()
                ->after('creator_id')
                ->constrained('users')
                ->nullOnDelete();

            $table->index(['project_id', 'assignee_id']);
        });
    }

    public function down(): void
    {
        Schema::table('documentation_articles', function (Blueprint $table): void {
            $table->dropIndex(['project_id', 'assignee_id']);
            $table->dropConstrainedForeignId('project_id');
            $table->dropConstrainedForeignId('assignee_id');
        });
    }
};
