<x-documentation::filament.hub.layout>
    <nav class="doc-hub-versions-breadcrumb" aria-label="{{ __('documentation::filament/hub.pages.back_to_page') }}">
        <a href="{{ $this->pageUrl() }}" class="doc-hub-versions-breadcrumb-link">
            <x-filament::icon icon="heroicon-o-arrow-left" class="h-4 w-4 shrink-0" />
            {{ __('documentation::filament/hub.pages.back_to_page') }}
        </a>
        <span class="doc-hub-versions-breadcrumb-sep" aria-hidden="true">/</span>
        <span class="doc-hub-versions-breadcrumb-current">{{ $this->record->title }}</span>
    </nav>

    <div class="doc-hub-versions-intro">
        <div class="doc-hub-versions-intro-icon" aria-hidden="true">
            <x-filament::icon icon="heroicon-o-clock" class="h-6 w-6" />
        </div>
        <div class="min-w-0 flex-1">
            <p class="doc-hub-versions-intro-text">{{ __('documentation::filament/hub.versions.subtitle') }}</p>
            @if (count($versions) > 0)
                <p class="doc-hub-versions-intro-meta">
                    {{ trans_choice('documentation::filament/hub.versions.count', count($versions), ['count' => count($versions)]) }}
                    · {{ $space->name }}
                </p>
            @endif
        </div>
    </div>

    <x-documentation::filament.hub.section-card>
        @if (count($versions) > 0)
            <ol class="doc-hub-versions-list" role="list">
                @foreach ($versions as $version)
                    <li @class([
                        'doc-hub-versions-item',
                        'doc-hub-versions-item--current' => $version['is_current'],
                    ])>
                        <div class="doc-hub-versions-marker" aria-hidden="true">
                            <span class="doc-hub-versions-marker-dot"></span>
                        </div>

                        <div class="doc-hub-versions-body">
                            <div class="doc-hub-versions-head">
                                <div class="min-w-0 flex-1">
                                    <div class="doc-hub-versions-title-row">
                                        <span class="doc-hub-versions-number">
                                            {{ __('documentation::filament/hub.pages.version_label', ['number' => $version['version_number']]) }}
                                        </span>
                                        @if ($version['is_current'])
                                            <span class="doc-hub-versions-badge doc-hub-versions-badge--current">
                                                {{ __('documentation::filament/hub.versions.current') }}
                                            </span>
                                        @endif
                                    </div>
                                    <p class="doc-hub-versions-page-title">{{ $version['title'] }}</p>
                                </div>

                                <div class="doc-hub-versions-actions">
                                    <x-documentation::filament.hub.btn
                                        variant="secondary"
                                        :href="$version['view_url']"
                                        class="doc-hub-btn--inline"
                                    >
                                        <x-filament::icon icon="heroicon-o-eye" class="h-4 w-4" />
                                        {{ __('documentation::filament/hub.versions.view') }}
                                    </x-documentation::filament.hub.btn>

                                    @if ($version['can_restore'])
                                        <x-documentation::filament.hub.btn
                                            variant="primary"
                                            wire:click="restoreVersion({{ $version['id'] }})"
                                            :confirm="__('documentation::filament/hub.versions.confirm_restore')"
                                            target="restoreVersion({{ $version['id'] }})"
                                            class="doc-hub-btn--inline"
                                        >
                                            <x-filament::icon icon="heroicon-o-arrow-uturn-left" class="h-4 w-4" />
                                            {{ __('documentation::filament/hub.versions.restore') }}
                                        </x-documentation::filament.hub.btn>
                                    @endif
                                </div>
                            </div>

                            @if ($version['change_note'])
                                <p class="doc-hub-versions-note">{{ $version['change_note'] }}</p>
                            @endif

                            <p class="doc-hub-versions-meta">
                                <x-filament::icon icon="heroicon-o-user-circle" class="h-3.5 w-3.5 shrink-0" />
                                <span>{{ $version['creator_name'] ?? '—' }}</span>
                                <span class="doc-hub-versions-meta-sep" aria-hidden="true">·</span>
                                <x-filament::icon icon="heroicon-o-calendar-days" class="h-3.5 w-3.5 shrink-0" />
                                <span>{{ $version['created_at'] }}</span>
                            </p>
                        </div>
                    </li>
                @endforeach
            </ol>
        @else
            <x-documentation::filament.hub.empty-state
                icon="heroicon-o-clock"
                :description="__('documentation::filament/hub.pages.no_versions')"
                class="border-0 bg-transparent shadow-none dark:bg-transparent"
            />
        @endif
    </x-documentation::filament.hub.section-card>
</x-documentation::filament.hub.layout>
