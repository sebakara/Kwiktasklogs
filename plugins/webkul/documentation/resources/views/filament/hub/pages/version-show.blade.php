<x-documentation::filament.hub.layout>
    <div class="mb-4 flex flex-wrap items-center gap-2 text-sm">
        <a href="{{ $this->versionsUrl() }}" class="text-primary-600 hover:underline dark:text-primary-400">
            {{ __('documentation::filament/hub.versions.back_to_list') }}
        </a>
        <span class="text-gray-400">/</span>
        <a href="{{ $this->currentPageUrl() }}" class="text-gray-500 hover:underline dark:text-gray-400">
            {{ __('documentation::filament/hub.pages.back_to_page') }}
        </a>
    </div>

    <div class="mb-6 flex flex-wrap items-start justify-between gap-4">
        <div>
            <p class="text-sm font-medium text-primary-600 dark:text-primary-400">
                {{ __('documentation::filament/hub.pages.version_label', ['number' => $version->version_number]) }}
            </p>
            <h1 class="mt-1 text-2xl font-semibold text-gray-950 dark:text-white">{{ $version->title }}</h1>
            @if ($version->change_note)
                <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">{{ $version->change_note }}</p>
            @endif
            <p class="mt-2 text-xs text-gray-400">
                {{ $version->creator?->name }} · {{ $version->created_at?->toDayDateTimeString() }}
            </p>
        </div>
        @if ($this->canRestore())
            <button
                type="button"
                wire:click="restoreVersion"
                wire:confirm="{{ __('documentation::filament/hub.versions.confirm_restore') }}"
                class="inline-flex items-center gap-2 rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-500"
            >
                <x-filament::icon icon="heroicon-o-arrow-uturn-left" class="h-4 w-4" />
                {{ __('documentation::filament/hub.versions.restore') }}
            </button>
        @endif
    </div>

    @if ($version->summary)
        <p class="mb-4 text-base text-gray-600 dark:text-gray-300">{{ $version->summary }}</p>
    @endif

    <div class="grid gap-6 xl:grid-cols-4">
        @if (count($tableOfContents) > 0)
            <aside class="xl:col-span-1 xl:order-2">
                @include('documentation::filament.hub.partials.table-of-contents', ['items' => $tableOfContents])
            </aside>
        @endif

        <article @class([
            'prose prose-sm max-w-none rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:prose-invert dark:border-gray-700 dark:bg-gray-900',
            'xl:col-span-3' => count($tableOfContents) > 0,
            'xl:col-span-4' => count($tableOfContents) === 0,
        ])>
            {!! $renderedContent !!}
        </article>
    </div>
</x-documentation::filament.hub.layout>
