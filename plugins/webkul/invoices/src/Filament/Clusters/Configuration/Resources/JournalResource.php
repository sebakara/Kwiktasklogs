<?php

namespace Webkul\Invoice\Filament\Clusters\Configuration\Resources;

use Illuminate\Database\Eloquent\Builder;
use Webkul\Account\Enums\JournalType;
use Webkul\Account\Filament\Resources\JournalResource as BaseJournalResource;
use Webkul\Invoice\Filament\Clusters\Configuration;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\JournalResource\Pages\CreateJournal;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\JournalResource\Pages\EditJournal;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\JournalResource\Pages\ListJournals;
use Webkul\Invoice\Filament\Clusters\Configuration\Resources\JournalResource\Pages\ViewJournal;

class JournalResource extends BaseJournalResource
{
    protected static bool $shouldRegisterNavigation = true;

    protected static ?int $navigationSort = 9;

    protected static ?string $cluster = Configuration::class;

    public static function getModelLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/journal.model-label');
    }

    public static function getNavigationLabel(): string
    {
        return __('invoices::filament/clusters/configurations/resources/journal.navigation.title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('invoices::filament/clusters/configurations/resources/journal.navigation.group');
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->whereIn('type', [
            JournalType::BANK->value,
            JournalType::CASH->value,
            JournalType::CREDIT_CARD->value,
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => ListJournals::route('/'),
            'create' => CreateJournal::route('/create'),
            'edit'   => EditJournal::route('/{record}/edit'),
            'view'   => ViewJournal::route('/{record}'),
        ];
    }
}
