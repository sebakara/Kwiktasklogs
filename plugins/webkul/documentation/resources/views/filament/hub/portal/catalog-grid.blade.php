@props(['items' => [], 'empty' => '', 'type' => 'project'])

@if (count($items) === 0)
    <x-documentation::filament.hub.empty-state
        :icon="$type === 'product' ? 'heroicon-o-cube' : 'heroicon-o-briefcase'"
        :description="$empty"
        class="doc-catalog-empty"
    />
@else
    <div class="doc-catalog-grid">
        @foreach ($items as $item)
            @include('documentation::filament.hub.partials.catalog-card', [
                'item' => $item,
                'type' => $type,
            ])
        @endforeach
    </div>
@endif
