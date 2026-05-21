<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\PermissionRegistrar;
use Webkul\Security\Models\Permission;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;

class DocumentationHubRoleSeeder extends Seeder
{
    public function run(): void
    {
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        $permissions = [
            config('documentation.permissions.super_admin'),
            config('documentation.permissions.manage'),
            config('documentation.permissions.editor'),
            config('documentation.permissions.viewer'),
        ];

        foreach ($permissions as $permission) {
            Permission::findOrCreate($permission, 'web');
        }

        $roles = [
            config('documentation.roles.super_admin') => [
                config('documentation.permissions.super_admin'),
                config('documentation.permissions.manage'),
                config('documentation.permissions.editor'),
                config('documentation.permissions.viewer'),
            ],
            config('documentation.roles.admin') => [
                config('documentation.permissions.manage'),
                config('documentation.permissions.editor'),
                config('documentation.permissions.viewer'),
            ],
            config('documentation.roles.editor') => [
                config('documentation.permissions.editor'),
                config('documentation.permissions.viewer'),
            ],
            config('documentation.roles.viewer') => [
                config('documentation.permissions.viewer'),
            ],
        ];

        foreach ($roles as $roleName => $rolePermissions) {
            $role = Role::query()->firstOrCreate([
                'name'       => $roleName,
                'guard_name' => 'web',
            ]);

            $role->syncPermissions($rolePermissions);
        }

        $panelAdminRole = Role::query()
            ->where('guard_name', 'web')
            ->whereIn('name', ['Admin', 'admin'])
            ->first();

        $panelAdminRole?->givePermissionTo($permissions);

        User::query()
            ->where('email', 'admin@example.com')
            ->each(function ($user) use ($panelAdminRole): void {
                if ($panelAdminRole !== null && ! $user->hasRole($panelAdminRole)) {
                    $user->assignRole($panelAdminRole);
                }

                $user->givePermissionTo(config('documentation.permissions.manage'));
            });
    }
}
