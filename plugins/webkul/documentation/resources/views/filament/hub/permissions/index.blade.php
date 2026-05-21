@php
    $hubAccess = $this->hubAccessFlags();
@endphp

<x-documentation::filament.hub.layout>
    <div class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div class="inline-flex rounded-lg border border-gray-200 bg-gray-50 p-1 dark:border-gray-700 dark:bg-gray-800">
            @foreach (['all' => __('documentation::filament/hub.permissions.filters.all'), 'space' => __('documentation::filament/hub.permissions.filters.spaces'), 'page' => __('documentation::filament/hub.permissions.filters.pages')] as $key => $label)
                <button
                    type="button"
                    wire:click="$set('filterTarget', '{{ $key }}')"
                    @class([
                        'rounded-md px-3 py-1.5 text-sm font-medium transition',
                        'bg-white text-gray-950 shadow-sm dark:bg-gray-900 dark:text-white' => $filterTarget === $key,
                        'text-gray-600 hover:text-gray-950 dark:text-gray-400 dark:hover:text-white' => $filterTarget !== $key,
                    ])
                >
                    {{ $label }}
                </button>
            @endforeach
        </div>

        <button
            type="button"
            wire:click="openCreateForm"
            class="inline-flex items-center justify-center gap-2 rounded-lg bg-primary-600 px-4 py-2.5 text-sm font-medium text-white shadow-sm hover:bg-primary-500"
        >
            <x-filament::icon icon="heroicon-o-plus" class="h-4 w-4" />
            {{ __('documentation::filament/hub.permissions.assign') }}
        </button>
    </div>

    @if ($showForm)
        <section class="mb-6 rounded-xl border border-primary-200 bg-primary-50/30 p-5 dark:border-primary-500/30 dark:bg-primary-500/5">
            <h3 class="mb-4 text-base font-semibold text-gray-950 dark:text-white">
                {{ __('documentation::filament/hub.permissions.assign_title') }}
            </h3>
            <form wire:submit="savePermission" class="grid gap-4 md:grid-cols-2">
                <div>
                    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        {{ __('documentation::filament/hub.permissions.fields.target_type') }}
                    </label>
                    <select wire:model.live="permissionable_type" class="w-full rounded-lg border-gray-300 text-sm dark:border-gray-600 dark:bg-gray-900">
                        <option value="{{ \Webkul\Documentation\Models\DocumentationSpace::class }}">{{ __('documentation::filament/hub.permissions.target_types.space') }}</option>
                        <option value="{{ \Webkul\Documentation\Models\DocumentationPage::class }}">{{ __('documentation::filament/hub.permissions.target_types.page') }}</option>
                    </select>
                </div>

                <div>
                    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        {{ __('documentation::filament/hub.permissions.fields.target') }}
                    </label>
                    <select wire:model="permissionable_id" required class="w-full rounded-lg border-gray-300 text-sm dark:border-gray-600 dark:bg-gray-900">
                        <option value="">{{ __('documentation::filament/hub.permissions.fields.select_target') }}</option>
                        @if ($permissionable_type === \Webkul\Documentation\Models\DocumentationSpace::class)
                            @foreach ($spaceOptions as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        @else
                            @foreach ($pageOptions as $id => $title)
                                <option value="{{ $id }}">{{ $title }}</option>
                            @endforeach
                        @endif
                    </select>
                </div>

                <div>
                    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        {{ __('documentation::filament/hub.permissions.fields.permission') }}
                    </label>
                    <select wire:model="permission" class="w-full rounded-lg border-gray-300 text-sm dark:border-gray-600 dark:bg-gray-900">
                        @foreach ($this->permissionLevelOptions() as $value => $label)
                            <option value="{{ $value }}">{{ $label }}</option>
                        @endforeach
                    </select>
                </div>

                <div>
                    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        {{ __('documentation::filament/hub.permissions.fields.subject_type') }}
                    </label>
                    <select wire:model.live="subject_type" class="w-full rounded-lg border-gray-300 text-sm dark:border-gray-600 dark:bg-gray-900">
                        <option value="user">{{ __('documentation::filament/hub.permissions.subject_types.user') }}</option>
                        <option value="team">{{ __('documentation::filament/hub.permissions.subject_types.team') }}</option>
                        <option value="role">{{ __('documentation::filament/hub.permissions.subject_types.role') }}</option>
                    </select>
                </div>

                <div class="md:col-span-2">
                    <label class="mb-1 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        {{ __('documentation::filament/hub.permissions.fields.subject') }}
                    </label>
                    <select wire:model="subject_id" required class="w-full rounded-lg border-gray-300 text-sm dark:border-gray-600 dark:bg-gray-900">
                        <option value="">{{ __('documentation::filament/hub.permissions.fields.select_subject') }}</option>
                        @if ($subject_type === 'user')
                            @foreach ($userOptions as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        @elseif ($subject_type === 'team')
                            @foreach ($teamOptions as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        @else
                            @foreach ($roleOptions as $id => $name)
                                <option value="{{ $id }}">{{ $name }}</option>
                            @endforeach
                        @endif
                    </select>
                </div>

                <div class="flex gap-2 md:col-span-2">
                    <x-documentation::filament.hub.btn
                        type="submit"
                        variant="primary"
                        target="savePermission"
                        class="!py-2"
                    >
                        {{ __('documentation::filament/hub.permissions.save') }}
                    </x-documentation::filament.hub.btn>
                    <button type="button" wire:click="closeForm" class="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-200 dark:hover:bg-gray-800">
                        {{ __('documentation::filament/hub.permissions.cancel') }}
                    </button>
                </div>
            </form>
        </section>
    @endif

    <div class="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm dark:border-gray-700 dark:bg-gray-900">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-800">
            <thead class="bg-gray-50 dark:bg-gray-800/50">
                <tr>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.permissions.columns.permission') }}</th>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.permissions.columns.target') }}</th>
                    <th class="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.permissions.columns.subject') }}</th>
                    <th class="px-4 py-3 text-right text-xs font-medium uppercase text-gray-500">{{ __('documentation::filament/hub.permissions.columns.actions') }}</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                @forelse ($permissions as $permission)
                    <tr>
                        <td class="px-4 py-3 text-sm font-medium text-gray-950 dark:text-white">{{ $permission['permission'] }}</td>
                        <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-300">
                            <span class="font-medium">{{ $permission['permissionable_type'] }}</span>
                            @if ($permission['target_name'])
                                — {{ $permission['target_name'] }}
                            @else
                                #{{ $permission['permissionable_id'] }}
                            @endif
                        </td>
                        <td class="px-4 py-3 text-sm text-gray-600 dark:text-gray-300">
                            <span class="text-xs uppercase text-gray-400">{{ $permission['subject_type'] }}</span>
                            {{ $permission['subject_label'] }}
                        </td>
                        <td class="px-4 py-3 text-right">
                            <button
                                type="button"
                                wire:click="deletePermission({{ $permission['id'] }})"
                                wire:confirm="{{ __('documentation::filament/hub.permissions.confirm_delete') }}"
                                class="text-sm font-medium text-danger-600 hover:underline dark:text-danger-400"
                            >
                                {{ __('documentation::filament/hub.permissions.remove') }}
                            </button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4" class="px-4 py-8 text-center text-sm text-gray-500 dark:text-gray-400">
                            {{ __('documentation::filament/hub.permissions.empty') }}
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <p class="mt-4 text-sm text-gray-500 dark:text-gray-400">
        {{ __('documentation::filament/hub.permissions.help') }}
    </p>
</x-documentation::filament.hub.layout>
