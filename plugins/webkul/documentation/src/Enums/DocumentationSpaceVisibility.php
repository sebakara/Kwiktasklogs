<?php

namespace Webkul\Documentation\Enums;

enum DocumentationSpaceVisibility: string
{
    case Private = 'private';
    case Internal = 'internal';
    case Public = 'public';
}
