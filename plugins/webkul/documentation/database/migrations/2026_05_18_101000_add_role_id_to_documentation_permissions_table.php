<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('documentation_permissions', function (Blueprint $table): void {
            $table->dropUnique('doc_permissions_subject_unique');

            $table->foreignId('role_id')
                ->nullable()
                ->after('team_id')
                ->constrained('roles')
                ->cascadeOnDelete();

            $table->unique(
                ['permissionable_type', 'permissionable_id', 'permission', 'user_id', 'team_id', 'role_id'],
                'doc_permissions_subject_unique'
            );
        });
    }

    public function down(): void
    {
        Schema::table('documentation_permissions', function (Blueprint $table): void {
            $table->dropUnique('doc_permissions_subject_unique');
            $table->dropConstrainedForeignId('role_id');

            $table->unique(
                ['permissionable_type', 'permissionable_id', 'permission', 'user_id', 'team_id'],
                'doc_permissions_subject_unique'
            );
        });
    }
};
