@props(['spaces' => [], 'pages' => []])

<section class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm dark:border-gray-700 dark:bg-gray-900">
    <h2 class="mb-4 text-base font-semibold text-gray-950 dark:text-white">
        {{ __('documentation::filament/hub.dashboard.search_results') }}
    </h2>

    @if (count($spaces) === 0 && count($pages) === 0)
        <p class="text-sm text-gray-500 dark:text-gray-400">{{ __('documentation::filament/hub.dashboard.search_empty') }}</p>
    @else
        @if (count($spaces) > 0)
            <h3 class="mb-2 text-xs font-semibold uppercase tracking-wide text-gray-500">
                {{ __('documentation::filament/hub.dashboard.search_spaces') }}
            </h3>
            <div class="mb-6 grid gap-3 sm:grid-cols-2">
                @foreach ($spaces as $space)
                    @include('documentation::filament.hub.partials.space-card-compact', ['space' => $space])
                @endforeach
            </div>
        @endif

        @if (count($pages) > 0)
            <h3 class="mb-2 text-xs font-semibold uppercase tracking-wide text-gray-500">
                {{ __('documentation::filament/hub.dashboard.search_pages') }}
            </h3>
            <div class="divide-y divide-gray-100 rounded-lg border border-gray-100 dark:divide-gray-800 dark:border-gray-800">
                @foreach ($pages as $page)
                    <a
                        href="{{ $page['url'] }}"
                        class="flex items-center gap-3 px-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-800/50"
                    >
                        <span class="h-2 w-2 rounded-full" style="background-color: {{ $page['space_color'] ?? '#3b82f6' }}"></span>
                        <div class="min-w-0 flex-1">
                            <p class="truncate font-medium text-gray-950 dark:text-white">{{ $page['title'] }}</p>
                            <p class="text-xs text-gray-500">{{ $page['space_name'] }}</p>
                        </div>
                    </a>
                @endforeach
            </div>
        @endif
    @endif
</section>
