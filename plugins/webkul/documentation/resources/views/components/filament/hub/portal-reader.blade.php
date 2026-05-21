@props([
    'space',
    'pageTree' => [],
    'currentPageId' => null,
    'catalogLabel' => null,
    'catalogUrl' => null,
    'createPageUrl' => null,
])

@php
    $navItems = $this->getHubNavigationItems();
    $hubAccess = method_exists($this, 'hubAccessFlags') ? $this->hubAccessFlags() : [];
@endphp

<x-filament-panels::page>
    <div
        wire:loading.flex
        class="fixed inset-x-0 top-0 z-50 hidden h-0.5 bg-primary-500 motion-safe:animate-pulse"
        aria-hidden="true"
    ></div>

    <div class="mb-4 flex flex-col gap-3 border-b border-gray-200 pb-4 dark:border-gray-700 sm:flex-row sm:items-center sm:justify-between">
        <div class="min-w-0">
            <p class="text-sm font-medium text-primary-600 dark:text-primary-400">
                {{ __('documentation::filament/hub.layout.eyebrow') }}
            </p>
            @if ($catalogUrl && $catalogLabel)
                <a href="{{ $catalogUrl }}" class="mt-1 inline-flex items-center gap-1 text-xs text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
                    <x-filament::icon icon="heroicon-o-arrow-left" class="h-3.5 w-3.5" />
                    {{ $catalogLabel }}
                </a>
            @endif
        </div>

        <nav class="flex flex-wrap gap-2">
            @foreach ($navItems as $item)
                <a
                    href="{{ $item['url'] }}"
                    @class([
                        'inline-flex items-center rounded-lg px-3 py-2 text-sm font-medium transition',
                        'bg-primary-600 text-white shadow-sm' => $item['active'],
                        'bg-gray-100 text-gray-700 hover:bg-gray-200 dark:bg-gray-800 dark:text-gray-200 dark:hover:bg-gray-700' => ! $item['active'],
                    ])
                >
                    {{ $item['label'] }}
                </a>
            @endforeach
        </nav>
    </div>

    <div class="flex min-h-[calc(100vh-12rem)] flex-col gap-0 overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900 lg:flex-row">
        <aside class="w-full shrink-0 border-b border-gray-200 bg-gray-50/80 p-4 dark:border-gray-700 dark:bg-gray-950/50 lg:w-72 lg:border-b-0 lg:border-r">
            <div class="mb-3 flex items-center gap-2">
                <span
                    class="h-3 w-3 shrink-0 rounded-full"
                    style="background-color: {{ $space->color ?? '#3b82f6' }}"
                ></span>
                <h2 class="truncate text-sm font-semibold text-gray-950 dark:text-white">{{ $space->name }}</h2>
            </div>

            @if ($createPageUrl)
                <a
                    href="{{ $createPageUrl }}"
                    class="mb-4 inline-flex w-full items-center justify-center gap-1.5 rounded-lg border border-dashed border-gray-300 px-3 py-2 text-xs font-medium text-gray-600 hover:border-primary-400 hover:text-primary-600 dark:border-gray-600 dark:text-gray-300 dark:hover:border-primary-500 dark:hover:text-primary-400"
                >
                    <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4" />
                    {{ __('documentation::filament/hub.portal.new_page') }}
                </a>
            @endif

            @include('documentation::filament.hub.partials.page-tree-portal', [
                'nodes' => $pageTree,
                'spaceId' => $space->id,
                'currentPageId' => $currentPageId,
            ])
        </aside>

        <div class="min-w-0 flex-1 p-4 sm:p-6">
            {{ $slot }}
        </div>
    </div>
</x-filament-panels::page>
