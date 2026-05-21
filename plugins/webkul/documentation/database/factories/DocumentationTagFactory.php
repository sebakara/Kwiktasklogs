<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Webkul\Documentation\Models\DocumentationTag;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationTag>
 */
class DocumentationTagFactory extends Factory
{
    protected $model = DocumentationTag::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->unique()->word();

        return [
            'name'       => $name,
            'slug'       => Str::slug($name),
            'color'      => fake()->hexColor(),
            'sort_order' => fake()->numberBetween(0, 100),
            'creator_id' => User::query()->value('id') ?? User::factory(),
        ];
    }
}
