<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;

trait ManagesDocumentationSpaceForm
{
    public function spaceForm(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('documentation::filament/hub.spaces.form.section'))
                    ->schema([
                        TextInput::make('name')
                            ->label(__('documentation::filament/hub.spaces.form.name'))
                            ->required()
                            ->maxLength(255)
                            ->live(onBlur: true)
                            ->afterStateUpdated(function ($state, callable $set, ?string $old): void {
                                if (filled($old)) {
                                    return;
                                }

                                $set('slug', Str::slug((string) $state));
                            }),
                        TextInput::make('slug')
                            ->label(__('documentation::filament/hub.spaces.form.slug'))
                            ->required()
                            ->maxLength(255)
                            ->alphaDash(),
                        Textarea::make('description')
                            ->label(__('documentation::filament/hub.spaces.form.description'))
                            ->rows(3)
                            ->columnSpanFull(),
                        Select::make('visibility')
                            ->label(__('documentation::filament/hub.spaces.form.visibility'))
                            ->options([
                                DocumentationSpaceVisibility::Private->value  => __('documentation::filament/hub.spaces.visibility.private'),
                                DocumentationSpaceVisibility::Internal->value => __('documentation::filament/hub.spaces.visibility.internal'),
                                DocumentationSpaceVisibility::Public->value   => __('documentation::filament/hub.spaces.visibility.public'),
                            ])
                            ->required()
                            ->native(false),
                        TextInput::make('color')
                            ->label(__('documentation::filament/hub.spaces.form.color'))
                            ->placeholder('#3b82f6')
                            ->maxLength(50),
                        TextInput::make('icon')
                            ->label(__('documentation::filament/hub.spaces.form.icon'))
                            ->placeholder('heroicon-o-book-open')
                            ->maxLength(255),
                        Toggle::make('is_active')
                            ->label(__('documentation::filament/hub.spaces.form.is_active'))
                            ->default(true),
                    ])
                    ->columns(2),
            ]);
    }

    protected function getSpaceFormState(): array
    {
        return [
            'name'        => '',
            'slug'        => '',
            'description' => '',
            'visibility'  => DocumentationSpaceVisibility::Internal->value,
            'color'       => '#3b82f6',
            'icon'        => 'heroicon-o-book-open',
            'is_active'   => true,
        ];
    }
}
