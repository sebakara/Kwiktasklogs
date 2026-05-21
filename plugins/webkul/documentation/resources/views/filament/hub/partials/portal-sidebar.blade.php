@props([
    'space',
    'pageTree' => [],
    'currentPageId' => null,
    'createPageUrl' => null,
])

<aside class="doc-portal-sidebar" aria-label="{{ __('documentation::filament/hub.portal.sidebar_label') }}">
    <div class="doc-portal-sidebar-head">
        <div class="doc-portal-sidebar-brand">
            <span
                class="doc-portal-sidebar-dot"
                style="background-color: {{ $space->color ?? '#3b82f6' }}"
            ></span>
            <div class="min-w-0">
                <p class="doc-portal-sidebar-label">
                    {{ __('documentation::filament/hub.portal.sidebar_label') }}
                </p>
                <p class="doc-portal-sidebar-name" title="{{ $space->name }}">
                    {{ $space->name }}
                </p>
            </div>
        </div>

        @if ($createPageUrl)
            <a href="{{ $createPageUrl }}" class="doc-portal-sidebar-new">
                <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4" />
                {{ __('documentation::filament/hub.portal.new_page') }}
            </a>
        @endif
    </div>

    <nav class="doc-portal-sidebar-nav" aria-label="{{ __('documentation::filament/hub.spaces.page_tree') }}">
        @include('documentation::filament.hub.partials.page-tree-portal', [
            'nodes' => $pageTree,
            'spaceId' => $space->id,
            'currentPageId' => $currentPageId,
        ])
    </nav>
</aside>
