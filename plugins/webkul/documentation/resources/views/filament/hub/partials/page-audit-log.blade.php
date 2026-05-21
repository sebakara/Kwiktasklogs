@props(['logs' => [], 'showEmpty' => false])

@if (count($logs) > 0)
    <section class="doc-portal-audit">
        <h2 class="doc-portal-audit-title">
            <x-filament::icon icon="heroicon-o-clipboard-document-list" class="h-4 w-4" />
            {{ __('documentation::filament/hub.audit.page_activity') }}
        </h2>
        <ul class="doc-portal-audit-list">
            @foreach ($logs as $log)
                <li class="doc-portal-audit-item">
                    <div class="doc-portal-audit-body">
                        <span class="doc-portal-audit-action">{{ $log['action_label'] }}</span>
                        <p class="doc-portal-audit-detail">
                            {{ $log['user_name'] }}
                            @if ($log['detail'])
                                <span class="doc-portal-audit-sep">·</span>{{ $log['detail'] }}
                            @endif
                        </p>
                    </div>
                    <time class="doc-portal-audit-time">{{ $log['created_human'] }}</time>
                </li>
            @endforeach
        </ul>
    </section>
@elseif ($showEmpty)
    <section class="doc-portal-audit doc-portal-audit--empty">
        <x-filament::icon icon="heroicon-o-clipboard-document-list" class="doc-portal-audit-empty-icon" />
        <p class="doc-portal-audit-empty-title">{{ __('documentation::filament/hub.audit.page_activity') }}</p>
        <p class="doc-portal-audit-empty-desc">{{ __('documentation::filament/hub.audit.empty_page') }}</p>
    </section>
@endif
