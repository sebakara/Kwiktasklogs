@props([
    'icon' => 'heroicon-o-inbox',
    'title' => null,
    'description' => null,
])

<div {{ $attributes->class(['rounded-xl border border-dashed border-gray-300 bg-gray-50 px-6 py-12 text-center dark:border-gray-600 dark:bg-gray-900/50']) }}>
    @if ($icon)
        <div class="mx-auto mb-3 flex h-12 w-12 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-800">
            <x-filament::icon :icon="$icon" class="h-6 w-6 text-gray-400" />
        </div>
    @endif

    @if ($title)
        <p class="text-sm font-medium text-gray-700 dark:text-gray-200">{{ $title }}</p>
    @endif

    @if ($description)
        <p @class(['text-sm text-gray-500 dark:text-gray-400', 'mt-1' => $title !== null])>{{ $description }}</p>
    @endif

    @if ($slot->isNotEmpty())
        <div class="mt-4 flex flex-wrap items-center justify-center gap-2">
            {{ $slot }}
        </div>
    @endif
</div>
