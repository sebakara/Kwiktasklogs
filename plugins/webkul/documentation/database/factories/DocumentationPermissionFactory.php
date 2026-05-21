<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationPermission>
 */
class DocumentationPermissionFactory extends Factory
{
    protected $model = DocumentationPermission::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'permission'          => DocumentationPermissionLevel::View,
            'permissionable_type' => DocumentationSpace::class,
            'permissionable_id'   => DocumentationSpace::factory(),
            'user_id'             => User::query()->value('id') ?? User::factory(),
            'creator_id'          => User::query()->value('id') ?? User::factory(),
        ];
    }
}
