@php
    use Webkul\Documentation\Filament\Pages\HubDashboard;

    $navItems = $this->getHubNavigationItems();
    $hubAccess = method_exists($this, 'hubAccessFlags') ? $this->hubAccessFlags() : [];
    $isCatalogHome = $this instanceof HubDashboard;
    $homeLabel = __('documentation::filament/hub.nav.home');
    $manageLabel = __('documentation::filament/hub.nav.manage');
@endphp

@push('styles')
    <link rel="stylesheet" href="{{ \Filament\Support\Facades\FilamentAsset::getStyleHref('documentation-portal', 'documentation') }}" />
@endpush

<div>
<x-filament-panels::page @class(['doc-hub-page', 'doc-hub-page--catalog' => $isCatalogHome])>
    <div
        wire:loading.flex
        class="pointer-events-none fixed inset-x-0 top-0 z-50 hidden h-0.5 bg-primary-500 motion-safe:animate-pulse"
        aria-hidden="true"
    ></div>

    <header class="doc-hub-header">
        <div class="doc-hub-header-main">
            @if ($isCatalogHome)
                <p class="doc-hub-eyebrow">{{ __('documentation::filament/hub.layout.eyebrow') }}</p>
                <h1 class="doc-hub-title">{{ __('documentation::filament/hub.portal.catalog_headline') }}</h1>
                <p class="doc-hub-subtitle">{{ __('documentation::filament/hub.portal.catalog_subtitle') }}</p>
            @else
                <p class="doc-hub-eyebrow">{{ __('documentation::filament/hub.layout.eyebrow') }}</p>
                <h1 class="doc-hub-title">{{ $this->getTitle() }}</h1>
                @if (method_exists($this, 'getSubheading') && filled($this->getSubheading()))
                    <p class="doc-hub-subtitle">{{ $this->getSubheading() }}</p>
                @endif
            @endif

            @if (! empty($hubAccess['role']))
                <span class="doc-hub-role-badge">
                    {{ __('documentation::filament/hub.access.role', ['role' => str_replace('_', ' ', $hubAccess['role'])]) }}
                </span>
            @endif
        </div>

        @if (count($navItems) > 0)
            <nav class="doc-hub-nav" aria-label="{{ __('documentation::filament/hub.layout.eyebrow') }}">
                @foreach ($navItems as $item)
                    <a
                        href="{{ $item['url'] }}"
                        @class([
                            'doc-hub-nav-link',
                            'doc-hub-nav-link--active' => $item['active'],
                        ])
                    >
                        @if ($item['label'] === $homeLabel)
                            <x-filament::icon icon="heroicon-o-home" class="h-4 w-4 shrink-0" />
                        @elseif ($item['label'] === $manageLabel)
                            <x-filament::icon icon="heroicon-o-cog-6-tooth" class="h-4 w-4 shrink-0" />
                        @endif
                        {{ $item['label'] }}
                    </a>
                @endforeach
            </nav>
        @endif
    </header>

    <div class="doc-hub-content">
        {{ $slot }}
    </div>
</x-filament-panels::page>
</div>
