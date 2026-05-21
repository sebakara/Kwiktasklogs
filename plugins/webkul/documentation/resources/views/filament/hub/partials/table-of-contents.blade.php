@props(['items' => []])

<nav class="doc-portal-toc" aria-label="{{ __('documentation::filament/hub.pages.table_of_contents') }}">
    <h2 class="doc-portal-toc-title">
        {{ __('documentation::filament/hub.pages.table_of_contents') }}
    </h2>
    <ul class="doc-portal-toc-list">
        @foreach ($items as $item)
            <li @class([
                'doc-portal-toc-item',
                'doc-portal-toc-item--h3' => $item['level'] === 3,
                'doc-portal-toc-item--h4' => $item['level'] >= 4,
            ])>
                <a href="#{{ $item['id'] }}" class="doc-portal-toc-link">
                    {{ $item['text'] }}
                </a>
            </li>
        @endforeach
    </ul>
</nav>
