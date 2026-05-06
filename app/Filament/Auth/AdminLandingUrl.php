<?php

namespace App\Filament\Auth;

use Filament\Facades\Filament;
use Webkul\Employee\Filament\Pages\InternalChat;
use Webkul\Project\Filament\Pages\Dashboard as ProjectDashboard;
use Webkul\Security\Models\User;
use Webkul\Support\Filament\Pages\Profile;

/**
 * Resolves the first Filament admin URL the user may open without a 403 from page permissions.
 *
 * Uses the given {@see User} when provided so invitation completion works before the session is authenticated.
 */
final class AdminLandingUrl
{
    private const string PROJECT_DASHBOARD_PERMISSION = 'page_project_dashboard';

    public static function forAuthenticatedUser(?User $user = null): string
    {
        $user ??= Filament::auth()->user();

        if (! $user instanceof User) {
            return Filament::getUrl();
        }

        if ($user->can(self::PROJECT_DASHBOARD_PERMISSION)) {
            return ProjectDashboard::getUrl();
        }

        if ($user->is_active) {
            return InternalChat::getUrl();
        }

        return Profile::getUrl();
    }
}
