<?php

namespace Webkul\Documentation\Filament\Pages;

use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Schemas\Schema;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationSpaceForm;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationSlugService;

class CreateSpace extends Page implements HasForms
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use InteractsWithForms;
    use ManagesDocumentationSpaceForm;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/create';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.spaces.form';

    public ?array $spaceData = [];

    public function mount(): void
    {
        Gate::authorize('create', DocumentationSpace::class);

        $this->spaceForm->fill($this->getSpaceFormState());
    }

    protected function getForms(): array
    {
        return [
            'spaceForm',
        ];
    }

    public function spaceForm(Schema $schema): Schema
    {
        return $this->spaceForm($schema);
    }

    public function save(): void
    {
        Gate::authorize('create', DocumentationSpace::class);

        $data = $this->spaceForm->getState();

        $data['slug'] = app(DocumentationSlugService::class)->uniqueFor(
            new DocumentationSpace,
            $data['slug'] ?? $data['name'],
            scopes: array_filter(['company_id' => auth()->user()?->default_company_id])
        );

        $data['company_id'] = auth()->user()?->default_company_id;
        $data['creator_id'] = auth()->id();

        $space = DocumentationSpace::query()->create($data);

        app(DocumentationAuditService::class)->log(
            DocumentationAuditAction::Created,
            auth()->user(),
            $space,
        );

        Notification::make()
            ->title(__('documentation::filament/hub.spaces.created'))
            ->success()
            ->send();

        $this->redirect(ViewSpace::getUrl(['documentationSpace' => $space->id]));
    }

    public function cancelUrl(): string
    {
        return ListSpaces::getUrl();
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.spaces.create_title');
    }

    public static function canAccess(): bool
    {
        $user = auth()->user();

        return InteractsWithDocumentationHubAuthorization::canAccess()
            && $user !== null
            && Gate::forUser($user)->allows('create', DocumentationSpace::class);
    }
}
