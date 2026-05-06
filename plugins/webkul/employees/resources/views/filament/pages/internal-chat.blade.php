@php
    $initialsFromName = static function (?string $name): string {
        $name = trim((string) $name);
        if ($name === '') {
            return '?';
        }

        $parts = preg_split('/\s+/u', $name, -1, PREG_SPLIT_NO_EMPTY) ?: [];

        if ($parts === []) {
            return mb_strtoupper(mb_substr($name, 0, 1));
        }

        $first = mb_strtoupper(mb_substr($parts[0], 0, 1));
        $second = isset($parts[1]) ? mb_strtoupper(mb_substr($parts[1], 0, 1)) : '';

        return $first.$second;
    };
@endphp

<x-filament-panels::page>
    <div
        class="mx-auto max-w-6xl overflow-hidden rounded-2xl bg-white shadow-xl ring-1 ring-gray-950/5 dark:bg-gray-900 dark:ring-white/10"
        wire:poll.10s
    >
        <div class="grid min-h-[32rem] max-h-[min(42rem,calc(100vh-10rem))] gap-0 md:grid-cols-12">
            {{-- Sidebar: contacts & picker --}}
            <aside class="flex flex-col border-b border-gray-200/80 bg-gradient-to-b from-primary-600/[0.06] via-white to-white dark:border-white/10 dark:from-primary-400/[0.08] dark:via-gray-900 dark:to-gray-900 md:col-span-4 md:border-b-0 md:border-e md:border-gray-200/80 dark:md:border-white/10">
                <div class="shrink-0 border-b border-gray-200/60 px-4 py-5 dark:border-white/10">
                    <div class="flex items-start gap-3">
                        <div class="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-primary-600 text-white shadow-md shadow-primary-600/25 ring-4 ring-white/50 dark:bg-primary-500 dark:ring-primary-950/40">
                            <x-filament::icon icon="heroicon-o-chat-bubble-left-right" class="h-6 w-6" />
                        </div>
                        <div class="min-w-0 pt-0.5">
                            <p class="text-[0.65rem] font-semibold uppercase tracking-wider text-primary-700 dark:text-primary-400">
                                {{ __('employees::filament/pages/internal-chat.sidebar.badge') }}
                            </p>
                            <p class="text-sm text-gray-600 dark:text-gray-400">
                                {{ __('employees::filament/pages/internal-chat.sidebar.hint') }}
                            </p>
                        </div>
                    </div>
                </div>

                <div class="flex min-h-0 flex-1 flex-col gap-4 overflow-hidden p-4">
                    <div class="shrink-0 space-y-1.5">
                        <label class="fi-fo-field-label flex items-center gap-2 text-sm font-medium text-gray-700 dark:text-gray-200" for="internal-chat-recipient">
                            <x-filament::icon icon="heroicon-m-user-plus" class="h-4 w-4 text-primary-600 dark:text-primary-400" />
                            {{ __('employees::filament/pages/internal-chat.fields.recipient') }}
                        </label>
                        <div class="relative">
                            <select
                                id="internal-chat-recipient"
                                wire:model.live="selectedPeerId"
                                class="fi-select-input block w-full cursor-pointer appearance-none rounded-xl border-0 bg-white/90 py-2.5 ps-3 pe-10 text-sm font-medium text-gray-950 shadow-inner ring-1 ring-gray-950/10 transition focus:ring-2 focus:ring-primary-600 dark:bg-white/5 dark:text-white dark:ring-white/10 dark:focus:ring-primary-500"
                            >
                                <option value="">{{ __('employees::filament/pages/internal-chat.placeholders.choose_recipient') }}</option>
                                @foreach ($recipientOptions as $id => $label)
                                    <option value="{{ $id }}">{{ $label }}</option>
                                @endforeach
                            </select>
                            <span class="pointer-events-none absolute end-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">
                                <x-filament::icon icon="heroicon-m-chevron-down" class="h-4 w-4" />
                            </span>
                        </div>
                    </div>

                    <div class="flex min-h-0 flex-1 flex-col">
                        <p class="mb-2 flex shrink-0 items-center gap-2 text-xs font-semibold uppercase tracking-wide text-gray-500 dark:text-gray-400">
                            <x-filament::icon icon="heroicon-m-clock" class="h-3.5 w-3.5" />
                            {{ __('employees::filament/pages/internal-chat.recent') }}
                        </p>
                        <ul class="min-h-0 flex-1 space-y-1 overflow-y-auto pe-0.5 [-ms-overflow-style:none] [scrollbar-width:thin] [&::-webkit-scrollbar]:w-1.5 [&::-webkit-scrollbar-thumb]:rounded-full [&::-webkit-scrollbar-thumb]:bg-gray-300/80 dark:[&::-webkit-scrollbar-thumb]:bg-white/20">
                            @forelse ($conversations as $peerId => $meta)
                                @php
                                    $peerName = $meta['peer']?->name ?? __('employees::filament/pages/internal-chat.unknown_user');
                                    $peerInitials = $initialsFromName($peerName);
                                    $isActive = (int) $selectedPeerId === (int) $peerId;
                                @endphp
                                <li>
                                    <button
                                        type="button"
                                        wire:click="$set('selectedPeerId', {{ $peerId }})"
                                        @class([
                                            'group flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-start transition duration-150',
                                            'bg-primary-600 text-white shadow-md shadow-primary-600/25 ring-1 ring-primary-600/20 dark:bg-primary-500 dark:ring-white/10' => $isActive,
                                            'text-gray-800 hover:bg-white/70 hover:shadow-sm hover:ring-1 hover:ring-gray-950/5 dark:text-gray-100 dark:hover:bg-white/10 dark:hover:ring-white/10' => ! $isActive,
                                        ])
                                    >
                                        <span
                                            @class([
                                                'flex h-10 w-10 shrink-0 items-center justify-center rounded-full text-sm font-bold shadow-inner',
                                                'bg-white/20 text-white' => $isActive,
                                                'bg-gradient-to-br from-primary-100 to-primary-200 text-primary-800 dark:from-primary-900/80 dark:to-primary-800/40 dark:text-primary-100' => ! $isActive,
                                            ])
                                        >
                                            {{ $peerInitials }}
                                        </span>
                                        <span class="min-w-0 flex-1">
                                            <span @class([
                                                'block truncate text-sm font-semibold',
                                                'text-white' => $isActive,
                                            ])>
                                                {{ $peerName }}
                                            </span>
                                            @if (($meta['unread'] ?? 0) > 0 && ! $isActive)
                                                <span class="mt-0.5 inline-block text-[0.65rem] font-medium text-primary-600 dark:text-primary-400">
                                                    {{ trans_choice('employees::filament/pages/internal-chat.unread_line', $meta['unread']) }}
                                                </span>
                                            @endif
                                        </span>
                                        @if (($meta['unread'] ?? 0) > 0)
                                            <span
                                                @class([
                                                    'inline-flex min-h-6 min-w-6 shrink-0 items-center justify-center rounded-full px-1.5 text-xs font-bold tabular-nums',
                                                    'bg-white text-primary-700' => $isActive,
                                                    'bg-primary-600 text-white dark:bg-primary-500' => ! $isActive,
                                                ])
                                            >
                                                {{ $meta['unread'] }}
                                            </span>
                                        @endif
                                    </button>
                                </li>
                            @empty
                                <li class="rounded-xl border border-dashed border-gray-300/80 bg-gray-50/50 px-4 py-8 text-center text-sm text-gray-500 dark:border-white/15 dark:bg-white/[0.03] dark:text-gray-400">
                                    <x-filament::icon icon="heroicon-o-inbox" class="mx-auto mb-2 h-8 w-8 text-gray-400 dark:text-gray-500" />
                                    {{ __('employees::filament/pages/internal-chat.empty_conversations') }}
                                </li>
                            @endforelse
                        </ul>
                    </div>
                </div>
            </aside>

            {{-- Main thread: same chrome with or without a selected peer --}}
            @php
                $hasSelectedPeer = $selectedPeerId && $selectedPeer;
            @endphp
            <section class="flex min-h-0 flex-col bg-gradient-to-b from-gray-50 to-white dark:from-gray-950 dark:to-gray-900 md:col-span-8">
                <header class="shrink-0 border-b border-gray-200/80 bg-white/80 px-5 py-4 backdrop-blur-sm dark:border-white/10 dark:bg-gray-900/80">
                    @if ($hasSelectedPeer)
                        @php
                            $headerInitials = $initialsFromName($selectedPeer->name);
                        @endphp
                        <div class="flex items-center gap-4">
                            <span class="relative flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl bg-gradient-to-br from-primary-500 to-primary-700 text-lg font-bold text-white shadow-lg shadow-primary-600/30 ring-2 ring-white dark:ring-gray-800">
                                {{ $headerInitials }}
                                <span class="pointer-events-none absolute -bottom-0.5 -end-0.5 h-3.5 w-3.5 rounded-full border-2 border-white bg-emerald-500 shadow-sm dark:border-gray-900" aria-hidden="true"></span>
                            </span>
                            <div class="min-w-0 flex-1">
                                <h2 class="truncate text-lg font-semibold text-gray-950 dark:text-white">
                                    {{ $selectedPeer->name }}
                                </h2>
                                <p class="flex items-center gap-1.5 truncate text-sm text-gray-500 dark:text-gray-400">
                                    <x-filament::icon icon="heroicon-m-envelope" class="h-3.5 w-3.5 shrink-0 opacity-70" />
                                    {{ $selectedPeer->email }}
                                </p>
                            </div>
                        </div>
                    @else
                        <div class="flex items-center gap-4">
                            <span class="flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl bg-gray-200/90 text-gray-500 ring-2 ring-white dark:bg-white/10 dark:text-gray-400 dark:ring-gray-800" aria-hidden="true">
                                <x-filament::icon icon="heroicon-o-user" class="h-6 w-6" />
                            </span>
                            <div class="min-w-0 flex-1">
                                <h2 class="truncate text-lg font-semibold text-gray-700 dark:text-gray-200">
                                    {{ __('employees::filament/pages/internal-chat.no_peer_selected.heading') }}
                                </h2>
                                <p class="truncate text-sm text-gray-500 dark:text-gray-400">
                                    {{ __('employees::filament/pages/internal-chat.no_peer_selected.subheading') }}
                                </p>
                            </div>
                        </div>
                    @endif
                </header>

                <div class="min-h-0 flex-1 overflow-y-auto px-4 py-4 pe-2 [-ms-overflow-style:none] [scrollbar-width:thin] [&::-webkit-scrollbar]:w-1.5 [&::-webkit-scrollbar-thumb]:rounded-full [&::-webkit-scrollbar-thumb]:bg-gray-300/80 dark:[&::-webkit-scrollbar-thumb]:bg-white/20">
                    @if ($hasSelectedPeer)
                        <div class="space-y-3">
                            @foreach ($thread as $message)
                                @php
                                    $isMine = (int) $message->sender_id === (int) auth()->id();
                                @endphp
                                <div
                                    wire:key="internal-chat-msg-{{ $message->getKey() }}"
                                    @class(['flex gap-2', 'flex-row-reverse' => $isMine])
                                >
                                    <div
                                        class="mt-0.5 flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-[0.65rem] font-bold shadow-sm ring-1 ring-gray-950/5 dark:ring-white/10"
                                        @class([
                                            'bg-primary-100 text-primary-800 dark:bg-primary-900/60 dark:text-primary-200' => $isMine,
                                            'bg-gray-200 text-gray-700 dark:bg-gray-700 dark:text-gray-100' => ! $isMine,
                                        ])
                                    >
                                        {{ $initialsFromName($isMine ? auth()->user()?->name : $selectedPeer->name) }}
                                    </div>
                                    <div class="max-w-[min(100%,28rem)]">
                                        <div
                                            @class([
                                                'rounded-2xl rounded-ee-md px-4 py-2.5 text-sm leading-relaxed shadow-sm ring-1',
                                                'bg-primary-600 text-white ring-primary-700/20 dark:bg-primary-500 dark:ring-white/10' => $isMine,
                                                'rounded-ee-2xl rounded-es-md bg-white text-gray-900 ring-gray-950/10 dark:bg-gray-800 dark:text-gray-50 dark:ring-white/10' => ! $isMine,
                                            ])
                                        >
                                            <p class="whitespace-pre-wrap break-words">{{ $message->body }}</p>
                                        </div>
                                        <p
                                            @class([
                                                'mt-1 px-1 text-[0.7rem] font-medium tabular-nums text-gray-500 dark:text-gray-400',
                                                'text-end' => $isMine,
                                            ])
                                        >
                                            {{ $message->created_at?->timezone(config('app.timezone'))->format(__('employees::filament/pages/internal-chat.datetime_format')) }}
                                        </p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <div class="flex h-full min-h-[12rem] flex-col items-center justify-center gap-4 rounded-2xl border border-dashed border-gray-300/90 bg-white/60 px-6 py-10 text-center dark:border-white/15 dark:bg-white/[0.04]">
                            <div class="flex h-16 w-16 items-center justify-center rounded-2xl bg-primary-500/10 text-primary-600 dark:bg-primary-400/10 dark:text-primary-400">
                                <x-filament::icon icon="heroicon-o-chat-bubble-left-right" class="h-9 w-9" />
                            </div>
                            <div class="max-w-sm space-y-2">
                                <p class="text-sm font-semibold text-gray-800 dark:text-gray-100">
                                    {{ __('employees::filament/pages/internal-chat.no_peer_selected.thread_hint_title') }}
                                </p>
                                <p class="text-sm leading-relaxed text-gray-500 dark:text-gray-400">
                                    {{ __('employees::filament/pages/internal-chat.intro') }}
                                </p>
                            </div>
                        </div>
                    @endif
                </div>

                <form wire:submit="send" class="shrink-0 border-t border-gray-200/80 bg-white/90 p-4 backdrop-blur-md dark:border-white/10 dark:bg-gray-900/90">
                    <label class="sr-only" for="internal-chat-compose">{{ __('employees::filament/pages/internal-chat.fields.message') }}</label>
                    <div @class([
                        'overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm ring-1 ring-gray-950/5 dark:border-white/10 dark:bg-white/5',
                        'opacity-[0.88] shadow-none ring-gray-950/5 dark:ring-white/10' => ! $hasSelectedPeer,
                    ])>
                        <textarea
                            id="internal-chat-compose"
                            wire:model="composeBody"
                            rows="3"
                            @disabled(! $hasSelectedPeer)
                            class="block w-full resize-none border-0 bg-transparent px-4 py-3 text-sm text-gray-950 placeholder:text-gray-400 focus:ring-0 disabled:cursor-not-allowed disabled:opacity-60 dark:text-white dark:placeholder:text-gray-500"
                            placeholder="{{ $hasSelectedPeer ? __('employees::filament/pages/internal-chat.placeholders.message') : __('employees::filament/pages/internal-chat.no_peer_selected.composer_locked') }}"
                        ></textarea>
                        <div class="flex flex-wrap items-center justify-end gap-2 border-t border-gray-100 bg-gray-50/80 px-3 py-2 dark:border-white/5 dark:bg-white/[0.04]">
                            @error('composeBody')
                                <p class="me-auto max-w-[60%] truncate text-xs text-danger-600 dark:text-danger-400">{{ $message }}</p>
                            @enderror
                            @error('selectedPeerId')
                                <p class="me-auto max-w-[60%] truncate text-xs text-danger-600 dark:text-danger-400">{{ $message }}</p>
                            @enderror
                            <x-filament::button
                                type="submit"
                                size="sm"
                                icon="heroicon-m-paper-airplane"
                                :disabled="! $hasSelectedPeer"
                            >
                                {{ __('employees::filament/pages/internal-chat.actions.send') }}
                            </x-filament::button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</x-filament-panels::page>
