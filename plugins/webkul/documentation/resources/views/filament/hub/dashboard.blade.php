<x-documentation::filament.hub.layout>
    <div class="doc-catalog">
        <nav class="doc-catalog-tabs" aria-label="{{ __('documentation::filament/hub.portal.catalog_title') }}">
            @if ($projectsAvailable)
                <button
                    type="button"
                    wire:click="setTab('projects')"
                    @class(['doc-catalog-tab', 'doc-catalog-tab--active' => $tab === 'projects'])
                >
                    <x-filament::icon icon="heroicon-o-briefcase" class="h-4 w-4 shrink-0" />
                    {{ __('documentation::filament/hub.portal.tab_projects') }}
                    @if (count($projects) > 0)
                        <span class="doc-catalog-tab-count">{{ count($projects) }}</span>
                    @endif
                </button>
            @endif
            @if ($productsAvailable)
                <button
                    type="button"
                    wire:click="setTab('products')"
                    @class(['doc-catalog-tab', 'doc-catalog-tab--active' => $tab === 'products'])
                >
                    <x-filament::icon icon="heroicon-o-cube" class="h-4 w-4 shrink-0" />
                    {{ __('documentation::filament/hub.portal.tab_products') }}
                    @if (count($products) > 0)
                        <span class="doc-catalog-tab-count">{{ count($products) }}</span>
                    @endif
                </button>
            @endif
            <button
                type="button"
                wire:click="setTab('recent')"
                @class(['doc-catalog-tab', 'doc-catalog-tab--active' => $tab === 'recent'])
            >
                <x-filament::icon icon="heroicon-o-clock" class="h-4 w-4 shrink-0" />
                {{ __('documentation::filament/hub.portal.tab_recent') }}
            </button>
        </nav>

        @php
            $activeCount = match ($tab) {
                'projects' => count($projects),
                'products' => count($products),
                default => count($recentPages),
            };
            $activeLabel = match ($tab) {
                'projects' => __('documentation::filament/hub.portal.tab_projects'),
                'products' => __('documentation::filament/hub.portal.tab_products'),
                default => __('documentation::filament/hub.portal.tab_recent'),
            };
        @endphp

        <div class="doc-catalog-panel-header">
            <h2 class="doc-catalog-panel-title">{{ $activeLabel }}</h2>
            @if ($tab !== 'recent' && $activeCount > 0)
                <span class="doc-catalog-panel-meta">
                    {{ trans_choice('documentation::filament/hub.portal.catalog_items', $activeCount, ['count' => $activeCount]) }}
                </span>
            @endif
        </div>

        <div class="doc-catalog-panel">
            @if ($tab === 'projects')
                @include('documentation::filament.hub.portal.catalog-grid', [
                    'items' => $projects,
                    'empty' => __('documentation::filament/hub.portal.empty_projects'),
                    'type' => 'project',
                ])
            @elseif ($tab === 'products')
                @include('documentation::filament.hub.portal.catalog-grid', [
                    'items' => $products,
                    'empty' => __('documentation::filament/hub.portal.empty_products'),
                    'type' => 'product',
                ])
            @else
                @include('documentation::filament.hub.partials.page-list-card', [
                    'title' => __('documentation::filament/hub.dashboard.recent_pages'),
                    'pages' => $recentPages,
                    'empty' => __('documentation::filament/hub.dashboard.empty_pages'),
                ])
            @endif
        </div>
    </div>
</x-documentation::filament.hub.layout>
