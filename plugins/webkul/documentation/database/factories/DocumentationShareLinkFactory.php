<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationShareLink;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationShareLink>
 */
class DocumentationShareLinkFactory extends Factory
{
    protected $model = DocumentationShareLink::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'token'      => Str::random(64),
            'visibility' => DocumentationShareLinkVisibility::Public,
            'is_active'  => true,
            'page_id'    => DocumentationPage::factory(),
            'creator_id' => User::query()->value('id') ?? User::factory(),
        ];
    }

    public function restricted(): static
    {
        return $this->state(fn (): array => [
            'visibility' => DocumentationShareLinkVisibility::Restricted,
            'password'   => bcrypt('secret'),
        ]);
    }
}
