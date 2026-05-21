<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Documentation\Models\DocumentationAttachment;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationAttachment>
 */
class DocumentationAttachmentFactory extends Factory
{
    protected $model = DocumentationAttachment::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $fileName = fake()->word().'.pdf';

        return [
            'name'               => $fileName,
            'file_path'          => 'documentation/'.fake()->uuid().'.pdf',
            'original_file_name' => $fileName,
            'mime_type'          => 'application/pdf',
            'file_size'          => fake()->numberBetween(1024, 5_000_000),
            'page_id'            => DocumentationPage::factory(),
            'creator_id'         => User::query()->value('id') ?? User::factory(),
        ];
    }
}
