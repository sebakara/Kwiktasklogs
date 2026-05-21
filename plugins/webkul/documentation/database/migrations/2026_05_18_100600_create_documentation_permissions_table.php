<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documentation_permissions', function (Blueprint $table): void {
            $table->id();
            $table->string('permissionable_type');
            $table->unsignedBigInteger('permissionable_id');
            $table->string('permission')->index();

            $table->foreignId('user_id')
                ->nullable()
                ->constrained('users')
                ->cascadeOnDelete();

            $table->foreignId('team_id')
                ->nullable()
                ->constrained('teams')
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

            $table->index(
                ['permissionable_type', 'permissionable_id'],
                'doc_permissions_permissionable_idx'
            );

            $table->index(
                ['permissionable_type', 'permissionable_id', 'permission'],
                'doc_permissions_permissionable_perm_idx'
            );

            $table->unique(
                ['permissionable_type', 'permissionable_id', 'permission', 'user_id', 'team_id'],
                'doc_permissions_subject_unique'
            );
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documentation_permissions');
    }
};
