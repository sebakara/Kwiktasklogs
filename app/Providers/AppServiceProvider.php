<?php

namespace App\Providers;

use App\Filament\Auth\AdminLoginResponse;
use App\Models\Document;
use App\Policies\DocumentPolicy;
use Filament\Auth\Http\Responses\Contracts\LoginResponse as FilamentLoginResponseContract;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Webkul\Security\Models\User;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(Authenticatable::class, User::class);
        $this->app->singleton(FilamentLoginResponseContract::class, AdminLoginResponse::class);
    }

    public function boot(): void
    {
        Gate::policy(Document::class, DocumentPolicy::class);

        if (app()->environment('production')) {
            URL::forceScheme('https');
        }

        if (! $this->app->runningInConsole() && $this->app->has('request')) {
            $request = $this->app->make('request');

            if ($request->server('HTTP_HOST')) {
                URL::forceRootUrl($request->root());
            }
        }
    }
}
