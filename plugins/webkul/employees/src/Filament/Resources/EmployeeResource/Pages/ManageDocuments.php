<?php

namespace Webkul\Employee\Filament\Resources\EmployeeResource\Pages;

use Filament\Resources\Pages\ManageRelatedRecords;
use Webkul\Employee\Filament\Resources\EmployeeResource;
use Webkul\Employee\Traits\Resources\Employee\EmployeeDocumentRelation;

class ManageDocuments extends ManageRelatedRecords
{
    use EmployeeDocumentRelation;

    protected static string $resource = EmployeeResource::class;

    protected static string $relationship = 'documents';

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-document-check';

    public static function getNavigationLabel(): string
    {
        return 'Documents';
    }
}
