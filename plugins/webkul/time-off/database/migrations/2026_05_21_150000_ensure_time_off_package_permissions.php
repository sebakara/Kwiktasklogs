<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

return new class extends Migration
{
    /**
     * @var list<string>
     */
    private const PACKAGE_PERMISSIONS = [
        'view_any_time_off_time::off::package',
        'view_time_off_time::off::package',
        'create_time_off_time::off::package',
        'update_time_off_time::off::package',
        'delete_time_off_time::off::package',
        'delete_any_time_off_time::off::package',
    ];

    private const ANCHOR_PERMISSION = 'view_any_time_off_leave::type';

    public function up(): void
    {
        app(PermissionRegistrar::class)->forgetCachedPermissions();

        $permissions = collect(self::PACKAGE_PERMISSIONS)
            ->map(fn (string $name): Permission => Permission::query()->firstOrCreate([
                'name'       => $name,
                'guard_name' => 'web',
            ]));

        Role::query()
            ->whereHas('permissions', fn ($query) => $query->where('name', self::ANCHOR_PERMISSION))
            ->each(fn (Role $role) => $role->givePermissionTo($permissions));
    }

    public function down(): void
    {
        app(PermissionRegistrar::class)->forgetCachedPermissions();

        $permissionIds = Permission::query()
            ->whereIn('name', self::PACKAGE_PERMISSIONS)
            ->pluck('id');

        if ($permissionIds->isEmpty()) {
            return;
        }

        DB::table('role_has_permissions')
            ->whereIn('permission_id', $permissionIds)
            ->delete();

        Permission::query()
            ->whereIn('name', self::PACKAGE_PERMISSIONS)
            ->delete();
    }
};
