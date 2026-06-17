<x-documentation::filament.hub.layout>
    {{-- Quill — synchronous load so Quill is ready before Alpine initialises --}}
    @once
    <link rel="stylesheet" href="{{ asset('js/quill/quill.snow.css') }}">
    <script src="{{ asset('js/quill/quill.min.js') }}"></script>
    <script>
    document.addEventListener('alpine:init', function () {
        Alpine.data('docQuillEditor', function (opts) {
            return {
                quill: null,
                busy: false,
                uploadUrl: opts.uploadUrl,
                csrfToken: opts.csrfToken,
                initialContent: opts.initialContent,

                init: function () {
                    var self = this;
                    if (typeof Quill === 'undefined') { console.error('Quill not loaded'); return; }

                    self.quill = new Quill(self.$refs.quillBox, {
                        theme: 'snow',
                        modules: {
                            toolbar: { container: '#doc-quill-toolbar', handlers: {} }
                        }
                    });

                    if (self.initialContent) {
                        self.quill.root.innerHTML = self.initialContent;
                    }

                    /* Sync Quill → hidden textarea. Livewire reads wire:model="pageContent"
                       from that textarea on every request, so no capture-listener tricks needed. */
                    self.quill.on('text-change', function () {
                        var html = self.quill.root.innerHTML;
                        var ta = document.getElementById('quill-content-sync');
                        if (ta) {
                            ta.value = html === '<p><br></p>' ? '' : html;
                            ta.dispatchEvent(new Event('input'));
                        }
                    });
                },

                uploadFile: function (file) {
                    var self = this;
                    self.busy = true;
                    var fd = new FormData();
                    fd.append('file', file);
                    fd.append('_token', self.csrfToken);
                    fetch(self.uploadUrl, {
                        method: 'POST',
                        body: fd,
                        headers: { 'X-CSRF-TOKEN': self.csrfToken, 'Accept': 'application/json' }
                    })
                    .then(function (r) {
                        if (!r.ok) return r.text().then(function (t) { throw new Error('HTTP ' + r.status + ': ' + t.substring(0, 200)); });
                        return r.json();
                    })
                    .then(function (data) {
                        self.quill.focus();
                        var sel = self.quill.getSelection() || { index: self.quill.getLength(), length: 0 };
                        if (data.is_image) {
                            self.quill.insertEmbed(sel.index, 'image', data.url, 'user');
                            self.quill.setSelection(sel.index + 1);
                        } else {
                            self.quill.insertText(sel.index, data.name, 'link', data.url, 'user');
                            self.quill.setSelection(sel.index + data.name.length + 1);
                        }
                    })
                    .catch(function (err) { alert('Upload failed: ' + err.message); })
                    .finally(function () { self.busy = false; });
                }
            };
        });
    });
    </script>
    @endonce

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

                {{-- Content editor (Quill WYSIWYG) --}}
                <div class="doc-editor-field doc-editor-field--content">
                    <label class="doc-editor-label">
                        {{ __('documentation::filament/hub.pages.fields.content') }}
                    </label>

                    {{-- Hidden textarea: Livewire reads pageContent from here on every request.
                         Quill dispatches an 'input' event on it after each change, so this
                         stays in sync without any capture-listener or $wire.set() timing hacks. --}}
                    <textarea id="quill-content-sync" wire:model="pageContent"
                              style="display:none" aria-hidden="true"></textarea>

                    <div
                        wire:ignore
                        x-data="docQuillEditor({
                            uploadUrl: {{ Js::from(route('documentation.upload')) }},
                            csrfToken: {{ Js::from(csrf_token()) }},
                            initialContent: @js($pageContent)
                        })"
                        class="doc-editor-content-wrap"
                    >
                        {{-- Quill toolbar --}}
                        <div id="doc-quill-toolbar" class="doc-quill-toolbar">
                            <span class="ql-formats">
                                <button class="ql-bold"      title="Bold"></button>
                                <button class="ql-italic"    title="Italic"></button>
                                <button class="ql-underline" title="Underline"></button>
                            </span>
                            <span class="ql-formats">
                                <select class="ql-header" title="Heading">
                                    <option value="2">Heading 2</option>
                                    <option value="3">Heading 3</option>
                                    <option selected></option>
                                </select>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-list" value="bullet"  title="Bullet list"></button>
                                <button class="ql-list" value="ordered" title="Numbered list"></button>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-blockquote"  title="Quote"></button>
                                <button class="ql-code-block"  title="Code block"></button>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-link"   title="Insert link"></button>
                                {{-- Hidden file inputs live inside wire:ignore so Livewire never replaces them --}}
                                <input type="file" id="doc-img-input" accept="image/*" style="display:none"
                                    x-on:change="if($event.target.files[0]){ uploadFile($event.target.files[0]); $event.target.value=''; }">
                                <label for="doc-img-input" class="doc-quill-upload-btn" title="Insert image"
                                    x-bind:style="busy ? 'pointer-events:none;opacity:0.5;' : ''">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15">
                                        <rect x="3" y="3" width="18" height="18" rx="2"/>
                                        <circle cx="8.5" cy="8.5" r="1.5"/>
                                        <polyline points="21 15 16 10 5 21"/>
                                    </svg>
                                </label>
                            </span>
                            <span class="ql-formats">
                                <button class="ql-clean" title="Clear formatting"></button>
                            </span>
                            <span x-show="busy" style="font-size:11px;color:#6b7280;padding-left:8px;line-height:24px;">Uploading…</span>
                        </div>

                        {{-- Quill editor mount point --}}
                        <div x-ref="quillBox" class="doc-quill-editor"></div>

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
