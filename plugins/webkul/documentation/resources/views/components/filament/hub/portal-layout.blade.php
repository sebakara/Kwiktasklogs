@php
    use Webkul\Documentation\Filament\Pages\HubDashboard;

    $navItems = method_exists($this, 'getHubNavigationItems') ? $this->getHubNavigationItems() : [];
    $homeLabel = __('documentation::filament/hub.nav.home');
    $manageLabel = __('documentation::filament/hub.nav.manage');
    $hubAccess = method_exists($this, 'hubAccessFlags') ? $this->hubAccessFlags() : [];
@endphp

<div class="doc-portal-reader">
    <div
        wire:loading.flex
        class="pointer-events-none fixed inset-x-0 top-0 z-50 hidden h-0.5 bg-primary-500 motion-safe:animate-pulse"
        aria-hidden="true"
    ></div>

    <header class="doc-portal-reader-header">
        <div class="doc-portal-reader-header-top">
            @if (count($navItems) > 0)
                <nav class="doc-portal-reader-nav" aria-label="{{ __('documentation::filament/hub.layout.eyebrow') }}">
                    @foreach ($navItems as $item)
                        <a
                            href="{{ $item['url'] }}"
                            @class([
                                'doc-portal-reader-nav-link',
                                'doc-portal-reader-nav-link--active' => $item['active'],
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

            @if (! empty($hubAccess['role']))
                <span class="doc-portal-reader-role">
                    {{ __('documentation::filament/hub.access.role', ['role' => str_replace('_', ' ', $hubAccess['role'])]) }}
                </span>
            @endif
        </div>

        <div class="doc-portal-reader-header-main">
            <div class="doc-portal-reader-breadcrumb">
                <a href="{{ HubDashboard::getUrl() }}" class="doc-portal-reader-breadcrumb-link">
                    {{ __('documentation::filament/hub.layout.eyebrow') }}
                </a>
                <span class="doc-portal-reader-breadcrumb-sep" aria-hidden="true">/</span>
                @if (method_exists($this, 'spaceBackUrl') && $this->spaceBackUrl())
                    <a href="{{ $this->spaceBackUrl() }}" class="doc-portal-reader-breadcrumb-link">
                        {{ $this->space->name }}
                    </a>
                @else
                    <span class="doc-portal-reader-breadcrumb-current">{{ $this->space->name }}</span>
                @endif
            </div>

            <h1 class="doc-portal-reader-title">{{ $this->getTitle() }}</h1>

            @if (method_exists($this, 'getPageSubheading') && filled($this->getPageSubheading()))
                <p class="doc-portal-reader-subtitle">{{ $this->getPageSubheading() }}</p>
            @endif
        </div>
    </header>

    <div class="doc-portal-reader-body">
        {{ $slot }}
    </div>
</div>
