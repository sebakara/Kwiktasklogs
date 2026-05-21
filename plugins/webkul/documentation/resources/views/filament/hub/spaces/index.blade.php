<x-documentation::filament.hub.layout>
    <div class="doc-spaces">
        <div class="doc-spaces-toolbar">
            <nav class="doc-spaces-filters" aria-label="{{ __('documentation::filament/hub.spaces.filters.active') }}">
                @foreach (['active' => __('documentation::filament/hub.spaces.filters.active'), 'archived' => __('documentation::filament/hub.spaces.filters.archived'), 'all' => __('documentation::filament/hub.spaces.filters.all')] as $key => $label)
                    <button
                        type="button"
                        wire:click="setFilter('{{ $key }}')"
                        @class([
                            'doc-spaces-filter',
                            'doc-spaces-filter--active' => $filter === $key,
                        ])
                    >
                        {{ $label }}
                    </button>
                @endforeach
            </nav>

            @if ($canCreateSpace)
                <a href="{{ \Webkul\Documentation\Filament\Pages\CreateSpace::getUrl() }}" class="doc-spaces-create">
                    <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4 shrink-0" />
                    {{ __('documentation::filament/hub.spaces.create') }}
                </a>
            @endif
        </div>

        @if (count($spaces) > 0)
            <div class="doc-spaces-panel-header">
                <h2 class="doc-spaces-panel-title">
                    {{ match ($filter) {
                        'archived' => __('documentation::filament/hub.spaces.filters.archived'),
                        'all' => __('documentation::filament/hub.spaces.filters.all'),
                        default => __('documentation::filament/hub.spaces.filters.active'),
                    } }}
                </h2>
                <span class="doc-spaces-panel-meta">
                    {{ trans_choice('documentation::filament/hub.spaces.space_count', count($spaces), ['count' => count($spaces)]) }}
                </span>
            </div>
        @endif

        <div class="doc-spaces-grid">
            @forelse ($spaces as $space)
                @include('documentation::filament.hub.partials.space-card', ['space' => $space])
            @empty
                <div class="doc-spaces-empty-wrap">
                    <x-documentation::filament.hub.empty-state
                        icon="heroicon-o-rectangle-stack"
                        :description="__('documentation::filament/hub.spaces.empty')"
                        class="doc-spaces-empty"
                    >
                        @if ($canCreateSpace)
                            <a href="{{ \Webkul\Documentation\Filament\Pages\CreateSpace::getUrl() }}" class="doc-spaces-create-inline">
                                <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4" />
                                {{ __('documentation::filament/hub.spaces.create_first') }}
                            </a>
                        @endif
                    </x-documentation::filament.hub.empty-state>
                </div>
            @endforelse
        </div>
    </div>
</x-documentation::filament.hub.layout>
