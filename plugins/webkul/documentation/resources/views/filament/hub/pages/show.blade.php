<x-documentation::filament.hub.portal-layout>
    <div
        class="doc-portal-shell"
        style="--doc-accent: {{ $this->space->color ?? '#2563eb' }}"
        x-data="{
            sidebarOpen: true,
            sidebarReady: false,
            toggleSidebar() {
                this.sidebarOpen = ! this.sidebarOpen;
            },
            initSidebarState() {
                try {
                    const stored = localStorage.getItem('doc-portal-sidebar-open');
                    if (stored !== null) {
                        this.sidebarOpen = JSON.parse(stored) === true;
                    }
                } catch (e) {
                    this.sidebarOpen = true;
                }

                this.sidebarReady = true;

                this.$watch('sidebarOpen', (open) => {
                    localStorage.setItem('doc-portal-sidebar-open', JSON.stringify(open === true));
                });
            },
        }"
        x-init="initSidebarState()"
        x-bind:class="{ 'doc-portal-shell--collapsed': sidebarReady && ! sidebarOpen }"
    >
        <div class="doc-portal-shell-inner">
            {{-- Sidebar --}}
            <div class="doc-portal-sidebar-wrap">
                <aside class="doc-portal-sidebar" aria-label="{{ __('documentation::filament/hub.portal.sidebar_label') }}">
                    <div class="doc-portal-sidebar-head">
                        {{-- Brand row (shown when expanded) --}}
                        <div class="doc-portal-sidebar-brand" x-show="sidebarOpen" x-transition:enter="transition-opacity duration-150" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100">
                            <span
                                class="doc-portal-sidebar-dot"
                                style="background-color: {{ $this->space->color ?? '#3b82f6' }}"
                            ></span>
                            <div class="min-w-0 flex-1">
                                <p class="doc-portal-sidebar-label">{{ __('documentation::filament/hub.portal.sidebar_label') }}</p>
                                <p class="doc-portal-sidebar-name" title="{{ $this->space->name }}">{{ $this->space->name }}</p>
                            </div>
                        </div>

                        {{-- Collapse/expand toggle --}}
                        <div class="doc-portal-sidebar-toggle-row">
                            <button
                                type="button"
                                class="doc-portal-sidebar-collapse-btn"
                                x-on:click="toggleSidebar()"
                                x-bind:aria-expanded="sidebarOpen"
                                x-bind:aria-label="sidebarOpen ? '{{ __('documentation::filament/hub.portal.sidebar_collapse') }}' : '{{ __('documentation::filament/hub.portal.sidebar_expand') }}'"
                                x-bind:title="sidebarOpen ? '{{ __('documentation::filament/hub.portal.sidebar_collapse') }}' : '{{ __('documentation::filament/hub.portal.sidebar_expand') }}'"
                            >
                                <x-filament::icon
                                    icon="heroicon-o-chevron-double-left"
                                    class="doc-portal-sidebar-collapse-icon"
                                    x-bind:class="{ 'doc-portal-sidebar-collapse-icon--flipped': !sidebarOpen }"
                                />
                            </button>
                        </div>

                        {{-- New page button (shown when expanded) --}}
                        @if ($this->createPageUrl())
                            <a
                                href="{{ $this->createPageUrl() }}"
                                class="doc-portal-sidebar-new"
                                x-show="sidebarOpen"
                                x-transition:enter="transition-opacity duration-150"
                                x-transition:enter-start="opacity-0"
                                x-transition:enter-end="opacity-100"
                            >
                                <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4" />
                                {{ __('documentation::filament/hub.portal.new_page') }}
                            </a>
                        @endif
                    </div>

                    {{-- Page tree (shown when expanded) --}}
                    <nav
                        class="doc-portal-sidebar-nav"
                        x-show="sidebarOpen"
                        x-transition:enter="transition-opacity duration-150"
                        x-transition:enter-start="opacity-0"
                        x-transition:enter-end="opacity-100"
                        aria-label="{{ __('documentation::filament/hub.spaces.page_tree') }}"
                    >
                        @include('documentation::filament.hub.partials.page-tree-portal', [
                            'nodes' => $this->pageTree,
                            'spaceId' => $this->space->id,
                            'currentPageId' => $this->record->id,
                        ])
                    </nav>

                    {{-- Collapsed: show active-page icon so user knows where they are --}}
                    <div
                        class="doc-portal-sidebar-collapsed-indicator"
                        x-show="!sidebarOpen"
                        x-transition:enter="transition-opacity duration-150"
                        x-transition:enter-start="opacity-0"
                        x-transition:enter-end="opacity-100"
                        title="{{ $this->record->title }}"
                    >
                        <x-filament::icon icon="heroicon-o-document-text" class="h-5 w-5" />
                    </div>
                </aside>
            </div>

            {{-- Main content --}}
            <div class="doc-portal-main">
                @include('documentation::filament.hub.partials.portal-toolbar', [
                    'page' => $this->record,
                    'canEdit' => $this->canEditPage,
                    'canShare' => $this->canShare(),
                    'editUrl' => $this->editUrl(),
                ])

                <div class="doc-portal-article-wrap">
                    <article class="doc-portal-article">
                        @include('documentation::filament.hub.partials.page-meta', ['page' => $this->record])

                        <div class="doc-portal-prose">
                            {!! $renderedContent !!}
                        </div>

                        @include('documentation::filament.hub.partials.page-audit-log', [
                            'logs' => $this->pageAuditLogs,
                            'showEmpty' => true,
                        ])
                    </article>

                    @if (count($this->tableOfContents) > 0)
                        <div class="doc-portal-toc-wrap">
                            @include('documentation::filament.hub.partials.table-of-contents', [
                                'items' => $this->tableOfContents,
                            ])
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    @if ($shareModalOpen)
        @include('documentation::filament.hub.partials.share-links-modal')
    @endif
</x-documentation::filament.hub.portal-layout>
