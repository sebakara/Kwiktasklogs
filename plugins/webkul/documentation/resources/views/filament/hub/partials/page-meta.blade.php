@props(['page'])

<div class="doc-portal-meta">
    @if ($page->creator)
        <span class="doc-portal-meta-item">
            <x-filament::icon icon="heroicon-o-user-circle" class="doc-portal-meta-icon" />
            {{ $page->creator->name }}
        </span>
    @endif
    @if ($page->lastEditor && (int) $page->lastEditor->id !== (int) $page->creator_id)
        <span class="doc-portal-meta-item">
            <x-filament::icon icon="heroicon-o-pencil-square" class="doc-portal-meta-icon" />
            {{ $page->lastEditor->name }}
        </span>
    @endif
    <span class="doc-portal-meta-item">
        <x-filament::icon icon="heroicon-o-clock" class="doc-portal-meta-icon" />
        {{ __('documentation::filament/hub.pages.meta.updated') }} {{ $page->updated_at?->diffForHumans() }}
    </span>
    @if ($page->published_at)
        <span class="doc-portal-meta-item">
            <x-filament::icon icon="heroicon-o-globe-alt" class="doc-portal-meta-icon" />
            {{ __('documentation::filament/hub.pages.meta.published') }} {{ $page->published_at->diffForHumans() }}
        </span>
    @endif
</div>
