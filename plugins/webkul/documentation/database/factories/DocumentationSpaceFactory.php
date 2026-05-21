<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationSpace>
 */
class DocumentationSpaceFactory extends Factory
{
    protected $model = DocumentationSpace::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->words(3, true);

        return [
            'name'        => $name,
            'slug'        => Str::slug($name),
            'description' => fake()->optional()->sentence(),
            'visibility'  => DocumentationSpaceVisibility::Internal,
            'sort_order'  => fake()->numberBetween(0, 100),
            'is_active'   => true,
            'creator_id'  => User::query()->value('id') ?? User::factory(),
        ];
    }
}
