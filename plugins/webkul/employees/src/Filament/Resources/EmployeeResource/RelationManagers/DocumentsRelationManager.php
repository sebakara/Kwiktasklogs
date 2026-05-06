<?php

namespace Webkul\Employee\Filament\Resources\EmployeeResource\RelationManagers;

use Filament\Resources\RelationManagers\RelationManager;
use Webkul\Employee\Traits\Resources\Employee\EmployeeDocumentRelation;

class DocumentsRelationManager extends RelationManager
{
    use EmployeeDocumentRelation;

    protected static string $relationship = 'documents';

    protected static ?string $title = 'Documents';
}
