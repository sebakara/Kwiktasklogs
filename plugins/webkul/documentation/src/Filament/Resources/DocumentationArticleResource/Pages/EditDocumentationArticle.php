<?php

namespace Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages;

use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource;

class EditDocumentationArticle extends EditRecord
{
    protected static string $resource = DocumentationArticleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
