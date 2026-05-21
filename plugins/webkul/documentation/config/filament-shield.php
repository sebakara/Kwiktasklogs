<?php

use Webkul\Documentation\Filament\Pages\CreateSpace;
use Webkul\Documentation\Filament\Pages\EditPage;
use Webkul\Documentation\Filament\Pages\EditSpace;
use Webkul\Documentation\Filament\Pages\HubDashboard;
use Webkul\Documentation\Filament\Pages\ListSpaces;
use Webkul\Documentation\Filament\Pages\ManageAuditLogs;
use Webkul\Documentation\Filament\Pages\ManagePermissions;
use Webkul\Documentation\Filament\Pages\ManageTemplates;
use Webkul\Documentation\Filament\Pages\PageVersions;
use Webkul\Documentation\Filament\Pages\ViewPage;
use Webkul\Documentation\Filament\Pages\ViewPageVersion;
use Webkul\Documentation\Filament\Pages\ViewSpace;

$basic = ['view_any', 'view', 'create', 'update'];
$delete = ['delete', 'delete_any'];
$forceDelete = ['force_delete', 'force_delete_any'];
$restore = ['restore', 'restore_any'];

return [
    'resources' => [
        'manage'  => [],
        'exclude' => [],
    ],

    'pages' => [
        'exclude' => [
            HubDashboard::class,
            ListSpaces::class,
            CreateSpace::class,
            EditSpace::class,
            ViewSpace::class,
            ViewPage::class,
            EditPage::class,
            PageVersions::class,
            ViewPageVersion::class,
            ManageTemplates::class,
            ManagePermissions::class,
            ManageAuditLogs::class,
        ],
    ],

    'custom_permissions' => [
        'documentation_hub' => [
            'super_admin',
            'manage',
            'editor',
            'viewer',
        ],
    ],
];
