<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Models\DocumentationProduct;
use Webkul\Documentation\Services\DocumentationSpaceProvisioningService;

class OpenProductDocumentation extends Page
{
    use InteractsWithDocumentationHubAuthorization;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'portal/products/{product}';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.portal.redirect';

    public function mount(int|string $product): void
    {
        $record = DocumentationProduct::query()->findOrFail($product);

        $space = app(DocumentationSpaceProvisioningService::class)->forProduct($record);

        Gate::authorize('view', $space);

        $this->redirect(
            app(DocumentationSpaceProvisioningService::class)->defaultPageUrl($space),
            navigate: true,
        );
    }

    public static function portalUrl(int $productId): string
    {
        return static::getUrl(['product' => $productId]);
    }
}
