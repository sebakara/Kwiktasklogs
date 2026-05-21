<div>
    @if ($accessDenied)
        <div class="doc-share-card doc-share-card--error">
            <h1 class="doc-share-title">{{ __('documentation::filament/hub.public.denied_title') }}</h1>
            <p class="doc-share-summary">{{ __('documentation::filament/hub.public.denied_message') }}</p>
        </div>
    @elseif ($requiresPassword && $page === null)
        <div class="doc-share-card">
            <h1 class="doc-share-title">{{ __('documentation::filament/hub.public.restricted_title') }}</h1>
            <p class="doc-share-summary">{{ __('documentation::filament/hub.public.restricted_message') }}</p>

            <form wire:submit="submitPassword" class="doc-share-form" style="margin-top: 1.25rem; max-width: 20rem;">
                <label for="share-password">{{ __('documentation::filament/hub.public.password_placeholder') }}</label>
                <input
                    id="share-password"
                    type="password"
                    wire:model="password"
                    class="doc-share-input"
                    autocomplete="current-password"
                />
                @if ($invalidPassword)
                    <p class="doc-share-error">{{ __('documentation::filament/hub.public.invalid_password') }}</p>
                @endif
                <button type="submit" class="doc-share-button">
                    {{ __('documentation::filament/hub.public.unlock') }}
                </button>
            </form>
        </div>
    @elseif ($page)
        <article class="doc-share-card">
            <h1 class="doc-share-title">{{ $page->title }}</h1>
            @if ($page->summary)
                <p class="doc-share-summary">{{ $page->summary }}</p>
            @endif

            @if (count($tableOfContents) > 0)
                <nav class="doc-share-toc" aria-label="{{ __('documentation::filament/hub.pages.table_of_contents') }}">
                    <p class="doc-share-toc__title">{{ __('documentation::filament/hub.pages.table_of_contents') }}</p>
                    <ul>
                        @foreach ($tableOfContents as $item)
                            <li style="padding-left: {{ max(0, ($item['level'] - 2)) * 0.75 }}rem">
                                <a href="#{{ $item['id'] }}">{{ $item['text'] }}</a>
                            </li>
                        @endforeach
                    </ul>
                </nav>
            @endif

            <div class="doc-share-content">
                {!! $renderedContent !!}
            </div>
        </article>
    @endif
</div>
