@props(['page', 'canEdit' => false, 'canPublish' => false, 'canShare' => false, 'editUrl' => null])

<div class="doc-portal-toolbar">
    <div class="doc-portal-toolbar-lead">
        @if ($page->is_published)
            <span class="doc-portal-status doc-portal-status--published">
                <x-filament::icon icon="heroicon-o-check-circle" class="h-4 w-4" />
                {{ __('documentation::filament/hub.labels.published') }}
            </span>
        @else
            <span class="doc-portal-status doc-portal-status--draft">
                <x-filament::icon icon="heroicon-o-pencil-square" class="h-4 w-4" />
                {{ __('documentation::filament/hub.labels.draft') }}
            </span>
        @endif
    </div>

    <div class="doc-portal-toolbar-actions">
        @if ($canShare)
            <x-documentation::filament.hub.btn
                variant="secondary"
                type="button"
                wire:click="openShareModal"
                target="openShareModal"
            >
                <x-filament::icon icon="heroicon-o-share" class="h-4 w-4" />
                {{ __('documentation::filament/hub.share.create') }}
            </x-documentation::filament.hub.btn>
        @endif

        @if ($canEdit && $editUrl)
            <x-documentation::filament.hub.btn variant="primary" :href="$editUrl">
                <x-filament::icon icon="heroicon-o-pencil-square" class="h-4 w-4" />
                {{ __('documentation::filament/hub.pages.edit') }}
            </x-documentation::filament.hub.btn>
        @endif

        @if ($canEdit)
            <a
                href="{{ \Webkul\Documentation\Filament\Pages\PageVersions::getUrl(['documentationSpace' => $page->space_id, 'pageRecord' => $page->id]) }}"
                class="doc-portal-btn-icon"
                title="{{ __('documentation::filament/hub.pages.version_history') }}"
            >
                <x-filament::icon icon="heroicon-o-clock" class="h-5 w-5" />
            </a>
        @endif
    </div>
</div>
