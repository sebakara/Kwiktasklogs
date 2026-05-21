<x-documentation::filament.hub.layout>
    <div class="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-800">
            <thead class="bg-gray-50 dark:bg-gray-800/50">
                <tr>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.templates.columns.name') }}</th>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.templates.columns.module') }}</th>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.templates.columns.status') }}</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                @forelse ($templates as $template)
                    <tr>
                        <td class="px-4 py-3">
                            <p class="font-medium text-gray-950 dark:text-white">{{ $template['name'] }}</p>
                            <p class="text-sm text-gray-500">{{ $template['description'] }}</p>
                        </td>
                        <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-300">{{ $template['module'] ?? '—' }}</td>
                        <td class="px-4 py-3 text-sm">
                            @if ($template['is_active'])
                                <span class="text-success-600">{{ __('documentation::filament/hub.labels.active') }}</span>
                            @else
                                <span class="text-gray-400">{{ __('documentation::filament/hub.labels.inactive') }}</span>
                            @endif
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="px-4 py-6 text-center text-sm text-gray-500">
                            {{ __('documentation::filament/hub.templates.empty') }}
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-documentation::filament.hub.layout>
