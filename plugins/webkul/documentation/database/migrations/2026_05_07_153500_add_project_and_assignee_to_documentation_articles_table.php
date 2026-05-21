<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('documentation_articles')) {
            return;
        }

        Schema::table('documentation_articles', function (Blueprint $table): void {
            if (! Schema::hasColumn('documentation_articles', 'project_id')) {
                if (Schema::hasTable('projects_projects')) {
                    $table->foreignId('project_id')
                        ->nullable()
                        ->after('module')
                        ->constrained('projects_projects')
                        ->nullOnDelete();
                } else {
                    $table->unsignedBigInteger('project_id')->nullable()->after('module');
                }
            }

            if (! Schema::hasColumn('documentation_articles', 'assignee_id')) {
                $table->foreignId('assignee_id')
                    ->nullable()
                    ->after('creator_id')
                    ->constrained('users')
                    ->nullOnDelete();
            }
        });

        if (
            Schema::hasColumn('documentation_articles', 'project_id')
            && Schema::hasColumn('documentation_articles', 'assignee_id')
        ) {
            Schema::table('documentation_articles', function (Blueprint $table): void {
                $table->index(['project_id', 'assignee_id'], 'documentation_articles_project_assignee_index');
            });
        }
    }

    public function down(): void
    {
        if (! Schema::hasTable('documentation_articles')) {
            return;
        }

        Schema::table('documentation_articles', function (Blueprint $table): void {
            if (
                Schema::hasColumn('documentation_articles', 'project_id')
                && Schema::hasColumn('documentation_articles', 'assignee_id')
            ) {
                $table->dropIndex('documentation_articles_project_assignee_index');
            }

            if (Schema::hasColumn('documentation_articles', 'project_id')) {
                $table->dropForeign(['project_id']);
                $table->dropColumn('project_id');
            }

            if (Schema::hasColumn('documentation_articles', 'assignee_id')) {
                $table->dropConstrainedForeignId('assignee_id');
            }
        });
    }
};
