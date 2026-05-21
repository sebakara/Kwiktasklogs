<x-documentation::filament.hub.layout>
    <div class="mb-2">
        <a
            href="{{ \Webkul\Documentation\Filament\Pages\ListSpaces::getUrl() }}"
            class="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
        >
            <x-filament::icon icon="heroicon-o-arrow-left" class="h-4 w-4" />
            {{ __('documentation::filament/hub.spaces.back_to_list') }}
        </a>
    </div>

    <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm dark:border-gray-700 dark:bg-gray-900">
        <div class="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div class="flex min-w-0 items-start gap-3">
                <span
                    class="mt-1 h-4 w-4 shrink-0 rounded-full"
                    style="background-color: {{ $space->color ?? '#3b82f6' }}"
                ></span>
                <div class="min-w-0">
                    <div class="flex flex-wrap items-center gap-2">
                        <h2 class="text-xl font-semibold text-gray-950 dark:text-white">{{ $space->name }}</h2>
                        @if (! $space->is_active)
                            <span class="rounded bg-warning-50 px-2 py-0.5 text-xs font-medium text-warning-700 dark:bg-warning-500/10 dark:text-warning-400">
                                {{ __('documentation::filament/hub.labels.archived') }}
                            </span>
                        @else
                            <span class="rounded bg-success-50 px-2 py-0.5 text-xs font-medium text-success-700 dark:bg-success-500/10 dark:text-success-400">
                                {{ __('documentation::filament/hub.labels.active') }}
                            </span>
                        @endif
                    </div>
                    <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">{{ $space->description ?: '—' }}</p>
                    <dl class="mt-4 grid gap-2 text-sm sm:grid-cols-2">
                        <div>
                            <dt class="text-xs font-medium uppercase tracking-wide text-gray-400">{{ __('documentation::filament/hub.spaces.details.slug') }}</dt>
                            <dd class="text-gray-700 dark:text-gray-300">{{ $space->slug }}</dd>
                        </div>
                        <div>
                            <dt class="text-xs font-medium uppercase tracking-wide text-gray-400">{{ __('documentation::filament/hub.spaces.details.visibility') }}</dt>
                            <dd class="text-gray-700 dark:text-gray-300">{{ ucfirst($space->visibility?->value ?? $space->visibility ?? '') }}</dd>
                        </div>
                        <div>
                            <dt class="text-xs font-medium uppercase tracking-wide text-gray-400">{{ __('documentation::filament/hub.spaces.details.pages') }}</dt>
                            <dd class="text-gray-700 dark:text-gray-300">{{ $space->pages_count }}</dd>
                        </div>
                        @if ($space->creator)
                            <div>
                                <dt class="text-xs font-medium uppercase tracking-wide text-gray-400">{{ __('documentation::filament/hub.spaces.details.creator') }}</dt>
                                <dd class="text-gray-700 dark:text-gray-300">{{ $space->creator->name }}</dd>
                            </div>
                        @endif
                    </dl>
                </div>
            </div>

            <div class="flex flex-wrap gap-2">
                @if ($editUrl = $this->editSpaceUrl())
                    <a
                        href="{{ $editUrl }}"
                        class="inline-flex items-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-200 dark:hover:bg-gray-800"
                    >
                        {{ __('documentation::filament/hub.spaces.edit') }}
                    </a>
                @endif
                @if ($createPageUrl = $this->createPageUrl())
                    <a
                        href="{{ $createPageUrl }}"
                        class="inline-flex items-center rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-500"
                    >
                        {{ __('documentation::filament/hub.spaces.create_page') }}
                    </a>
                @endif
                @if ($canEdit)
                    @if ($space->is_active)
                        <button
                            type="button"
                            wire:click="archiveSpace({{ $space->id }})"
                            wire:confirm="{{ __('documentation::filament/hub.spaces.confirm_archive') }}"
                            class="inline-flex items-center rounded-lg px-4 py-2 text-sm font-medium text-warning-700 hover:bg-warning-50 dark:text-warning-400 dark:hover:bg-warning-500/10"
                        >
                            {{ __('documentation::filament/hub.spaces.archive') }}
                        </button>
                    @else
                        <button
                            type="button"
                            wire:click="restoreSpace({{ $space->id }})"
                            class="inline-flex items-center rounded-lg px-4 py-2 text-sm font-medium text-success-700 hover:bg-success-50 dark:text-success-400 dark:hover:bg-success-500/10"
                        >
                            {{ __('documentation::filament/hub.spaces.restore') }}
                        </button>
                    @endif
                @endif
                @if ($canDelete)
                    <button
                        type="button"
                        wire:click="deleteSpace({{ $space->id }})"
                        wire:confirm="{{ __('documentation::filament/hub.spaces.confirm_delete') }}"
                        class="inline-flex items-center rounded-lg px-4 py-2 text-sm font-medium text-danger-700 hover:bg-danger-50 dark:text-danger-400 dark:hover:bg-danger-500/10"
                    >
                        {{ __('documentation::filament/hub.spaces.delete') }}
                    </button>
                @endif
            </div>
        </div>
    </div>

    <section class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm dark:border-gray-700 dark:bg-gray-900">
        <h2 class="mb-4 text-base font-semibold text-gray-950 dark:text-white">
            {{ __('documentation::filament/hub.spaces.page_tree') }}
        </h2>
        @include('documentation::filament.hub.partials.page-tree', ['nodes' => $pageTree, 'spaceId' => $space->id])
    </section>
</x-documentation::filament.hub.layout>
