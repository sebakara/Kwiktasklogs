<?php

namespace Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages;

use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource;

class ListDocumentationArticles extends ListRecords
{
    protected static string $resource = DocumentationArticleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
