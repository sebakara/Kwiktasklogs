<x-documentation::filament.hub.layout>
    <div
        wire:key="doc-editor-{{ $isCreating ? 'create' : $record?->id }}"
        class="doc-editor-frame"
        style="--doc-accent: {{ $this->space->color ?? '#2563eb' }}"
        x-data="{
            sidebarOpen: true,
            sidebarReady: false,
            toggleSidebar() {
                this.sidebarOpen = ! this.sidebarOpen;
            },
            initSidebarState() {
                try {
                    const stored = localStorage.getItem('doc-editor-sidebar-open-v2');
                    if (stored !== null) {
                        this.sidebarOpen = JSON.parse(stored) === true;
                    }
                } catch (e) {
                    this.sidebarOpen = true;
                }

                this.sidebarReady = true;

                this.$watch('sidebarOpen', (open) => {
                    localStorage.setItem('doc-editor-sidebar-open-v2', JSON.stringify(open === true));
                });
            },
        }"
        x-init="initSidebarState()"
        x-bind:class="{ 'doc-editor-frame--collapsed': sidebarReady && ! sidebarOpen }"
    >
        {{-- Left page-tree sidebar --}}
        <div class="doc-editor-tree-wrap">
            <aside class="doc-editor-tree-sidebar">
                <div class="doc-editor-tree-head">
                    <div class="doc-editor-tree-brand" x-show="sidebarOpen" x-transition:enter="transition-opacity duration-150" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100">
                        <span class="doc-editor-tree-dot" style="background-color: {{ $this->space->color ?? '#3b82f6' }}"></span>
                        <div class="min-w-0 flex-1">
                            <p class="doc-editor-tree-label">{{ __('documentation::filament/hub.portal.sidebar_label') }}</p>
                            <p class="doc-editor-tree-name" title="{{ $this->space->name }}">{{ $this->space->name }}</p>
                        </div>
                    </div>

                    <div class="doc-editor-tree-toggle-row">
                        <button
                            type="button"
                            class="doc-editor-tree-toggle-btn"
                            x-on:click="toggleSidebar()"
                            x-bind:aria-expanded="sidebarOpen"
                            x-bind:title="sidebarOpen ? '{{ __('documentation::filament/hub.portal.sidebar_collapse') }}' : '{{ __('documentation::filament/hub.portal.sidebar_expand') }}'"
                        >
                            <x-filament::icon
                                icon="heroicon-o-chevron-double-left"
                                class="doc-editor-tree-chevron"
                                x-bind:class="{ 'doc-editor-tree-chevron--flipped': !sidebarOpen }"
                            />
                        </button>
                    </div>
                </div>

                <nav
                    class="doc-editor-tree-nav"
                    x-show="sidebarOpen"
                    x-transition:enter="transition-opacity duration-150"
                    x-transition:enter-start="opacity-0"
                    x-transition:enter-end="opacity-100"
                    aria-label="{{ __('documentation::filament/hub.spaces.page_tree') }}"
                >
                    @include('documentation::filament.hub.partials.page-tree-portal', [
                        'nodes' => $this->pageTree,
                        'spaceId' => $this->space->id,
                        'currentPageId' => $this->record?->id,
                    ])
                </nav>

                <div
                    class="doc-editor-tree-collapsed-indicator"
                    x-show="!sidebarOpen"
                    x-transition:enter="transition-opacity duration-150"
                    x-transition:enter-start="opacity-0"
                    x-transition:enter-end="opacity-100"
                    title="{{ $this->space->name }}"
                >
                    <x-filament::icon icon="heroicon-o-book-open" class="h-5 w-5" />
                </div>
            </aside>
        </div>

        {{-- Editor (div, not form — avoids accidental native submit breaking Livewire actions) --}}
        <div class="doc-editor-layout">
            {{-- Main editor column --}}
            <div class="doc-editor-main">
                <input type="hidden" wire:model="space_id" />

                {{-- Title --}}
                <div class="doc-editor-field doc-editor-field--title">
                    <input
                        type="text"
                        wire:model.live.debounce.500ms="pageTitle"
                        placeholder="{{ __('documentation::filament/hub.pages.editor.title_placeholder') }}"
                        class="doc-editor-title-input"
                        autofocus
                    />
                    @error('pageTitle')
                        <p class="doc-editor-field-error">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Slug --}}
                <div class="doc-editor-field doc-editor-field--slug">
                    <div class="doc-editor-slug-row">
                        <span class="doc-editor-slug-prefix">
                            <x-filament::icon icon="heroicon-o-link" class="h-3.5 w-3.5" />
                            {{ __('documentation::filament/hub.pages.fields.slug') }}:
                        </span>
                        <input
                            type="text"
                            wire:model="pageSlug"
                            class="doc-editor-slug-input"
                        />
                    </div>
                    @error('pageSlug')
                        <p class="doc-editor-field-error">{{ $message }}</p>
                    @enderror
                </div>

                {{-- Summary --}}
                <div class="doc-editor-field">
                    <label class="doc-editor-label">
                        {{ __('documentation::filament/hub.pages.fields.summary') }}
                        <span class="doc-editor-label-hint">{{ __('documentation::filament/hub.pages.editor.summary_hint') }}</span>
                    </label>
                    <textarea
                        wire:model="pageSummary"
                        rows="2"
                        placeholder="{{ __('documentation::filament/hub.pages.editor.summary_placeholder') }}"
                        class="doc-editor-input doc-editor-input--summary"
                    ></textarea>
                </div>

                {{-- Content editor --}}
                <div class="doc-editor-field doc-editor-field--content">
                    <label class="doc-editor-label">
                        {{ __('documentation::filament/hub.pages.fields.content') }}
                    </label>

                    <div
                        x-data="{
                            wrap(before, after) {
                                const ta = this.$refs.editor;
                                const s = ta.selectionStart, e = ta.selectionEnd;
                                ta.setRangeText(before + ta.value.substring(s, e) + after, s, e, 'end');
                                ta.dispatchEvent(new Event('input', { bubbles: true }));
                                ta.focus();
                            },
                            insertLink() {
                                const url = window.prompt({{ Js::from(__('documentation::filament/hub.pages.editor.link_prompt')) }});
                                if (!url) return;
                                this.wrap('<a href=\u0022' + url + '\u0022>', '<\/a>');
                            },
                        }"
                        class="doc-editor-content-wrap"
                    >
                        <div class="doc-editor-toolbar">
                            <button type="button" x-on:click="wrap('<strong>','<\/strong>')" class="doc-editor-tb-btn doc-editor-tb-btn--bold" title="Bold">B</button>
                            <button type="button" x-on:click="wrap('<em>','<\/em>')" class="doc-editor-tb-btn doc-editor-tb-btn--italic" title="Italic">I</button>
                            <span class="doc-editor-tb-divider"></span>
                            <button type="button" x-on:click="wrap('<h2>','<\/h2>')" class="doc-editor-tb-btn" title="Heading 2">H2</button>
                            <button type="button" x-on:click="wrap('<h3>','<\/h3>')" class="doc-editor-tb-btn" title="Heading 3">H3</button>
                            <span class="doc-editor-tb-divider"></span>
                            <button type="button" x-on:click="wrap('<ul>\n  <li>','<\/li>\n<\/ul>')" class="doc-editor-tb-btn" title="Bullet list">
                                <x-filament::icon icon="heroicon-o-list-bullet" class="h-3.5 w-3.5" />
                            </button>
                            <button type="button" x-on:click="wrap('<ol>\n  <li>','<\/li>\n<\/ol>')" class="doc-editor-tb-btn" title="Numbered list">
                                <x-filament::icon icon="heroicon-o-numbered-list" class="h-3.5 w-3.5" />
                            </button>
                            <button type="button" x-on:click="wrap('<p>','<\/p>')" class="doc-editor-tb-btn" title="Paragraph">¶</button>
                            <button type="button" x-on:click="wrap('<code>','<\/code>')" class="doc-editor-tb-btn doc-editor-tb-btn--code" title="Inline code">&lt;/&gt;</button>
                            <button type="button" x-on:click="insertLink()" class="doc-editor-tb-btn" title="Insert link">
                                <x-filament::icon icon="heroicon-o-link" class="h-3.5 w-3.5" />
                            </button>
                        </div>

                        <textarea
                            x-ref="editor"
                            wire:model="pageContent"
                            rows="24"
                            placeholder="{{ __('documentation::filament/hub.pages.editor.content_placeholder') }}"
                            class="doc-editor-textarea"
                        ></textarea>

                        <p class="doc-editor-hint">{{ __('documentation::filament/hub.pages.editor.hint') }}</p>
                    </div>

                    @error('pageContent')
                        <p class="doc-editor-field-error">{{ $message }}</p>
                    @enderror
                </div>
            </div>

            {{-- Right sidebar: publishing + tags --}}
            <aside class="doc-editor-sidebar">

                <div class="doc-editor-panel">
                    <div class="doc-editor-panel-header">
                        @if ($record?->is_published)
                            <span class="doc-editor-status doc-editor-status--published">
                                <x-filament::icon icon="heroicon-o-check-circle" class="h-4 w-4" />
                                {{ __('documentation::filament/hub.labels.published') }}
                            </span>
                        @else
                            <span class="doc-editor-status doc-editor-status--draft">
                                <x-filament::icon icon="heroicon-o-pencil-square" class="h-4 w-4" />
                                {{ __('documentation::filament/hub.labels.draft') }}
                            </span>
                        @endif
                    </div>

                    <div class="doc-editor-panel-actions">
                        @if (! $isCreating)
                            <x-filament::button
                                type="button"
                                color="gray"
                                wire:click="save"
                                wire:target="save"
                                class="doc-hub-btn doc-hub-btn--secondary w-full"
                            >
                                <x-filament::icon icon="heroicon-o-cloud-arrow-up" class="h-4 w-4" />
                                {{ __('documentation::filament/hub.pages.save_changes') }}
                            </x-filament::button>
                        @endif

                        <x-filament::button
                            type="button"
                            color="gray"
                            wire:click="saveDraft"
                            wire:target="saveDraft"
                            class="doc-hub-btn doc-hub-btn--secondary w-full"
                        >
                            <x-filament::icon icon="heroicon-o-document" class="h-4 w-4" />
                            {{ __('documentation::filament/hub.pages.save_draft') }}
                        </x-filament::button>

                        <x-filament::button
                            type="button"
                            wire:click="publish"
                            wire:target="publish"
                            class="doc-hub-btn doc-hub-btn--primary w-full"
                        >
                            <x-filament::icon icon="heroicon-o-globe-alt" class="h-4 w-4" />
                            {{ __('documentation::filament/hub.pages.publish_button') }}
                        </x-filament::button>
                    </div>

                    <a href="{{ $this->cancelUrl() }}" class="doc-editor-cancel-link">
                        {{ __('documentation::filament/hub.pages.cancel') }}
                    </a>
                </div>

                {{-- Tags --}}
                @if (count($tagOptions) > 0)
                    <div class="doc-editor-panel">
                        <h3 class="doc-editor-panel-title">
                            <x-filament::icon icon="heroicon-o-tag" class="h-4 w-4" />
                            {{ __('documentation::filament/hub.pages.fields.tags') }}
                        </h3>
                        <div class="doc-editor-tags">
                            @foreach ($tagOptions as $id => $name)
                                <label class="doc-editor-tag-item">
                                    <input
                                        type="checkbox"
                                        wire:model="tag_ids"
                                        value="{{ $id }}"
                                        class="doc-editor-tag-checkbox"
                                    />
                                    <span class="doc-editor-tag-label">{{ $name }}</span>
                                </label>
                            @endforeach
                        </div>
                        @error('tag_ids')
                            <p class="doc-editor-field-error">{{ $message }}</p>
                        @enderror
                    </div>
                @endif
            </aside>
        </div>
    </div>
</x-documentation::filament.hub.layout>
