<?php

namespace Webkul\Project\Filament\Resources\ProjectResource\Pages;

use Filament\Actions\Action;
use Filament\Resources\Pages\ManageRelatedRecords;
use Filament\Tables\Table;
use Illuminate\Support\Collection;
use Webkul\Project\Filament\Resources\ProjectResource;
use Webkul\Project\Filament\Resources\TaskResource;
use Webkul\Project\Models\Task;
use Webkul\Project\Models\TaskStage;

class KanbanBoard extends ManageRelatedRecords
{
    protected static string $resource = ProjectResource::class;

    protected static string $relationship = 'tasks';

    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-squares-2x2';

    public static function getNavigationLabel(): string
    {
        return __('Kanban');
    }

    public function getView(): string
    {
        return 'projects::filament/resources/project/pages/kanban-board';
    }

    public function table(Table $table): Table
    {
        return TaskResource::table($table);
    }

    public function getStages(): Collection
    {
        return TaskStage::where('project_id', $this->getOwnerRecord()->getKey())
            ->orderBy('sort')
            ->get();
    }

    public function getTasksByStage(): array
    {
        return $this->getStages()
            ->mapWithKeys(fn (TaskStage $stage): array => [
                $stage->id => Task::where('stage_id', $stage->id)
                    ->whereNull('parent_id')
                    ->orderBy('sort')
                    ->with(['users'])
                    ->get(),
            ])
            ->all();
    }

    public function moveTask(int $taskId, int $stageId): void
    {
        $task = Task::where('id', $taskId)
            ->where('project_id', $this->getOwnerRecord()->getKey())
            ->firstOrFail();

        $task->update(['stage_id' => $stageId]);
    }

    protected function getHeaderActions(): array
    {
        return [
            Action::make('create_task')
                ->label(__('New Task'))
                ->icon('heroicon-o-plus-circle')
                ->url(fn (): string => TaskResource::getUrl('create', [
                    'project_id' => $this->getOwnerRecord()->getKey(),
                ])),
        ];
    }

    protected function getViewData(): array
    {
        $stages = $this->getStages();

        return [
            'stages'        => $stages,
            'tasksByStage'  => $this->getTasksByStage(),
            'projectRecord' => $this->getOwnerRecord(),
        ];
    }
}
