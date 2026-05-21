<?php

namespace Webkul\Documentation\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationAuditLog;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Security\Models\User;

/**
 * @extends Factory<DocumentationAuditLog>
 */
class DocumentationAuditLogFactory extends Factory
{
    protected $model = DocumentationAuditLog::class;

    /**
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'action'     => DocumentationAuditAction::Viewed,
            'ip_address' => fake()->ipv4(),
            'user_agent' => fake()->userAgent(),
            'metadata'   => [],
            'page_id'    => DocumentationPage::factory(),
            'user_id'    => User::query()->value('id') ?? User::factory(),
            'created_at' => now(),
        ];
    }
}
