<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Webkul\Documentation\Models\DocumentationTemplate;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationTemplate>
 */
class DocumentationTemplateFactory extends Factory
{
    protected $model = DocumentationTemplate::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->words(2, true);

        return [
            'name'        => $name,
            'slug'        => Str::slug($name),
            'description' => fake()->optional()->sentence(),
            'content'     => fake()->paragraphs(3, true),
            'module'      => fake()->optional()->randomElement(['projects', 'sales', 'inventory']),
            'is_active'   => true,
            'creator_id'  => User::query()->value('id') ?? User::factory(),
        ];
    }
}
