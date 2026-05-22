<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Webkul\Documentation\Filament\Pages\HubDashboard;
use Webkul\Documentation\Filament\Pages\ListSpaces;
use Webkul\Documentation\Filament\Pages\ManageAuditLogs;
use Webkul\Documentation\Filament\Pages\ManageDocumentation;
use Webkul\Documentation\Filament\Pages\ManagePermissions;
use Webkul\Documentation\Filament\Pages\ManageTemplates;
use Webkul\Documentation\Services\DocumentationAccessService;

trait InteractsWithDocumentationHubLayout
{
    /**
     * @return array<string>
     */
    public function getPageClasses(): array
    {
        $classes = ['doc-hub-page'];

        if (method_exists($this, 'usesCompactHubLayout') && $this->usesCompactHubLayout()) {
            $classes[] = 'doc-hub-page--compact';
        }

        return $classes;
    }

    /**
     * @return array<int, array{label: string, url: string, active: bool}>
     */
    protected function getHubNavigationItems(): array
    {
        $access = app(DocumentationAccessService::class);
        $user = auth()->user();

        $items = [
            [
                'label'  => __('documentation::filament/hub.nav.home'),
                'url'    => HubDashboard::getUrl(),
                'active' => $this instanceof HubDashboard,
            ],
        ];

        if ($user && ManageDocumentation::shouldRegisterNavigation()) {
            $items[] = [
                'label'  => __('documentation::filament/hub.nav.manage'),
                'url'    => ManageDocumentation::getUrl(),
                'active' => $this instanceof ManageDocumentation
                    || $this instanceof ManageTemplates
                    || $this instanceof ManagePermissions
                    || $this instanceof ManageAuditLogs
                    || $this instanceof ListSpaces,
            ];
        }

        return $items;
    }
}
