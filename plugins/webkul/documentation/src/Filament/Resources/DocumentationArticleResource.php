<?php

namespace Webkul\Documentation\Filament\Resources;

use BackedEnum;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Facades\Filament;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages\CreateDocumentationArticle;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages\EditDocumentationArticle;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages\ListDocumentationArticles;
use Webkul\Documentation\Filament\Resources\DocumentationArticleResource\Pages\ViewDocumentationArticle;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationArticleResource extends Resource
{
    protected static ?string $model = DocumentationArticle::class;

    protected static ?string $slug = 'documentation/features';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-book-open';

    public static function getModelLabel(): string
    {
        return __('documentation::filament/resources/documentation-article.model_label');
    }

    public static function getPluralModelLabel(): string
    {
        return __('documentation::filament/resources/documentation-article.plural_model_label');
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery()->with(['creator', 'project']);
        $user = Auth::user();

        if (! $user) {
            return $query;
        }

        /*
         * Privileged readers (admin / resource permission holder, project documentation
         * lead, or the article assignee) see every article including drafts. Everyone
         * else only sees published articles.
         */
        if ($user->can('view_any_documentation_article')) {
            return $query;
        }

        $leadProjectIds = Project::query()
            ->where('documentation_assignee_id', $user->id)
            ->pluck('id');

        return $query->where(function (Builder $builder) use ($user, $leadProjectIds): void {
            $builder->where('is_published', true)
                ->orWhereIn('project_id', $leadProjectIds)
                ->orWhere('assignee_id', $user->id);
        });
    }

    public static function shouldRegisterNavigation(): bool
    {
        return Auth::check();
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/resources/documentation-article.navigation.label');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('documentation::filament/resources/documentation-article.navigation.group');
    }

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('documentation::filament/resources/documentation-article.form.sections.content'))
                    ->schema([
                        TextInput::make('title')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.title'))
                            ->required()
                            ->maxLength(255)
                            ->live(onBlur: true)
                            ->afterStateUpdated(fn (string $operation, ?string $state, Set $set) => $operation === 'create' ? $set('slug', Str::slug((string) $state)) : null),
                        TextInput::make('slug')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.slug'))
                            ->hidden(fn (string $operation): bool => $operation === 'create')
                            ->maxLength(255)
                            ->unique(DocumentationArticle::class, 'slug', ignoreRecord: true),
                        TextInput::make('module')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.module'))
                            ->maxLength(255)
                            ->placeholder(__('documentation::filament/resources/documentation-article.form.fields.module_placeholder')),
                        Select::make('project_id')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.project'))
                            ->default(fn (): ?int => request()->integer('project') ?: request()->integer('project_id'))
                            ->hidden(fn (string $operation): bool => $operation === 'create' && (request()->integer('project') || request()->integer('project_id')))
                            ->searchable()
                            ->preload()
                            ->options(function (): array {
                                $user = Auth::user();

                                if (! $user) {
                                    return [];
                                }

                                if ($user->can('create_documentation_article')) {
                                    return Project::query()->orderBy('name')->pluck('name', 'id')->all();
                                }

                                return Project::query()
                                    ->where('documentation_assignee_id', $user->id)
                                    ->orderBy('name')
                                    ->pluck('name', 'id')
                                    ->all();
                            })
                            ->live(onBlur: true)
                            ->afterStateUpdated(function (?int $state, Get $get, Set $set): void {
                                if ($state && blank($get('module'))) {
                                    $set('module', 'Projects');
                                }
                            }),
                        Select::make('assignee_id')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.assignee'))
                            ->helperText(__('documentation::filament/resources/documentation-article.form.fields.assignee_helper'))
                            ->searchable()
                            ->preload()
                            ->options(fn (): array => User::query()
                                ->where('is_active', true)
                                ->whereHas('employee')
                                ->orderBy('name')
                                ->pluck('name', 'id')
                                ->toArray()),
                        Select::make('audience')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.audience'))
                            ->required()
                            ->options([
                                'all'      => __('documentation::filament/resources/documentation-article.audiences.all'),
                                'employee' => __('documentation::filament/resources/documentation-article.audiences.employee'),
                                'manager'  => __('documentation::filament/resources/documentation-article.audiences.manager'),
                                'admin'    => __('documentation::filament/resources/documentation-article.audiences.admin'),
                            ])
                            ->default('all'),
                        Textarea::make('summary')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.summary'))
                            ->rows(3),
                        RichEditor::make('content')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.content'))
                            ->required(),
                    ]),
                Section::make(__('documentation::filament/resources/documentation-article.form.sections.settings'))
                    ->schema([
                        Toggle::make('is_published')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.is_published'))
                            ->inline(false),
                        TextInput::make('sort_order')
                            ->label(__('documentation::filament/resources/documentation-article.form.fields.sort_order'))
                            ->numeric()
                            ->default(0)
                            ->required(),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('sort_order')
            ->columns([
                TextColumn::make('title')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.title'))
                    ->description(fn (DocumentationArticle $record): ?string => filled($record->summary)
                        ? Str::limit(strip_tags((string) $record->summary), 140)
                        : (filled($record->content)
                            ? Str::limit(strip_tags((string) $record->content), 140)
                            : null))
                    ->wrap()
                    ->searchable()
                    ->sortable(),
                TextColumn::make('module')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.module'))
                    ->searchable()
                    ->sortable()
                    ->placeholder('—'),
                TextColumn::make('project.name')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.project'))
                    ->searchable()
                    ->sortable()
                    ->placeholder('—'),
                TextColumn::make('assignee.name')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.assignee'))
                    ->searchable()
                    ->sortable()
                    ->placeholder('—'),
                TextColumn::make('creator.name')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.created_by'))
                    ->searchable()
                    ->sortable()
                    ->placeholder('—')
                    ->description(fn (DocumentationArticle $record): ?string => $record->isAuthoredByProjectDocumentationAssignee()
                        ? __('documentation::filament/resources/documentation-article.table.columns.documentation_assignee_author_subtitle')
                        : null),
                TextColumn::make('audience')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.audience'))
                    ->badge(),
                IconColumn::make('is_published')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.is_published'))
                    ->boolean()
                    ->sortable(),
                TextColumn::make('sort_order')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.sort_order'))
                    ->sortable(),
                TextColumn::make('updated_at')
                    ->label(__('documentation::filament/resources/documentation-article.table.columns.updated_at'))
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('project_id')
                    ->label(__('documentation::filament/resources/documentation-article.table.filters.project'))
                    ->relationship('project', 'name')
                    ->searchable()
                    ->preload(),
                SelectFilter::make('assignee_id')
                    ->label(__('documentation::filament/resources/documentation-article.table.filters.assignee'))
                    ->relationship('assignee', 'name')
                    ->searchable()
                    ->preload(),
                SelectFilter::make('audience')
                    ->options([
                        'all'      => __('documentation::filament/resources/documentation-article.audiences.all'),
                        'employee' => __('documentation::filament/resources/documentation-article.audiences.employee'),
                        'manager'  => __('documentation::filament/resources/documentation-article.audiences.manager'),
                        'admin'    => __('documentation::filament/resources/documentation-article.audiences.admin'),
                    ]),
                SelectFilter::make('my_assignment')
                    ->label(__('documentation::filament/resources/documentation-article.table.filters.my_assignment'))
                    ->options([
                        'mine' => __('documentation::filament/resources/documentation-article.table.filters.my_assignment_options.mine'),
                    ])
                    ->query(function ($query, array $data): void {
                        if (($data['value'] ?? null) === 'mine') {
                            $query->where('assignee_id', Filament::auth()->id());
                        }
                    }),
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => ListDocumentationArticles::route('/'),
            'create' => CreateDocumentationArticle::route('/create'),
            'view'   => ViewDocumentationArticle::route('/{record}'),
            'edit'   => EditDocumentationArticle::route('/{record}/edit'),
        ];
    }
}
