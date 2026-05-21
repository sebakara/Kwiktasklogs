<?php

namespace Webkul\Documentation\Enums;

enum DocumentationHubRole: string
{
    case SuperAdmin = 'super_admin';
    case Admin = 'admin';
    case Editor = 'editor';
    case Viewer = 'viewer';
    case PublicLink = 'public_link';
}
