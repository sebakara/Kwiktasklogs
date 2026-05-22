<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Filament\Support\Enums\Width;
use Illuminate\Contracts\Support\Htmlable;

/**
 * Hides Filament's default page header and the hub's duplicate title block.
 * Use on reader-focused pages (version history, version preview) that provide their own chrome.
 */
trait UsesCompactDocumentationHubLayout
{
    public function usesCompactHubLayout(): bool
    {
        return true;
    }

    public function getMaxContentWidth(): Width|string|null
    {
        return Width::Full;
    }

    public function getHeading(): string|Htmlable|null
    {
        return null;
    }

    public function getTitle(): string|Htmlable
    {
        return '';
    }

    /**
     * Do not inject cluster breadcrumbs (Documentation Hub › …).
     *
     * @return array<string, string>
     */
    public function getBreadcrumbs(): array
    {
        return [];
    }

    public function getSubheading(): string|Htmlable|null
    {
        return null;
    }

    public function getSubNavigation(): array
    {
        return [];
    }
}
