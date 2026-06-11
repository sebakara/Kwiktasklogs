<x-filament-panels::page>
    <div
        x-data="{
            draggingTaskId: null,
            dragOverStageId: null,

            dragStart(taskId) {
                this.draggingTaskId = taskId;
            },
            dragEnd() {
                this.draggingTaskId = null;
                this.dragOverStageId = null;
            },
            dragEnter(stageId) {
                this.dragOverStageId = stageId;
            },
            dragLeave() {
                this.dragOverStageId = null;
            },
            drop(stageId) {
                if (this.draggingTaskId !== null) {
                    $wire.moveTask(this.draggingTaskId, stageId);
                }
                this.draggingTaskId = null;
                this.dragOverStageId = null;
            }
        }"
        class="flex gap-4 overflow-x-auto pb-4"
        style="min-height: 70vh;"
    >
        @forelse ($stages as $stage)
            @php $stageTasks = $tasksByStage[$stage->id] ?? collect(); @endphp

            <div
                class="flex flex-col flex-shrink-0 w-72"
                x-on:dragover.prevent
                x-on:dragenter="dragEnter({{ $stage->id }})"
                x-on:dragleave="dragLeave()"
                x-on:drop="drop({{ $stage->id }})"
            >
                {{-- Column Header --}}
                <div
                    class="flex items-center justify-between px-3 py-2 mb-2 rounded-lg font-semibold text-sm"
                    :class="dragOverStageId === {{ $stage->id }}
                        ? 'bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-300'
                        : 'bg-gray-100 dark:bg-white/5 text-gray-700 dark:text-gray-200'"
                >
                    <span>{{ $stage->name }}</span>
                    <span
                        class="inline-flex items-center justify-center w-5 h-5 text-xs rounded-full bg-gray-200 dark:bg-white/10 text-gray-600 dark:text-gray-300"
                    >
                        {{ $stageTasks->count() }}
                    </span>
                </div>

                {{-- Task Cards --}}
                <div
                    class="flex flex-col gap-2 flex-1 min-h-16 rounded-lg p-1 transition-colors duration-150"
                    :class="dragOverStageId === {{ $stage->id }} ? 'bg-primary-50 dark:bg-primary-900/10 ring-2 ring-primary-300 dark:ring-primary-700' : ''"
                >
                    @forelse ($stageTasks as $task)
                        <div
                            draggable="true"
                            x-on:dragstart="dragStart({{ $task->id }})"
                            x-on:dragend="dragEnd()"
                            wire:key="task-{{ $task->id }}"
                            :class="draggingTaskId === {{ $task->id }} ? 'opacity-50 ring-2 ring-primary-400' : ''"
                            class="bg-white dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-white/10 p-3 shadow-sm cursor-grab active:cursor-grabbing hover:shadow-md hover:border-primary-300 dark:hover:border-primary-700 transition-all duration-150 group"
                        >
                            {{-- Task Title --}}
                            <a
                                href="{{ \Webkul\Project\Filament\Resources\TaskResource::getUrl('view', ['record' => $task]) }}"
                                class="block text-sm font-medium text-gray-900 dark:text-white group-hover:text-primary-600 dark:group-hover:text-primary-400 mb-2 leading-snug"
                                draggable="false"
                            >
                                {{ $task->title }}
                            </a>

                            {{-- Priority badge --}}
                            @if ($task->priority)
                                <div class="mb-2">
                                    <span class="inline-flex items-center gap-1 text-xs text-warning-600 dark:text-warning-400">
                                        <x-heroicon-s-star class="w-3 h-3" />
                                        Starred
                                    </span>
                                </div>
                            @endif

                            {{-- State badge --}}
                            @if ($task->state)
                                <div class="mb-2">
                                    <span
                                        class="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-medium"
                                        style="background-color: color-mix(in srgb, currentColor 15%, transparent); color: {{ $task->state->getColor() !== 'gray' ? 'var(--' . $task->state->getColor() . '-600)' : 'var(--gray-500)' }}"
                                    >
                                        {{ $task->state->getLabel() }}
                                    </span>
                                </div>
                            @endif

                            {{-- Assignees --}}
                            @if ($task->users->isNotEmpty())
                                <div class="flex items-center gap-1 mt-2 pt-2 border-t border-gray-100 dark:border-white/5">
                                    <div class="flex -space-x-1">
                                        @foreach ($task->users->take(3) as $user)
                                            <div
                                                class="w-6 h-6 rounded-full bg-primary-500 flex items-center justify-center text-white text-xs font-semibold ring-2 ring-white dark:ring-gray-800 uppercase"
                                                title="{{ $user->name }}"
                                            >
                                                {{ mb_substr($user->name, 0, 1) }}
                                            </div>
                                        @endforeach
                                    </div>

                                    @if ($task->users->count() > 3)
                                        <span class="text-xs text-gray-500 dark:text-gray-400">
                                            +{{ $task->users->count() - 3 }}
                                        </span>
                                    @endif
                                </div>
                            @endif

                            {{-- Deadline --}}
                            @if ($task->deadline)
                                <div class="flex items-center gap-1 mt-1 text-xs {{ $task->deadline->isPast() ? 'text-danger-600 dark:text-danger-400' : 'text-gray-500 dark:text-gray-400' }}">
                                    <x-heroicon-o-calendar class="w-3 h-3" />
                                    {{ $task->deadline->format('M d') }}
                                </div>
                            @endif
                        </div>
                    @empty
                        <div class="flex items-center justify-center h-16 text-xs text-gray-400 dark:text-gray-600 italic rounded-lg border-2 border-dashed border-gray-200 dark:border-white/5">
                            Drop tasks here
                        </div>
                    @endforelse
                </div>
            </div>
        @empty
            <div class="flex items-center justify-center w-full py-16 text-gray-500 dark:text-gray-400">
                <div class="text-center">
                    <x-heroicon-o-squares-2x2 class="w-12 h-12 mx-auto mb-3 text-gray-300 dark:text-gray-600" />
                    <p class="font-medium">No stages defined for this project.</p>
                    <p class="text-sm mt-1">Add task stages in the project settings to use the Kanban board.</p>
                </div>
            </div>
        @endforelse
    </div>
</x-filament-panels::page>
