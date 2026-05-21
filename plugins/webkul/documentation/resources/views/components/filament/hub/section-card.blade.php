@props([
    'title' => null,
    'heading' => null,
])

@php
    $headingText = $heading ?? $title;
@endphp

<section {{ $attributes->class(['overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900']) }}>
    @if ($headingText || isset($actions))
        <div class="flex flex-wrap items-center justify-between gap-3 border-b border-gray-100 px-5 py-4 dark:border-gray-800">
            @if ($headingText)
                <h2 class="text-base font-semibold text-gray-950 dark:text-white">{{ $headingText }}</h2>
            @endif
            @isset($actions)
                <div class="flex flex-wrap items-center gap-2">{{ $actions }}</div>
            @endisset
        </div>
    @endif

    {{ $slot }}
</section>
