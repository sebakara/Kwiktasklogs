@props(['nodes' => [], 'spaceId' => null, 'currentPageId' => null, 'depth' => 0])

@if (empty($nodes))
    <p class="doc-portal-tree-empty">
        {{ __('documentation::filament/hub.spaces.empty_tree') }}
    </p>
@else
    <ul @class(['doc-portal-tree', 'doc-portal-tree--nested' => $depth > 0])>
        @foreach ($nodes as $node)
            @php
                $isActive = (int) $currentPageId === (int) $node['id'];
                $isDraft = empty($node['is_published']);
                $hasChildren = ! empty($node['children']);
            @endphp
            <li
                @if ($hasChildren)
                    x-data="{ open: true }"
                @endif
                class="doc-portal-tree-item"
            >
                <div class="doc-portal-tree-row">
                    @if ($hasChildren)
                        <button
                            type="button"
                            class="doc-portal-tree-toggle"
                            x-on:click="open = ! open"
                            x-bind:aria-expanded="open"
                            aria-label="{{ __('documentation::filament/hub.spaces.page_tree') }}"
                        >
                            <x-filament::icon
                                icon="heroicon-m-chevron-right"
                                class="doc-portal-tree-chevron"
                                x-bind:class="{ 'doc-portal-tree-chevron--open': open }"
                            />
                        </button>
                    @else
                        <span class="doc-portal-tree-toggle-spacer" aria-hidden="true"></span>
                    @endif

                    <a
                        href="{{ \Webkul\Documentation\Filament\Pages\ViewPage::getUrl(['documentationSpace' => $spaceId, 'pageRecord' => $node['id']]) }}"
                        @class([
                            'doc-portal-tree-link',
                            'doc-portal-tree-link--active' => $isActive,
                        ])
                    >
                        <x-filament::icon
                            :icon="$hasChildren ? 'heroicon-o-folder' : 'heroicon-o-document-text'"
                            class="doc-portal-tree-icon"
                        />
                        <span class="doc-portal-tree-title">{{ $node['title'] }}</span>
                        @if ($isDraft)
                            <span class="doc-portal-tree-draft">{{ __('documentation::filament/hub.labels.draft') }}</span>
                        @endif
                    </a>
                </div>

                @if ($hasChildren)
                    <div x-show="open" x-collapse class="doc-portal-tree-children">
                        @include('documentation::filament.hub.partials.page-tree-portal', [
                            'nodes' => $node['children'],
                            'spaceId' => $spaceId,
                            'currentPageId' => $currentPageId,
                            'depth' => $depth + 1,
                        ])
                    </div>
                @endif
            </li>
        @endforeach
    </ul>
@endif
