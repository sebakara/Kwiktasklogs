@props([
    'variant' => 'secondary',
    'type' => 'button',
    'target' => null,
    'confirm' => null,
    'href' => null,
])

@php
    $variantClass = match ($variant) {
        'primary' => 'doc-hub-btn--primary',
        'ghost' => 'doc-hub-btn--ghost',
        'danger' => 'doc-hub-btn--danger',
        'warning' => 'doc-hub-btn--warning',
        'success' => 'doc-hub-btn--success',
        default => 'doc-hub-btn--secondary',
    };

    $classes = trim('doc-hub-btn '.$variantClass);
    $loadingTarget = $target ?? $attributes->wire('click')->value();
@endphp

@if ($href)
    <a
        href="{{ $href }}"
        {{ $attributes->merge(['class' => $classes]) }}
    >
        {{ $slot }}
    </a>
@else
    <button
        {{ $attributes->merge(['type' => $type, 'class' => $classes]) }}
        @if ($confirm) wire:confirm="{{ $confirm }}" @endif
        @if ($loadingTarget) wire:loading.attr="disabled" wire:target="{{ $loadingTarget }}" @endif
    >
        {{ $slot }}
    </button>
@endif
