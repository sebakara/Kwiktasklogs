<?php

namespace Webkul\Documentation\Enums;

enum DocumentationAuditAction: string
{
    case Created = 'created';
    case Updated = 'updated';
    case Published = 'published';
    case Unpublished = 'unpublished';
    case Archived = 'archived';
    case Deleted = 'deleted';
    case Restored = 'restored';
    case Viewed = 'viewed';
    case Shared = 'shared';
    case ShareRevoked = 'share_revoked';
    case PermissionChanged = 'permission_changed';
    case VersionRestored = 'version_restored';
    case VersionCreated = 'version_created';
}
