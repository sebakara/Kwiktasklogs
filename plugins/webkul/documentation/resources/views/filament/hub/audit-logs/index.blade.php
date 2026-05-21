<x-documentation::filament.hub.layout>
    <div class="mb-4 inline-flex flex-wrap gap-2 rounded-lg border border-gray-200 bg-gray-50 p-1 dark:border-gray-700 dark:bg-gray-800">
        @foreach ($this->filterOptions() as $key => $label)
            <button
                type="button"
                wire:click="setFilterAction('{{ $key }}')"
                @class([
                    'rounded-md px-3 py-1.5 text-sm font-medium transition',
                    'bg-white text-gray-950 shadow-sm dark:bg-gray-900 dark:text-white' => $filterAction === $key,
                    'text-gray-600 hover:text-gray-950 dark:text-gray-400 dark:hover:text-white' => $filterAction !== $key,
                ])
            >
                {{ $label }}
            </button>
        @endforeach
    </div>

    <section class="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900">
        @if (count($logs) > 0)
            <div class="divide-y divide-gray-100 dark:divide-gray-800">
                @foreach ($logs as $log)
                    <div class="px-5 py-4">
                        <div class="flex flex-wrap items-start justify-between gap-2">
                            <div>
                                <span class="inline-flex rounded bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-700 dark:bg-gray-800 dark:text-gray-300">
                                    {{ $log['action_label'] }}
                                </span>
                                @if ($log['detail'])
                                    <span class="ml-2 text-sm text-gray-500 dark:text-gray-400">{{ $log['detail'] }}</span>
                                @endif
                            </div>
                            <time class="shrink-0 text-xs text-gray-400" datetime="{{ $log['created_at'] }}">
                                {{ $log['created_human'] }}
                            </time>
                        </div>
                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-300">
                            <span class="font-medium">{{ $log['user_name'] }}</span>
                            @if ($log['page_title'])
                                · {{ __('documentation::filament/hub.audit.page') }}: {{ $log['page_title'] }}
                            @elseif ($log['space_name'])
                                · {{ __('documentation::filament/hub.audit.space') }}: {{ $log['space_name'] }}
                            @endif
                        </p>
                    </div>
                @endforeach
            </div>
        @else
            <x-documentation::filament.hub.empty-state
                icon="heroicon-o-clipboard-document-list"
                :description="__('documentation::filament/hub.audit.empty')"
                class="border-0 bg-transparent dark:bg-transparent"
            />
        @endif
    </section>
</x-documentation::filament.hub.layout>
