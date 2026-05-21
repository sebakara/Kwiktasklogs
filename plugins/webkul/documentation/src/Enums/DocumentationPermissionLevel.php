<?php

namespace Webkul\Documentation\Enums;

enum DocumentationPermissionLevel: string
{
    case View = 'view';
    case Comment = 'comment';
    case Edit = 'edit';
    case Manage = 'manage';
}
