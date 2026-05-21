@props(['space'])

<a
    href="{{ $space['url'] }}"
    class="block rounded-lg border border-gray-200 bg-gray-50 p-4 transition hover:border-primary-300 hover:bg-white dark:border-gray-700 dark:bg-gray-800/50 dark:hover:border-primary-600 dark:hover:bg-gray-900"
>
    <div class="flex items-center gap-2">
        <span class="h-3 w-3 shrink-0 rounded-full" style="background-color: {{ $space['color'] ?? '#3b82f6' }}"></span>
        <h3 class="truncate font-medium text-gray-950 dark:text-white">{{ $space['name'] }}</h3>
    </div>
    @if (! empty($space['description']))
        <p class="mt-2 line-clamp-2 text-sm text-gray-500 dark:text-gray-400">{{ $space['description'] }}</p>
    @endif
    <p class="mt-2 text-xs text-gray-400">
        {{ $space['pages_count'] ?? 0 }} {{ __('documentation::filament/hub.labels.pages') }}
    </p>
</a>
