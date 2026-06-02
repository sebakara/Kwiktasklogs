<?php

namespace Webkul\Project\Filament\Resources\TaskResource\Pages;

use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Webkul\Project\Filament\Resources\ProjectResource;
use Webkul\Project\Filament\Resources\TaskResource;
use Webkul\Project\Models\Project;

class CreateTask extends CreateRecord
{
    protected static string $resource = TaskResource::class;

    public ?int $lockedProjectId = null;

    public function mount(): void
    {
        parent::mount();

        $projectId = request()->integer('project_id');

        if (! $projectId) {
            $this->redirect(ProjectResource::getUrl('index'));

            return;
        }

        $project = Project::query()->findOrFail($projectId);

        $this->lockedProjectId = $project->id;

        $this->form->fill([
            'project_id' => $project->id,
            'partner_id' => $project->partner_id,
        ]);
    }

    public function hasLockedProject(): bool
    {
        return filled($this->lockedProjectId);
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if ($this->lockedProjectId) {
            $data['project_id'] = $this->lockedProjectId;
        }

        return $data;
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('view', ['record' => $this->getRecord()]);
    }

    protected function getCreatedNotification(): Notification
    {
        return Notification::make()
            ->success()
            ->title(__('projects::filament/resources/task/pages/create-task.notification.title'))
            ->body(__('projects::filament/resources/task/pages/create-task.notification.body'));
    }
}
