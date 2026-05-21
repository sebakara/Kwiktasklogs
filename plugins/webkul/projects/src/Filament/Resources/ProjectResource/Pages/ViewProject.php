<?php

namespace Webkul\Project\Filament\Resources\ProjectResource\Pages;

use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ViewRecord;
use Webkul\Chatter\Filament\Actions\ChatterAction;
use Webkul\Documentation\Services\DocumentationProjectPortalLink;
use Webkul\PluginManager\Package;
use Webkul\Project\Filament\Resources\ProjectResource;
use Webkul\Support\Models\ActivityPlan;

class ViewProject extends ViewRecord
{
    protected static string $resource = ProjectResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('projectDocumentation')
                ->label('Project Docs')
                ->icon('heroicon-o-book-open')
                ->color('info')
                ->visible(fn (): bool => Package::isPluginInstalled('documentation'))
                ->url(fn (): string => DocumentationProjectPortalLink::urlForProject((int) $this->record->getKey())),
            ChatterAction::make()
                ->setResource(static::$resource)
                ->setActivityPlans($this->getActivityPlans()),
            DeleteAction::make()
                ->successNotification(
                    Notification::make()
                        ->success()
                        ->title(__('projects::filament/resources/project/pages/view-project.header-actions.delete.notification.title'))
                        ->body(__('projects::filament/resources/project/pages/view-project.header-actions.delete.notification.body')),
                ),
        ];
    }

    private function getActivityPlans(): mixed
    {
        return ActivityPlan::where('plugin', 'projects')->pluck('name', 'id');
    }
}
