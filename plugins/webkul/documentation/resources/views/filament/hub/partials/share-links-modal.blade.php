<div
    class="doc-share-modal"
    role="dialog"
    aria-modal="true"
    aria-labelledby="doc-share-modal-title"
    x-data
    x-on:keydown.escape.window="$wire.closeShareModal()"
>
    <div
        class="doc-share-modal-backdrop"
        wire:click="closeShareModal"
        aria-hidden="true"
    ></div>

    <div class="doc-share-modal-panel">
        <div class="doc-share-modal-header">
            <div>
                <h3 id="doc-share-modal-title" class="doc-share-modal-title">
                    {{ __('documentation::filament/hub.share.title') }}
                </h3>
                <p class="doc-share-modal-help">
                    {{ __('documentation::filament/hub.share.help') }}
                </p>
            </div>
            <button
                type="button"
                wire:click="closeShareModal"
                class="doc-share-modal-close"
                aria-label="{{ __('documentation::filament/hub.share.close') }}"
            >
                <x-filament::icon icon="heroicon-o-x-mark" class="h-5 w-5" />
            </button>
        </div>

        @if (! $this->record->is_published)
            <div class="doc-share-modal-notice" role="status">
                <x-filament::icon icon="heroicon-o-exclamation-triangle" class="h-5 w-5 shrink-0" />
                <p>{{ __('documentation::filament/hub.share.unpublished') }}</p>
            </div>
        @endif

        <form
            wire:submit="createShareLink"
            class="doc-share-modal-form"
            @if (! $this->record->is_published) aria-disabled="true" @endif
        >
            <h4 class="doc-share-modal-section-title">
                {{ __('documentation::filament/hub.share.create_heading') }}
            </h4>
            <div class="doc-share-modal-fields">
                <div>
                    <label class="doc-share-modal-label">
                        {{ __('documentation::filament/hub.share.fields.visibility') }}
                    </label>
                    <select
                        wire:model.live="shareVisibility"
                        class="doc-share-modal-input"
                        @disabled(! $this->record->is_published)
                    >
                        <option value="public">{{ __('documentation::filament/hub.share.visibility.public') }}</option>
                        <option value="restricted">{{ __('documentation::filament/hub.share.visibility.restricted') }}</option>
                    </select>
                </div>
                <div>
                    <label class="doc-share-modal-label">
                        {{ __('documentation::filament/hub.share.fields.expires_at') }}
                    </label>
                    <input
                        type="datetime-local"
                        wire:model="shareExpiresAt"
                        class="doc-share-modal-input"
                        @disabled(! $this->record->is_published)
                    />
                    @error('shareExpiresAt')
                        <p class="doc-share-modal-error">{{ $message }}</p>
                    @enderror
                </div>
                @if ($shareVisibility === 'restricted')
                    <div class="doc-share-modal-field-full">
                        <label class="doc-share-modal-label">
                            {{ __('documentation::filament/hub.share.fields.password') }}
                        </label>
                        <input
                            type="password"
                            wire:model="sharePassword"
                            class="doc-share-modal-input"
                            autocomplete="new-password"
                            @disabled(! $this->record->is_published)
                        />
                        @error('sharePassword')
                            <p class="doc-share-modal-error">{{ $message }}</p>
                        @enderror
                    </div>
                @endif
            </div>
            <button
                type="submit"
                class="doc-share-modal-submit"
                wire:loading.attr="disabled"
                wire:target="createShareLink"
                @disabled(! $this->record->is_published)
            >
                <x-filament::icon icon="heroicon-o-link" class="h-4 w-4" />
                <span wire:loading.remove wire:target="createShareLink">
                    {{ __('documentation::filament/hub.share.generate') }}
                </span>
                <span wire:loading wire:target="createShareLink">
                    {{ __('documentation::filament/hub.ui.loading') }}
                </span>
            </button>
        </form>

        <section class="doc-share-modal-existing">
            <h4 class="doc-share-modal-section-title">
                {{ __('documentation::filament/hub.share.existing_heading') }}
            </h4>
            @if (count($shareLinks) > 0)
                <div class="doc-share-modal-links">
                    @foreach ($shareLinks as $link)
                        <div @class([
                            'doc-share-modal-link-card',
                            'doc-share-modal-link-card--inactive' => ! $link['can_revoke'],
                        ])>
                            <div class="doc-share-modal-link-body">
                                <div class="doc-share-modal-link-badges">
                                    <span @class([
                                        'doc-share-modal-badge',
                                        'doc-share-modal-badge--active' => $link['can_revoke'],
                                        'doc-share-modal-badge--inactive' => ! $link['can_revoke'],
                                    ])>
                                        @if ($link['can_revoke'])
                                            {{ __('documentation::filament/hub.share.status.active') }}
                                        @elseif ($link['is_expired'])
                                            {{ __('documentation::filament/hub.share.status.expired') }}
                                        @else
                                            {{ __('documentation::filament/hub.share.status.revoked') }}
                                        @endif
                                    </span>
                                    <span class="doc-share-modal-badge doc-share-modal-badge--type">
                                        {{ $link['visibility'] === 'restricted' ? __('documentation::filament/hub.share.visibility.restricted') : __('documentation::filament/hub.share.visibility.public') }}
                                    </span>
                                </div>
                                @if ($link['can_revoke'])
                                    <div class="doc-share-modal-url-row">
                                        <input
                                            type="text"
                                            readonly
                                            value="{{ $link['url'] }}"
                                            class="doc-share-modal-url-input"
                                        />
                                        <button
                                            type="button"
                                            x-data
                                            x-on:click="navigator.clipboard.writeText(@js($link['url']))"
                                            class="doc-share-modal-copy"
                                        >
                                            {{ __('documentation::filament/hub.pages.copy_link') }}
                                        </button>
                                    </div>
                                @endif
                                <p class="doc-share-modal-link-meta">
                                    {{ __('documentation::filament/hub.share.meta', [
                                        'views' => $link['view_count'],
                                        'creator' => $link['creator_name'] ?? '—',
                                        'created' => $link['created_at'],
                                    ]) }}
                                    @if ($link['expires_at'])
                                        · {{ __('documentation::filament/hub.share.expires', ['date' => $link['expires_at']]) }}
                                    @endif
                                </p>
                            </div>
                            @if ($link['can_revoke'])
                                <button
                                    type="button"
                                    wire:click="revokeShareLink({{ $link['id'] }})"
                                    wire:confirm="{{ __('documentation::filament/hub.share.confirm_revoke') }}"
                                    class="doc-share-modal-revoke"
                                >
                                    {{ __('documentation::filament/hub.share.revoke') }}
                                </button>
                            @endif
                        </div>
                    @endforeach
                </div>
            @else
                <p class="doc-share-modal-empty">{{ __('documentation::filament/hub.share.empty') }}</p>
            @endif
        </section>
    </div>
</div>
