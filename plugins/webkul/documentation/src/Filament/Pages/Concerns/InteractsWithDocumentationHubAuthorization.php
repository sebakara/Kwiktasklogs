<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Security\Models\User;

trait InteractsWithDocumentationHubAuthorization
{
    public static function canAccess(): bool
    {
        $user = auth()->user();

        return $user instanceof User
            && app(DocumentationAccessService::class)->canAccessHub($user);
    }

    /**
     * @return array<string, bool|string|null>
     */
    protected function hubAccessFlags(): array
    {
        $user = auth()->user();
        $access = app(DocumentationAccessService::class);

        if (! $user instanceof User) {
            return [
                'role'                 => null,
                'canManageHub'         => false,
                'canManageSpaces'      => false,
                'canManageTemplates'   => false,
                'canManagePermissions' => false,
                'isEditor'             => false,
                'isViewer'             => false,
            ];
        }

        return [
            'role'                 => $access->resolveHubRole($user)->value,
            'canManageHub'         => $access->canManageHub($user),
            'canManageSpaces'      => $access->canManageSpaces($user),
            'canManageTemplates'   => $access->canManageTemplates($user),
            'canManagePermissions' => $access->canManagePermissions($user),
            'isEditor'             => $access->isEditor($user),
            'isViewer'             => $access->isViewer($user),
        ];
    }
}
