<?php

namespace Webkul\Website\Filament\Admin\Resources;

use Filament\Forms\Components\TextInput;
use Filament\Pages\Enums\SubNavigationPosition;
use Filament\Resources\Pages\Page;
use Filament\Resources\RelationManagers\RelationGroup;
use Filament\Schemas\Components\Fieldset;
use Filament\Schemas\Schema;
use Illuminate\Validation\Rules\Password;
use Webkul\Partner\Filament\Resources\PartnerResource as BasePartnerResource;
use Webkul\Partner\Filament\Resources\PartnerResource\RelationManagers\AddressesRelationManager;
use Webkul\Partner\Filament\Resources\PartnerResource\RelationManagers\ContactsRelationManager;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\CreatePartner;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\EditPartner;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\ListPartners;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\ManageAddresses;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\ManageContacts;
use Webkul\Website\Filament\Admin\Resources\PartnerResource\Pages\ViewPartner;
use Webkul\Website\Models\Partner;

class PartnerResource extends BasePartnerResource
{
    protected static ?string $model = Partner::class;

    protected static ?string $slug = 'website/contacts';

    protected static bool $shouldRegisterNavigation = true;

    protected static ?SubNavigationPosition $subNavigationPosition = SubNavigationPosition::Top;

    public static function form(Schema $schema): Schema
    {
        $schema = parent::form($schema);

        $generalSection = $schema->getComponents()[0];
        $generalSectionComponents = $generalSection->getDefaultChildComponents();
        $detailsGroup = $generalSectionComponents[1];

        $detailsGroup->childComponents([
            ...$detailsGroup->getDefaultChildComponents(),
            Fieldset::make('Portal Access')
                ->schema([
                    TextInput::make('password')
                        ->label('Password')
                        ->password()
                        ->revealable(filament()->arePasswordsRevealable())
                        ->required(fn (string $operation): bool => $operation === 'create')
                        ->rule(Password::default())
                        ->same('passwordConfirmation')
                        ->dehydrated(fn (?string $state): bool => filled($state)),
                    TextInput::make('passwordConfirmation')
                        ->label('Confirm Password')
                        ->password()
                        ->revealable(filament()->arePasswordsRevealable())
                        ->required(fn (string $operation): bool => $operation === 'create')
                        ->dehydrated(false),
                ])
                ->columns(2),
        ]);

        return $schema;
    }

    public static function getNavigationLabel(): string
    {
        return __('website::filament/admin/resources/partner.navigation.title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('website::filament/admin/resources/partner.navigation.group');
    }

    public static function getRecordSubNavigation(Page $page): array
    {
        return $page->generateNavigationItems([
            ViewPartner::class,
            EditPartner::class,
            ManageContacts::class,
            ManageAddresses::class,
        ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationGroup::make('Contacts', [
                ContactsRelationManager::class,
            ])
                ->icon('heroicon-o-users'),

            RelationGroup::make('Addresses', [
                AddressesRelationManager::class,
            ])
                ->icon('heroicon-o-map-pin'),
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'     => ListPartners::route('/'),
            'create'    => CreatePartner::route('/create'),
            'view'      => ViewPartner::route('/{record}'),
            'edit'      => EditPartner::route('/{record}/edit'),
            'contacts'  => ManageContacts::route('/{record}/contacts'),
            'addresses' => ManageAddresses::route('/{record}/addresses'),
        ];
    }
}
