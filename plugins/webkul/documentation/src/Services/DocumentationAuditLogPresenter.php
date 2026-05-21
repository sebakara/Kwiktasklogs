<?php

namespace Webkul\Documentation\Services;

use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Models\DocumentationAuditLog;

class DocumentationAuditLogPresenter
{
    public function label(DocumentationAuditAction $action): string
    {
        return match ($action) {
            DocumentationAuditAction::Created            => __('documentation::filament/hub.audit.actions.created'),
            DocumentationAuditAction::Updated            => __('documentation::filament/hub.audit.actions.updated'),
            DocumentationAuditAction::Published          => __('documentation::filament/hub.audit.actions.published'),
            DocumentationAuditAction::Unpublished        => __('documentation::filament/hub.audit.actions.unpublished'),
            DocumentationAuditAction::Archived           => __('documentation::filament/hub.audit.actions.archived'),
            DocumentationAuditAction::Deleted            => __('documentation::filament/hub.audit.actions.deleted'),
            DocumentationAuditAction::Restored           => __('documentation::filament/hub.audit.actions.restored'),
            DocumentationAuditAction::Viewed             => __('documentation::filament/hub.audit.actions.viewed'),
            DocumentationAuditAction::Shared             => __('documentation::filament/hub.audit.actions.shared'),
            DocumentationAuditAction::ShareRevoked       => __('documentation::filament/hub.audit.actions.share_revoked'),
            DocumentationAuditAction::PermissionChanged  => __('documentation::filament/hub.audit.actions.permission_changed'),
            DocumentationAuditAction::VersionCreated     => __('documentation::filament/hub.audit.actions.version_created'),
            DocumentationAuditAction::VersionRestored    => __('documentation::filament/hub.audit.actions.version_restored'),
        };
    }

    /**
     * @return array<string, mixed>
     */
    public function format(DocumentationAuditLog $log): array
    {
        $metadata = $log->metadata ?? [];

        return [
            'id'           => $log->id,
            'action'       => $log->action?->value ?? $log->action,
            'action_label' => $log->action ? $this->label($log->action) : '—',
            'user_name'    => $log->user?->name ?? __('documentation::filament/hub.audit.system'),
            'page_title'   => $log->page?->title,
            'space_name'   => $log->space?->name,
            'metadata'     => $metadata,
            'detail'       => $this->detail($log, $metadata),
            'created_at'   => $log->created_at?->toDayDateTimeString(),
            'created_human'=> $log->created_at?->diffForHumans(),
        ];
    }

    /**
     * @param  array<string, mixed>  $metadata
     */
    protected function detail(DocumentationAuditLog $log, array $metadata): ?string
    {
        return match ($log->action) {
            DocumentationAuditAction::PermissionChanged => isset($metadata['action'])
                ? ucfirst((string) $metadata['action'])
                : null,
            DocumentationAuditAction::Shared,
            DocumentationAuditAction::ShareRevoked => isset($metadata['share_link_id'])
                ? '#'.$metadata['share_link_id']
                : null,
            DocumentationAuditAction::VersionCreated,
            DocumentationAuditAction::VersionRestored => isset($metadata['version_number'])
                ? __('documentation::filament/hub.audit.version_number', ['number' => $metadata['version_number']])
                : null,
            default => null,
        };
    }
}
