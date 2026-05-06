<?php

namespace App\Filament\Auth;

use Filament\Auth\Http\Responses\Contracts\LoginResponse as LoginResponseContract;
use Filament\Facades\Filament;
use Illuminate\Http\RedirectResponse;
use Livewire\Features\SupportRedirects\Redirector;
use Webkul\Security\Models\User;

class AdminLoginResponse implements LoginResponseContract
{
    public function toResponse($request): RedirectResponse|Redirector
    {
        $panel = Filament::getCurrentPanel();

        if ($panel?->getId() !== 'admin') {
            return redirect()->intended(Filament::getUrl());
        }

        $user = Filament::auth()->user();

        if (! $user instanceof User) {
            return redirect()->intended(Filament::getUrl());
        }

        return redirect()->to(AdminLandingUrl::forAuthenticatedUser($user));
    }
}
