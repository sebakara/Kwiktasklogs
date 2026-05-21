<x-documentation::filament.hub.layout>
    <form wire:submit="save" class="fi-form space-y-6">
        <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm dark:border-gray-700 dark:bg-gray-900">
            {{ $this->spaceForm }}
        </div>

        <div class="flex flex-wrap items-center gap-3">
            <x-filament::button type="submit" color="primary">
                {{ __('documentation::filament/hub.spaces.save') }}
            </x-filament::button>
            <a
                href="{{ $this->cancelUrl() }}"
                class="text-sm font-medium text-gray-600 hover:underline dark:text-gray-300"
            >
                {{ __('documentation::filament/hub.spaces.cancel') }}
            </a>
        </div>
    </form>

    @if (isset($this->record))
        <section class="rounded-xl border border-danger-200 bg-danger-50/50 p-5 dark:border-danger-500/30 dark:bg-danger-500/5">
            <h3 class="text-sm font-semibold text-danger-800 dark:text-danger-400">
                {{ __('documentation::filament/hub.spaces.danger_zone') }}
            </h3>
            <p class="mt-1 text-sm text-danger-700/80 dark:text-danger-400/80">
                {{ __('documentation::filament/hub.spaces.danger_zone_help') }}
            </p>
            <div class="mt-4 flex flex-wrap gap-2">
                @if ($this->record->is_active)
                    <x-filament::button
                        type="button"
                        color="warning"
                        wire:click="archiveSpace({{ $this->record->id }})"
                        wire:confirm="{{ __('documentation::filament/hub.spaces.confirm_archive') }}"
                    >
                        {{ __('documentation::filament/hub.spaces.archive') }}
                    </x-filament::button>
                @else
                    <x-filament::button
                        type="button"
                        color="success"
                        wire:click="restoreSpace({{ $this->record->id }})"
                    >
                        {{ __('documentation::filament/hub.spaces.restore') }}
                    </x-filament::button>
                @endif
                <x-filament::button
                    type="button"
                    color="danger"
                    wire:click="deleteSpace({{ $this->record->id }})"
                    wire:confirm="{{ __('documentation::filament/hub.spaces.confirm_delete') }}"
                >
                    {{ __('documentation::filament/hub.spaces.delete') }}
                </x-filament::button>
            </div>
        </section>
    @endif
</x-documentation::filament.hub.layout>
