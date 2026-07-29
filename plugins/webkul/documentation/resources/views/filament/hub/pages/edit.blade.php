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

                    /* Register a BlockEmbed blot so Quill keeps <figure class="ql-doc-table">
                       intact — without this Quill's MutationObserver strips unknown tags. */
                    (function () {
                        var BlockEmbed = Quill.import('blots/block/embed');
                        function TableBlot() { BlockEmbed.apply(this, arguments); }
                        TableBlot.prototype = Object.create(BlockEmbed.prototype);
                        TableBlot.prototype.constructor = TableBlot;
                        TableBlot.create = function (value) {
                            var node = BlockEmbed.create.call(this, value);
                            node.innerHTML = value;
                            return node;
                        };
                        TableBlot.value = function (node) { return node.innerHTML; };
                        TableBlot.blotName  = 'doc-table';
                        TableBlot.tagName   = 'figure';
                        TableBlot.className = 'ql-doc-table';
                        Quill.register(TableBlot, true);
                    })();

                    self.quill = new Quill(self.$refs.quillBox, {
                        theme: 'snow',
                        modules: {
                            toolbar: {
                                container: '#doc-quill-toolbar',
                                handlers: {
                                    'insert-table': function () { self.insertBlankTable(3, 3); }
                                }
                            }
                        }
                    });

                    if (self.initialContent) {
                        self.quill.root.innerHTML = self.initialContent;
                    }

                    /* Markdown table paste: runs after Quill inserts plain text */
                    self._mdTimer = null;
                    self.quill.on('text-change', function (delta, oldDelta, source) {
                        if (source !== 'user') return;
                        var inserted = delta.ops
                            .filter(function (op) { return typeof op.insert === 'string'; })
                            .map(function (op) { return op.insert; }).join('');
                        if (inserted.indexOf('|') === -1) return;
                        clearTimeout(self._mdTimer);
                        self._mdTimer = setTimeout(function () { self.convertMarkdownTables(); }, 60);
                    });

                    /* Sync editor → hidden textarea for Livewire */
                    self.quill.on('text-change', function () { self.syncTextarea(); });
                },

                /* Sync DOM → hidden textarea */
                syncTextarea: function () {
                    var html = this.quill.root.innerHTML;
                    var ta   = document.getElementById('quill-content-sync');
                    if (ta) {
                        ta.value = (html === '<p><br></p>') ? '' : html;
                        ta.dispatchEvent(new Event('input'));
                    }
                },

                /* Insert a blank rows×cols table via the registered blot */
                insertBlankTable: function (rows, cols) {
                    var inner = '<table><thead><tr>';
                    for (var c = 0; c < cols; c++) inner += '<th> </th>';
                    inner += '</tr></thead><tbody>';
                    for (var r = 0; r < rows - 1; r++) {
                        inner += '<tr>';
                        for (var cc = 0; cc < cols; cc++) inner += '<td> </td>';
                        inner += '</tr>';
                    }
                    inner += '</tbody></table>';

                    var idx = (this.quill.getSelection(true) || { index: this.quill.getLength() }).index;
                    this.quill.insertEmbed(idx, 'doc-table', inner, 'user');
                    this.quill.insertText(idx + 1, '\n', 'user');
                    this.quill.setSelection(idx + 2, 0, 'user');
                },

                /* After paste: replace Markdown pipe-table paragraphs with the blot */
                convertMarkdownTables: function () {
                    var self  = this;
                    var root  = self.quill.root;
                    var nodes = Array.prototype.slice.call(root.childNodes);
                    var groups = [], cur = null;

                    nodes.forEach(function (n) {
                        var txt = (n.innerText || n.textContent || '').trim();
                        if (txt.indexOf('|') !== -1) {
                            if (!cur) cur = { nodes: [], lines: [] };
                            cur.nodes.push(n);
                            cur.lines.push(txt);
                        } else {
                            if (cur) { groups.push(cur); cur = null; }
                        }
                    });
                    if (cur) groups.push(cur);

                    groups.forEach(function (g) {
                        if (!self.isMdTable(g.lines.join('\n'))) return;

                        // Find the Quill index of the first node
                        var firstBlot = Quill.find(g.nodes[0]);
                        if (!firstBlot) return;
                        var startIdx = self.quill.getIndex(firstBlot);

                        // Count total length of all nodes to delete
                        var totalLen = g.nodes.reduce(function (sum, n) {
                            var b = Quill.find(n);
                            return sum + (b ? b.length() : 0);
                        }, 0);

                        // Delete the plain-text lines and insert the blot
                        var inner = self.mdToTable(g.lines.join('\n'));
                        self.quill.deleteText(startIdx, totalLen, 'user');
                        self.quill.insertEmbed(startIdx, 'doc-table', inner, 'user');
                        self.quill.insertText(startIdx + 1, '\n', 'user');
                    });
                },

                isMdTable: function (text) {
                    var rows = text.trim().split('\n').filter(function (l) { return l.trim(); });
                    return rows.filter(function (l) { return /^\s*\|.*\|\s*$/.test(l); }).length >= 2;
                },

                mdToTable: function (text) {
                    var lines = text.trim().split('\n').map(function (l) { return l.trim(); }).filter(Boolean);

                    function cells(line) {
                        return line.replace(/^\||\|$/g, '').split('|').map(function (c) { return c.trim(); });
                    }
                    function isSep(line) { return /^\|?[\s\-:|]+(\|[\s\-:|]+)*\|?$/.test(line); }
                    function align(s) {
                        return /^:-+:$/.test(s) ? 'center' : /^-+:$/.test(s) ? 'right' : /^:-+$/.test(s) ? 'left' : '';
                    }
                    function inline(s) {
                        return s.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
                                .replace(/\*(.+?)\*/g, '<em>$1</em>')
                                .replace(/_(.+?)_/g, '<em>$1</em>')
                                .replace(/`(.+?)`/g, '<code>$1</code>');
                    }

                    var aligns = [], html = '', inHead = false, headDone = false;

                    for (var i = 0; i < lines.length; i++) {
                        var l = lines[i];
                        if (isSep(l)) {
                            if (inHead) { html += '</tr></thead><tbody>'; inHead = false; }
                            aligns = cells(l).map(align);
                            headDone = true;
                            continue;
                        }
                        var cs = cells(l);
                        if (!headDone && i === 0) {
                            html += '<table><thead><tr>'; inHead = true;
                            cs.forEach(function (c, ci) {
                                var a = aligns[ci] ? ' style="text-align:' + aligns[ci] + '"' : '';
                                html += '<th' + a + '>' + inline(c) + '</th>';
                            });
                        } else {
                            if (html === '') html += '<table><tbody>';
                            html += '<tr>';
                            cs.forEach(function (c, ci) {
                                var a = aligns[ci] ? ' style="text-align:' + aligns[ci] + '"' : '';
                                html += '<td' + a + '>' + inline(c) + '</td>';
                            });
                            html += '</tr>';
                        }
                    }
                    if (inHead) html += '</tr></thead>';
                    html += '</tbody></table><p><br></p>';
                    return html;
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
                                <button class="ql-insert-table" title="Insert table">
                                    <svg viewBox="0 0 18 18" fill="none" stroke="currentColor" stroke-width="1.5" width="18" height="18">
                                        <rect x="1" y="1" width="16" height="16" rx="1"/>
                                        <line x1="1" y1="6" x2="17" y2="6"/>
                                        <line x1="1" y1="12" x2="17" y2="12"/>
                                        <line x1="6" y1="6" x2="6" y2="17"/>
                                        <line x1="12" y1="6" x2="12" y2="17"/>
                                    </svg>
                                </button>
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
