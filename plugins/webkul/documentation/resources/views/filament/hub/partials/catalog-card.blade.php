@props([
    'item',
    'type' => 'project',
])

@php
    $color = $item['color'] ?? ($type === 'product' ? '#8b5cf6' : '#2563eb');
    $pagesCount = (int) ($item['pages_count'] ?? 0);
    $hasPages = $pagesCount > 0;
    $description = trim((string) ($item['description'] ?? ''));
@endphp

<a
    href="{{ $item['url'] }}"
    class="doc-catalog-card group"
    style="--card-accent: {{ $color }}"
>
    <div class="doc-catalog-card-accent"></div>

    <div class="doc-catalog-card-body">
        <div class="doc-catalog-card-top">
            <span class="doc-catalog-card-icon">
                <x-filament::icon
                    :icon="$type === 'product' ? 'heroicon-o-cube' : 'heroicon-o-briefcase'"
                    class="h-5 w-5"
                />
            </span>
            <div class="doc-catalog-card-heading">
                <h3 class="doc-catalog-card-title">{{ $item['name'] }}</h3>
            </div>
            <x-filament::icon
                icon="heroicon-o-arrow-up-right"
                class="doc-catalog-card-arrow"
            />
        </div>

        <p @class([
            'doc-catalog-card-desc',
            'doc-catalog-card-desc--empty' => $description === '',
        ])>
            {{ $description !== '' ? $description : __('documentation::filament/hub.portal.no_description') }}
        </p>

        <div class="doc-catalog-card-footer">
            <span @class([
                'doc-catalog-card-badge',
                'doc-catalog-card-badge--ready' => $hasPages,
                'doc-catalog-card-badge--empty' => ! $hasPages,
            ])>
                <x-filament::icon :icon="$hasPages ? 'heroicon-o-document-text' : 'heroicon-o-plus-circle'" class="h-3.5 w-3.5 shrink-0" />
                <span>
                    @if ($hasPages)
                        {{ trans_choice('documentation::filament/hub.portal.pages_count', $pagesCount, ['count' => $pagesCount]) }}
                    @else
                        {{ __('documentation::filament/hub.portal.no_pages_yet') }}
                    @endif
                </span>
            </span>
            <span class="doc-catalog-card-cta">
                {{ $hasPages ? __('documentation::filament/hub.portal.open_docs') : __('documentation::filament/hub.portal.start_writing') }}
            </span>
        </div>
    </div>
</a>
