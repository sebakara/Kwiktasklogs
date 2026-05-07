<?php

namespace Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages;

use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\ViewRecord;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource;

class ViewDocumentationArticle extends ViewRecord
{
    protected static string $resource = DocumentationArticleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
