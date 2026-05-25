<x-documentation::filament.hub.layout>
    <style>
        .doc-hub-versions-breadcrumb {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .doc-hub-versions-breadcrumb-link,
        .doc-hub-versions-breadcrumb-current {
            font-size: 0.875rem;
            line-height: 1.5;
        }

        .doc-hub-versions-breadcrumb-link {
            display: inline-flex;
            align-items: center;
            gap: 0.375rem;
            color: rgb(75 85 99);
            text-decoration: none;
        }

        .doc-hub-versions-breadcrumb-link:hover {
            color: rgb(37 99 235);
        }

        .doc-hub-versions-breadcrumb-sep {
            color: rgb(156 163 175);
        }

        .doc-hub-versions-current {
            font-weight: 600;
        }

        .doc-hub-versions-intro {
            display: flex;
            gap: 1rem;
            align-items: flex-start;
            margin-bottom: 1rem;
            padding: 1rem 1.25rem;
            border: 1px solid rgb(229 231 235);
            border-radius: 1rem;
            background: rgb(255 255 255);
            box-shadow: 0 1px 2px rgb(0 0 0 / 0.04);
        }

        .doc-hub-versions-intro-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 9999px;
            background: rgb(239 246 255);
            color: rgb(37 99 235);
            flex-shrink: 0;
        }

        .doc-hub-versions-intro-text {
            margin: 0;
            font-size: 0.95rem;
            font-weight: 500;
            color: rgb(17 24 39);
        }

        .doc-hub-versions-intro-meta {
            margin: 0.35rem 0 0;
            font-size: 0.8125rem;
            color: rgb(107 114 128);
        }

        .doc-hub-versions-list {
            list-style: none;
            margin: 0;
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .doc-hub-versions-item {
            display: grid;
            grid-template-columns: auto minmax(0, 1fr);
            gap: 1rem;
            padding: 1rem;
            border: 1px solid rgb(229 231 235);
            border-radius: 1rem;
            background: rgb(255 255 255);
            transition: border-color 0.15s ease, box-shadow 0.15s ease, transform 0.15s ease;
        }

        .doc-hub-versions-item:hover {
            border-color: rgb(191 219 254);
            box-shadow: 0 10px 25px rgb(0 0 0 / 0.05);
            transform: translateY(-1px);
        }

        .doc-hub-versions-item--current {
            border-color: rgb(147 197 253);
            background: rgb(239 246 255 / 0.55);
        }

        .doc-hub-versions-marker {
            display: flex;
            justify-content: center;
        }

        .doc-hub-versions-marker-dot {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: 0.45rem;
            border-radius: 9999px;
            background: rgb(203 213 225);
        }

        .doc-hub-versions-item--current .doc-hub-versions-marker-dot {
            background: rgb(37 99 235);
            box-shadow: 0 0 0 0.3rem rgb(191 219 254 / 0.9);
        }

        .doc-hub-versions-body {
            min-width: 0;
        }

        .doc-hub-versions-head {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 1rem;
        }

        .doc-hub-versions-title-row {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 0.5rem;
        }

        .doc-hub-versions-number {
            font-size: 0.8125rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            color: rgb(37 99 235);
        }

        .doc-hub-versions-badge {
            display: inline-flex;
            align-items: center;
            border-radius: 9999px;
            padding: 0.25rem 0.625rem;
            font-size: 0.6875rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .doc-hub-versions-badge--current {
            background: rgb(220 252 231);
            color: rgb(21 128 61);
        }

        .doc-hub-versions-page-title {
            margin: 0.35rem 0 0;
            font-size: 1.05rem;
            font-weight: 600;
            color: rgb(17 24 39);
        }

        .doc-hub-versions-note {
            margin: 0.75rem 0 0;
            font-size: 0.9375rem;
            line-height: 1.55;
            color: rgb(75 85 99);
        }

        .doc-hub-versions-meta {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 0.45rem;
            margin: 0.85rem 0 0;
            font-size: 0.8125rem;
            color: rgb(107 114 128);
        }

        .doc-hub-versions-meta-sep {
            color: rgb(209 213 219);
        }

        .doc-hub-versions-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            flex-shrink: 0;
        }

        @media (max-width: 768px) {
            .doc-hub-versions-head {
                flex-direction: column;
            }

            .doc-hub-versions-actions {
                width: 100%;
            }
        }
    </style>

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
