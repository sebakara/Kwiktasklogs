<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationPage>
 */
class DocumentationPageFactory extends Factory
{
    protected $model = DocumentationPage::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = fake()->sentence(4);

        return [
            'title'        => $title,
            'slug'         => Str::slug($title),
            'summary'      => fake()->optional()->sentence(),
            'content'      => fake()->paragraphs(5, true),
            'status'       => DocumentationPageStatus::Draft,
            'audience'     => 'all',
            'is_published' => false,
            'sort_order'   => fake()->numberBetween(0, 100),
            'space_id'     => DocumentationSpace::factory(),
            'creator_id'   => User::query()->value('id') ?? User::factory(),
        ];
    }

    public function published(): static
    {
        return $this->state(fn (array $attributes): array => [
            'status'       => DocumentationPageStatus::Published,
            'is_published' => true,
            'published_at' => now(),
        ]);
    }
}
