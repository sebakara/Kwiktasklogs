@props(['title', 'pages' => [], 'empty'])

<section class="rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900">
    <div class="border-b border-gray-100 px-5 py-4 dark:border-gray-800">
        <h2 class="text-base font-semibold text-gray-950 dark:text-white">{{ $title }}</h2>
    </div>
    <div class="divide-y divide-gray-100 dark:divide-gray-800">
        @forelse ($pages as $page)
            <a
                href="{{ $page['url'] }}"
                class="flex items-start gap-3 px-5 py-3 transition hover:bg-gray-50 dark:hover:bg-gray-800/50"
            >
                <span
                    class="mt-1.5 h-2 w-2 shrink-0 rounded-full"
                    style="background-color: {{ $page['space_color'] ?? '#3b82f6' }}"
                ></span>
                <div class="min-w-0 flex-1">
                    <p class="truncate font-medium text-gray-950 dark:text-white">{{ $page['title'] }}</p>
                    <p class="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
                        {{ $page['space_name'] }}
                        @if ($page['updated_at'])
                            · {{ $page['updated_at'] }}
                        @endif
                    </p>
                </div>
                @if ($page['is_published'])
                    <span class="shrink-0 rounded bg-success-50 px-2 py-0.5 text-xs font-medium text-success-700 dark:bg-success-500/10 dark:text-success-400">
                        {{ __('documentation::filament/hub.labels.published') }}
                    </span>
                @else
                    <span class="shrink-0 rounded bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600 dark:bg-gray-800 dark:text-gray-400">
                        {{ __('documentation::filament/hub.labels.draft') }}
                    </span>
                @endif
            </a>
        @empty
            <p class="px-5 py-6 text-sm text-gray-500 dark:text-gray-400">{{ $empty }}</p>
        @endforelse
    </div>
</section>
