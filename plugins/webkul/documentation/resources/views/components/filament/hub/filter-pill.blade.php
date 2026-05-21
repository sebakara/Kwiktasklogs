@props(['active' => false])

<button
    type="button"
    {{ $attributes->class([
        'rounded-md px-3 py-1.5 text-sm font-medium transition',
        'bg-white text-gray-950 shadow-sm dark:bg-gray-900 dark:text-white' => $active,
        'text-gray-600 hover:text-gray-950 dark:text-gray-400 dark:hover:text-white' => ! $active,
    ]) }}
>
    {{ $slot }}
</button>
