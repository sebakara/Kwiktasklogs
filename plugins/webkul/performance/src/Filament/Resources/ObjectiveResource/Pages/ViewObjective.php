<?php

namespace Webkul\Performance\Filament\Resources\ObjectiveResource\Pages;

use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;
use Webkul\Chatter\Filament\Actions\ChatterAction;
use Webkul\Performance\Filament\Resources\ObjectiveResource;
use Webkul\Support\Models\ActivityPlan;

class ViewObjective extends ViewRecord
{
    protected static string $resource = ObjectiveResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ChatterAction::make()
                ->setResource(static::$resource)
                ->setActivityPlans($this->getActivityPlans()),
            EditAction::make(),
            DeleteAction::make(),
        ];
    }

    private function getActivityPlans(): mixed
    {
        return ActivityPlan::where('plugin', 'performance')->pluck('name', 'id');
    }
}
