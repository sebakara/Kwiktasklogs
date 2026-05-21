<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasTable('projects_projects')) {
            return;
        }

        if (Schema::hasColumn('projects_projects', 'documentation_assignee_id')) {
            return;
        }

        Schema::table('projects_projects', function (Blueprint $table): void {
            $after = Schema::hasColumn('projects_projects', 'user_id') ? 'user_id' : null;

            $column = $table->foreignId('documentation_assignee_id')
                ->nullable()
                ->constrained('users')
                ->nullOnDelete();

            if ($after !== null) {
                $column->after($after);
            }
        });
    }

    public function down(): void
    {
        if (! Schema::hasTable('projects_projects')) {
            return;
        }

        if (! Schema::hasColumn('projects_projects', 'documentation_assignee_id')) {
            return;
        }

        Schema::table('projects_projects', function (Blueprint $table): void {
            $table->dropConstrainedForeignId('documentation_assignee_id');
        });
    }
};
