<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="noindex, nofollow">
        <title>{{ $title ?? __('documentation::filament/hub.public.title') }}</title>
        <style>{!! file_get_contents(base_path('plugins/webkul/documentation/resources/css/public-share.css')) !!}</style>
        @livewireStyles
    </head>
    <body>
        <header class="doc-share-header">
            <div class="doc-share-header__inner">
                <p class="doc-share-header__brand">{{ __('documentation::filament/hub.public.brand') }}</p>
            </div>
        </header>

        <main class="doc-share-main">
            {{ $slot }}
        </main>

        @livewireScripts
    </body>
</html>
