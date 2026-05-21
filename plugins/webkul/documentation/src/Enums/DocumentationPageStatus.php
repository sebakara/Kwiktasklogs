<?php

namespace Webkul\Documentation\Enums;

enum DocumentationPageStatus: string
{
    case Draft = 'draft';
    case Published = 'published';
    case Archived = 'archived';
}
