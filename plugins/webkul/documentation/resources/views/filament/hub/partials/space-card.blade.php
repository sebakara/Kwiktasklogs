@props(['space'])

@php
    $color = $space['color'] ?? '#3b82f6';
    $description = trim((string) ($space['description'] ?? ''));
    $pagesCount = (int) ($space['pages_count'] ?? 0);
    $hasActions = ($space['can_edit'] ?? false) || ($space['can_delete'] ?? false);
    $visibilityKey = (string) ($space['visibility'] ?? '');
    $visibilityLangKey = $visibilityKey !== '' ? 'documentation::filament/hub.spaces.visibility.'.$visibilityKey : null;
    $visibilityLabel = $visibilityLangKey && \Illuminate\Support\Facades\Lang::has($visibilityLangKey)
        ? __($visibilityLangKey)
        : ($visibilityKey !== '' ? ucfirst($visibilityKey) : '');
@endphp

<article class="doc-space-card" style="--card-accent: {{ $color }}">
    <a href="{{ $space['url'] }}" class="doc-space-card-main group">
        <div class="doc-space-card-accent"></div>

        <div class="doc-space-card-body">
            <div class="doc-space-card-top">
                <span class="doc-space-card-icon">
                    <x-filament::icon icon="heroicon-o-rectangle-stack" class="h-5 w-5" />
                </span>
                <div class="doc-space-card-heading">
                    <h2 class="doc-space-card-title">{{ $space['name'] }}</h2>
                    @if (! empty($space['slug']))
                        <p class="doc-space-card-slug">{{ $space['slug'] }}</p>
                    @endif
                </div>
                <x-filament::icon icon="heroicon-o-arrow-up-right" class="doc-space-card-arrow" />
            </div>

            <div class="doc-space-card-meta-row">
                @if (! ($space['is_active'] ?? true))
                    <span class="doc-space-card-pill doc-space-card-pill--archived">
                        {{ __('documentation::filament/hub.labels.archived') }}
                    </span>
                @endif
                @if ($visibilityLabel !== '')
                    <span class="doc-space-card-pill doc-space-card-pill--visibility">
                        {{ $visibilityLabel }}
                    </span>
                @endif
            </div>

            <p @class([
                'doc-space-card-desc',
                'doc-space-card-desc--empty' => $description === '',
            ])>
                {{ $description !== '' ? $description : __('documentation::filament/hub.spaces.no_description') }}
            </p>

            <div class="doc-space-card-stats">
                <span @class([
                    'doc-space-card-badge',
                    'doc-space-card-badge--ready' => $pagesCount > 0,
                    'doc-space-card-badge--empty' => $pagesCount === 0,
                ])>
                    <x-filament::icon icon="heroicon-o-document-text" class="h-3.5 w-3.5 shrink-0" />
                    {{ trans_choice('documentation::filament/hub.portal.pages_count', $pagesCount, ['count' => $pagesCount]) }}
                </span>
                <span class="doc-space-card-cta">
                    {{ __('documentation::filament/hub.spaces.open_space') }}
                </span>
            </div>
        </div>
    </a>

    @if ($hasActions)
        <div class="doc-space-card-actions">
            @if ($space['edit_url'] ?? null)
                <a href="{{ $space['edit_url'] }}" class="doc-space-card-action doc-space-card-action--edit">
                    <x-filament::icon icon="heroicon-o-pencil-square" class="h-4 w-4 shrink-0" />
                    {{ __('documentation::filament/hub.spaces.edit') }}
                </a>
            @endif
            @if ($space['can_edit'] ?? false)
                @if ($space['is_active'] ?? true)
                    <x-documentation::filament.hub.btn
                        variant="ghost"
                        wire:click="archiveSpace({{ $space['id'] }})"
                        target="archiveSpace"
                        :confirm="__('documentation::filament/hub.spaces.confirm_archive')"
                        class="doc-space-card-action doc-space-card-action--warn"
                    >
                        <x-filament::icon icon="heroicon-o-archive-box" class="h-4 w-4 shrink-0" />
                        {{ __('documentation::filament/hub.spaces.archive') }}
                    </x-documentation::filament.hub.btn>
                @else
                    <x-documentation::filament.hub.btn
                        variant="ghost"
                        wire:click="restoreSpace({{ $space['id'] }})"
                        target="restoreSpace"
                        :confirm="__('documentation::filament/hub.spaces.confirm_restore')"
                        class="doc-space-card-action doc-space-card-action--success"
                    >
                        <x-filament::icon icon="heroicon-o-arrow-uturn-left" class="h-4 w-4 shrink-0" />
                        {{ __('documentation::filament/hub.spaces.restore') }}
                    </x-documentation::filament.hub.btn>
                @endif
            @endif
            @if ($space['can_delete'] ?? false)
                <x-documentation::filament.hub.btn
                    variant="ghost"
                    wire:click="deleteSpace({{ $space['id'] }})"
                    target="deleteSpace"
                    :confirm="__('documentation::filament/hub.spaces.confirm_delete')"
                    class="doc-space-card-action doc-space-card-action--danger"
                >
                    <x-filament::icon icon="heroicon-o-trash" class="h-4 w-4 shrink-0" />
                    {{ __('documentation::filament/hub.spaces.delete') }}
                </x-documentation::filament.hub.btn>
            @endif
        </div>
    @endif
</article>
