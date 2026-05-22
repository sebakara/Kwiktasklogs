<x-documentation::filament.hub.layout>
    <nav class="doc-hub-versions-breadcrumb" aria-label="{{ __('documentation::filament/hub.versions.back_to_list') }}">
        <a href="{{ $this->versionsUrl() }}" class="doc-hub-versions-breadcrumb-link">
            <x-filament::icon icon="heroicon-o-clock" class="h-4 w-4 shrink-0" />
            {{ __('documentation::filament/hub.versions.back_to_list') }}
        </a>
        <span class="doc-hub-versions-breadcrumb-sep" aria-hidden="true">/</span>
        <a href="{{ $this->currentPageUrl() }}" class="doc-hub-versions-breadcrumb-link">
            {{ __('documentation::filament/hub.pages.back_to_page') }}
        </a>
        <span class="doc-hub-versions-breadcrumb-sep" aria-hidden="true">/</span>
        <span class="doc-hub-versions-breadcrumb-current">
            {{ __('documentation::filament/hub.versions.view_version', ['number' => $version->version_number]) }}
        </span>
    </nav>

    <header class="doc-hub-version-show-header">
        <div class="min-w-0 flex-1">
            <p class="doc-hub-version-show-eyebrow">
                {{ __('documentation::filament/hub.pages.version_label', ['number' => $version->version_number]) }}
            </p>
            <h2 class="doc-hub-version-show-title">{{ $version->title }}</h2>
            @if ($version->change_note)
                <p class="doc-hub-version-show-note">{{ $version->change_note }}</p>
            @endif
            <p class="doc-hub-versions-meta doc-hub-version-show-meta">
                <x-filament::icon icon="heroicon-o-user-circle" class="h-3.5 w-3.5 shrink-0" />
                <span>{{ $version->creator?->name ?? '—' }}</span>
                <span class="doc-hub-versions-meta-sep" aria-hidden="true">·</span>
                <x-filament::icon icon="heroicon-o-calendar-days" class="h-3.5 w-3.5 shrink-0" />
                <span>{{ $version->created_at?->toDayDateTimeString() }}</span>
            </p>
        </div>

        @if ($this->canRestore())
            <x-documentation::filament.hub.btn
                variant="primary"
                wire:click="restoreVersion"
                :confirm="__('documentation::filament/hub.versions.confirm_restore')"
                target="restoreVersion"
                class="doc-hub-btn--inline shrink-0"
            >
                <x-filament::icon icon="heroicon-o-arrow-uturn-left" class="h-4 w-4" />
                {{ __('documentation::filament/hub.versions.restore') }}
            </x-documentation::filament.hub.btn>
        @endif
    </header>

    @if ($version->summary)
        <p class="doc-hub-version-show-summary">{{ $version->summary }}</p>
    @endif

    <div @class([
        'doc-hub-version-show-grid',
        'doc-hub-version-show-grid--with-toc' => count($tableOfContents) > 0,
    ])>
        @if (count($tableOfContents) > 0)
            <aside class="doc-hub-version-show-toc">
                @include('documentation::filament.hub.partials.table-of-contents', ['items' => $tableOfContents])
            </aside>
        @endif

        <article class="doc-hub-version-show-article">
            {!! $renderedContent !!}
        </article>
    </div>
</x-documentation::filament.hub.layout>
