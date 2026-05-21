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
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationSpaceActions;
use Webkul\Documentation\Filament\Pages\Concerns\ManagesDocumentationSpaceForm;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationSlugService;

class EditSpace extends Page implements HasForms
{
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;
    use InteractsWithForms;
    use ManagesDocumentationSpaceActions;
    use ManagesDocumentationSpaceForm;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'spaces/{documentationSpace}/edit';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'documentation::filament.hub.spaces.form';

    public DocumentationSpace $record;

    public ?array $spaceData = [];

    public function mount(int|string $documentationSpace): void
    {
        $this->record = DocumentationSpace::query()->findOrFail($documentationSpace);

        Gate::authorize('update', $this->record);

        $this->spaceForm->fill([
            'name'        => $this->record->name,
            'slug'        => $this->record->slug,
            'description' => $this->record->description,
            'visibility'  => $this->record->visibility?->value ?? $this->record->visibility,
            'color'       => $this->record->color,
            'icon'        => $this->record->icon,
            'is_active'   => $this->record->is_active,
        ]);
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
        Gate::authorize('update', $this->record);

        $data = $this->spaceForm->getState();

        if (($data['slug'] ?? '') === '') {
            $data['slug'] = app(DocumentationSlugService::class)->uniqueFor(
                $this->record,
                $data['name'],
                scopes: array_filter(['company_id' => $this->record->company_id])
            );
        }

        $this->record->update($data);

        app(DocumentationAuditService::class)->log(
            DocumentationAuditAction::Updated,
            auth()->user(),
            $this->record->fresh(),
        );

        Notification::make()
            ->title(__('documentation::filament/hub.spaces.saved'))
            ->success()
            ->send();

        $this->redirect(ViewSpace::getUrl(['documentationSpace' => $this->record->id]));
    }

    protected function afterSpaceMutation(DocumentationSpace $space, bool $deleted = false): void
    {
        if ($deleted) {
            $this->redirect(ListSpaces::getUrl());

            return;
        }

        $this->record = $space->fresh();
        $this->spaceForm->fill([
            'name'        => $this->record->name,
            'slug'        => $this->record->slug,
            'description' => $this->record->description,
            'visibility'  => $this->record->visibility?->value ?? $this->record->visibility,
            'color'       => $this->record->color,
            'icon'        => $this->record->icon,
            'is_active'   => $this->record->is_active,
        ]);
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.spaces.edit_title', ['name' => $this->record->name]);
    }

    public function cancelUrl(): string
    {
        return ViewSpace::getUrl(['documentationSpace' => $this->record->id]);
    }
}
