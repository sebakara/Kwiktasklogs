<x-documentation::filament.hub.layout>
    <p class="text-sm text-gray-600 dark:text-gray-400">
        {{ __('documentation::filament/hub.manage.intro') }}
    </p>

    @if (count($links) === 0)
        <x-documentation::filament.hub.empty-state
            icon="heroicon-o-cog-6-tooth"
            :description="__('documentation::filament/hub.manage.empty')"
        />
    @else
        <div class="grid gap-4 sm:grid-cols-2">
            @foreach ($links as $link)
                <a
                    href="{{ $link['url'] }}"
                    class="group flex gap-4 rounded-xl border border-gray-200 bg-white p-5 shadow-sm transition hover:border-primary-300 hover:shadow-md dark:border-gray-700 dark:bg-gray-900 dark:hover:border-primary-600"
                >
                    <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary-50 text-primary-600 dark:bg-primary-500/10 dark:text-primary-400">
                        <x-filament::icon :icon="$link['icon']" class="h-5 w-5" />
                    </span>
                    <span class="min-w-0">
                        <span class="block font-semibold text-gray-950 group-hover:text-primary-600 dark:text-white dark:group-hover:text-primary-400">
                            {{ $link['label'] }}
                        </span>
                        <span class="mt-1 block text-sm text-gray-500 dark:text-gray-400">{{ $link['description'] }}</span>
                    </span>
                </a>
            @endforeach
        </div>
    @endif
</x-documentation::filament.hub.layout>
