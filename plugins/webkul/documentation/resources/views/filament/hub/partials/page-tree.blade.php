@props(['nodes' => [], 'spaceId' => null, 'depth' => 0])

@if (empty($nodes))
    <p class="text-sm text-gray-500 dark:text-gray-400">{{ __('documentation::filament/hub.spaces.empty_tree') }}</p>
@else
    <ul @class(['space-y-0.5', 'ml-4 border-l border-gray-200 pl-3 dark:border-gray-700' => $depth > 0])>
        @foreach ($nodes as $node)
            <li>
                <a
                    href="{{ \Webkul\Documentation\Filament\Pages\ViewPage::getUrl(['documentationSpace' => $spaceId, 'pageRecord' => $node['id']]) }}"
                    @class([
                        'group flex items-center gap-2 rounded-lg px-2 py-2 text-sm transition',
                        'hover:bg-gray-50 dark:hover:bg-gray-800/50' => true,
                    ])
                >
                    @if (! empty($node['children']))
                        <x-filament::icon icon="heroicon-o-folder" class="h-4 w-4 shrink-0 text-gray-400" />
                    @else
                        <x-filament::icon icon="heroicon-o-document-text" class="h-4 w-4 shrink-0 text-gray-400" />
                    @endif
                    <span class="min-w-0 flex-1 truncate font-medium text-gray-950 group-hover:text-primary-600 dark:text-white dark:group-hover:text-primary-400">
                        {{ $node['title'] }}
                    </span>
                    @if ($node['is_published'])
                        <span class="shrink-0 rounded bg-success-50 px-1.5 py-0.5 text-xs text-success-700 dark:bg-success-500/10 dark:text-success-400">
                            {{ __('documentation::filament/hub.labels.published') }}
                        </span>
                    @else
                        <span class="shrink-0 rounded bg-gray-100 px-1.5 py-0.5 text-xs text-gray-600 dark:bg-gray-800 dark:text-gray-400">
                            {{ __('documentation::filament/hub.labels.draft') }}
                        </span>
                    @endif
                </a>
                @if (! empty($node['children']))
                    @include('documentation::filament.hub.partials.page-tree', [
                        'nodes' => $node['children'],
                        'spaceId' => $spaceId,
                        'depth' => $depth + 1,
                    ])
                @endif
            </li>
        @endforeach
    </ul>
@endif
