<x-documentation::filament.hub.layout>
    <div class="mb-4">
        <a href="{{ $this->pageUrl() }}" class="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
            <x-filament::icon icon="heroicon-o-arrow-left" class="h-4 w-4" />
            {{ __('documentation::filament/hub.pages.back_to_page') }}
        </a>
    </div>

    <section class="rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900">
        @if (count($versions) > 0)
            <div class="divide-y divide-gray-100 dark:divide-gray-800">
                @foreach ($versions as $version)
                    <div class="flex flex-wrap items-start justify-between gap-3 px-5 py-4">
                        <div class="min-w-0 flex-1">
                            <div class="flex flex-wrap items-center gap-2">
                                <p class="font-medium text-gray-950 dark:text-white">
                                    {{ __('documentation::filament/hub.pages.version_label', ['number' => $version['version_number']]) }}
                                    — {{ $version['title'] }}
                                </p>
                                @if ($version['is_current'])
                                    <span class="rounded bg-primary-50 px-2 py-0.5 text-xs font-medium text-primary-700 dark:bg-primary-500/10 dark:text-primary-400">
                                        {{ __('documentation::filament/hub.versions.current') }}
                                    </span>
                                @endif
                            </div>
                            @if ($version['change_note'])
                                <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">{{ $version['change_note'] }}</p>
                            @endif
                            <p class="mt-1 text-xs text-gray-400">
                                {{ $version['creator_name'] ?? '—' }} · {{ $version['created_at'] }}
                            </p>
                        </div>
                        <div class="flex shrink-0 flex-wrap gap-2">
                            <a
                                href="{{ $version['view_url'] }}"
                                class="inline-flex items-center rounded-lg border border-gray-300 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-200 dark:hover:bg-gray-800"
                            >
                                {{ __('documentation::filament/hub.versions.view') }}
                            </a>
                            @if ($version['can_restore'])
                                <button
                                    type="button"
                                    wire:click="restoreVersion({{ $version['id'] }})"
                                    wire:confirm="{{ __('documentation::filament/hub.versions.confirm_restore') }}"
                                    class="inline-flex items-center rounded-lg bg-primary-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-primary-500"
                                >
                                    {{ __('documentation::filament/hub.versions.restore') }}
                                </button>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        @else
            <x-documentation::filament.hub.empty-state
                icon="heroicon-o-clock"
                :description="__('documentation::filament/hub.pages.no_versions')"
                class="border-0 bg-transparent dark:bg-transparent"
            />
        @endif
    </section>
</x-documentation::filament.hub.layout>
