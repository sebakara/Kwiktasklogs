<?php

namespace Webkul\Employee\Filament\Resources\EmployeeResource\Pages;

use Filament\Resources\Pages\ManageRelatedRecords;
use Webkul\Employee\Filament\Resources\EmployeeResource;
use Webkul\Employee\Traits\Resources\Employee\EmployeeReviewRelation;

class ManageReviews extends ManageRelatedRecords
{
    use EmployeeReviewRelation;

    protected static string $resource = EmployeeResource::class;

    protected static string $relationship = 'reviews';

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-clipboard-document-check';

    public static function getNavigationLabel(): string
    {
        return __('employees::filament/resources/employee/pages/manage-review.navigation.title');
    }
}
