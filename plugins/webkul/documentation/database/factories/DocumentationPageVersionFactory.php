<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationPageVersion>
 */
class DocumentationPageVersionFactory extends Factory
{
    protected $model = DocumentationPageVersion::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'version_number' => 1,
            'title'          => fake()->sentence(4),
            'summary'        => fake()->optional()->sentence(),
            'content'        => fake()->paragraphs(5, true),
            'change_note'    => fake()->optional()->sentence(),
            'page_id'        => DocumentationPage::factory(),
            'creator_id'     => User::query()->value('id') ?? User::factory(),
        ];
    }
}
