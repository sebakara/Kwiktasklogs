@props(['active' => ''])

<div {{ $attributes->class(['inline-flex flex-wrap rounded-lg border border-gray-200 bg-gray-50 p-1 dark:border-gray-700 dark:bg-gray-800']) }}>
    {{ $slot }}
</div>
