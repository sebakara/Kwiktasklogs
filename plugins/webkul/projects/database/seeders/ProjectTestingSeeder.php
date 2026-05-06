<?php

namespace Webkul\Project\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;
use Webkul\Employee\Models\Department;
use Webkul\Employee\Models\Employee;
use Webkul\Employee\Models\EmployeeJobPosition;
use Webkul\Project\Models\Project;
use Webkul\Project\Models\ProjectStage;
use Webkul\Project\Models\Task;
use Webkul\Project\Models\TaskStage;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class ProjectTestingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $developmentStageNames = [
            'Backlog',
            'In Development',
            'In Review',
            'Done',
        ];

        $projectNames = [
            'Aureus ERP Core Platform',
            'Customer Self-Service Portal',
            'Mobile Field Sales App',
            'HR & Payroll Automation',
            'Business Intelligence Dashboard',
        ];

        Task::query()
            ->whereHas('project', function ($query) use ($projectNames): void {
                $query->whereNotIn('name', $projectNames);
            })
            ->delete();

        Project::query()
            ->whereNotIn('name', $projectNames)
            ->delete();

        $defaultStageId = ProjectStage::query()->orderBy('sort')->value('id');
        $defaultUserId = User::query()->value('id');
        $defaultCompanyId = Company::query()->value('id');

        $projects = collect($projectNames)
            ->values()
            ->map(function (string $projectName, int $index) use ($developmentStageNames, $defaultStageId, $defaultUserId, $defaultCompanyId): Project {
                $project = Project::query()->firstOrCreate(
                    ['name' => $projectName],
                    [
                        'tasks_label'             => 'Tasks',
                        'description'             => fake()->sentence(),
                        'visibility'              => 'public',
                        'color'                   => fake()->hexColor(),
                        'sort'                    => $index + 1,
                        'start_date'              => fake()->date(),
                        'end_date'                => fake()->date(),
                        'allocated_hours'         => fake()->numberBetween(50, 200),
                        'allow_timesheets'        => true,
                        'allow_milestones'        => false,
                        'allow_task_dependencies' => false,
                        'is_active'               => true,
                        'stage_id'                => $defaultStageId,
                        'partner_id'              => null,
                        'company_id'              => $defaultCompanyId,
                        'user_id'                 => $defaultUserId,
                        'creator_id'              => $defaultUserId,
                    ]
                );

                $project->update([
                    'stage_id'  => $defaultStageId,
                    'sort'      => $index + 1,
                    'is_active' => true,
                ]);

                $project->taskStages()->delete();
                $project->tasks()->delete();

                $taskStages = collect($developmentStageNames)
                    ->values()
                    ->map(function (string $stageName, int $stageIndex) use ($project, $defaultUserId, $defaultCompanyId): TaskStage {
                        return TaskStage::query()->create([
                            'name'       => $stageName,
                            'sort'       => $stageIndex + 1,
                            'is_active'  => true,
                            'project_id' => $project->id,
                            'company_id' => $project->company_id ?? $defaultCompanyId,
                            'user_id'    => $project->user_id ?? $defaultUserId,
                            'creator_id' => $project->creator_id ?? $defaultUserId,
                        ]);
                    });

                foreach (range(1, 10) as $taskIndex) {
                    Task::query()->create([
                        'title'                   => fake()->sentence(4),
                        'description'             => fake()->sentence(),
                        'color'                   => fake()->hexColor(),
                        'priority'                => fake()->boolean(),
                        'state'                   => 'in_progress',
                        'sort'                    => $taskIndex,
                        'deadline'                => fake()->dateTimeBetween('now', '+30 days'),
                        'is_active'               => true,
                        'is_recurring'            => false,
                        'working_hours_open'      => 0,
                        'working_hours_close'     => 0,
                        'allocated_hours'         => $hours = fake()->numberBetween(4, 40),
                        'remaining_hours'         => $hours,
                        'effective_hours'         => 0,
                        'total_hours_spent'       => 0,
                        'overtime'                => 0,
                        'progress'                => 0,
                        'subtask_effective_hours' => 0,
                        'project_id'              => $project->id,
                        'stage_id'                => $taskStages[($taskIndex - 1) % $taskStages->count()]->id,
                        'partner_id'              => $project->partner_id,
                        'parent_id'               => null,
                        'company_id'              => $project->company_id ?? $defaultCompanyId,
                        'creator_id'              => $project->creator_id ?? $defaultUserId,
                    ]);
                }

                return $project->fresh();
            });

        $developers = $this->seedCompanyStructure();

        if ($developers->isEmpty()) {
            return;
        }

        $projectIds = $projects->pluck('id')->all();

        $projectTasks = Task::query()
            ->whereIn('project_id', $projectIds)
            ->with('users')
            ->orderBy('project_id')
            ->orderBy('id')
            ->get();

        $developerUsers = $developers
            ->pluck('user')
            ->filter()
            ->values();

        if ($developerUsers->isEmpty()) {
            return;
        }

        $projectTasks->each(function (Task $task, int $index) use ($developerUsers): void {
            $user = $developerUsers[$index % $developerUsers->count()];
            $task->users()->syncWithoutDetaching([$user->id]);
        });
    }

    /**
     * @return Collection<int, Employee>
     */
    protected function seedCompanyStructure(): Collection
    {
        $creator = User::query()->first();
        $company = Company::query()->first();

        $departmentMap = collect([
            'Development',
            'Human Resources',
            'Marketing',
            'Product',
        ])->mapWithKeys(function (string $departmentName) use ($creator, $company): array {
            $department = Department::query()->firstOrCreate(
                ['name' => $departmentName],
                [
                    'company_id' => $company?->id,
                    'creator_id' => $creator?->id,
                    'color'      => fake()->hexColor(),
                ]
            );

            return [$departmentName => $department];
        });

        $profiles = [
            ['name' => 'Nkundabarashi', 'email' => 'backend.dev1@employee.local', 'job' => 'Backend Developer', 'department' => 'Development'],
            ['name' => 'Uwamahoro', 'email' => 'backend.dev2@employee.local', 'job' => 'Backend Developer', 'department' => 'Development'],
            ['name' => 'Niyigena', 'email' => 'backend.dev3@employee.local', 'job' => 'Backend Developer', 'department' => 'Development'],
            ['name' => 'Mukansanga', 'email' => 'frontend.dev1@employee.local', 'job' => 'Frontend Developer', 'department' => 'Development'],
            ['name' => 'Ndayambaje', 'email' => 'frontend.dev2@employee.local', 'job' => 'Frontend Developer', 'department' => 'Development'],
            ['name' => 'Uwizeyimana', 'email' => 'frontend.dev3@employee.local', 'job' => 'Frontend Developer', 'department' => 'Development'],
            ['name' => 'Ingabire', 'email' => 'uiux.dev1@employee.local', 'job' => 'UI/UX Developer', 'department' => 'Development'],
            ['name' => 'Murekatete', 'email' => 'graphic.designer1@employee.local', 'job' => 'Graphic Designer', 'department' => 'Development'],
            ['name' => 'Habimana', 'email' => 'devops.engineer1@employee.local', 'job' => 'DevOps Engineer', 'department' => 'Development'],
            ['name' => 'Nshimiyimana', 'email' => 'team.lead1@employee.local', 'job' => 'Team Leader', 'department' => 'Development'],
            ['name' => 'Nyirarukundo', 'email' => 'team.lead2@employee.local', 'job' => 'Team Leader', 'department' => 'Development'],
            ['name' => 'Ntirenganya', 'email' => 'tech.lead1@employee.local', 'job' => 'Tech Lead', 'department' => 'Development'],
            ['name' => 'Mukamugema', 'email' => 'hr.exec1@employee.local', 'job' => 'HR Executive', 'department' => 'Human Resources'],
            ['name' => 'Nizeyimana', 'email' => 'marketing.spec1@employee.local', 'job' => 'Marketing Specialist', 'department' => 'Marketing'],
            ['name' => 'Uwera', 'email' => 'product.manager1@employee.local', 'job' => 'Product Manager', 'department' => 'Product'],
        ];

        return collect($profiles)
            ->map(function (array $profile) use ($departmentMap, $creator, $company): ?Employee {
                $department = $departmentMap->get($profile['department']);

                if (! $department) {
                    return null;
                }

                $jobPosition = EmployeeJobPosition::query()->firstOrCreate(
                    [
                        'name'          => $profile['job'],
                        'department_id' => $department->id,
                    ],
                    [
                        'company_id'         => $company?->id,
                        'creator_id'         => $creator?->id,
                        'is_active'          => true,
                        'description'        => $profile['job'],
                        'requirements'       => null,
                        'sort'               => null,
                        'expected_employees' => null,
                        'no_of_employee'     => null,
                        'no_of_recruitment'  => null,
                        'employment_type_id' => null,
                    ]
                );

                $employee = Employee::withoutEvents(function () use ($profile, $company, $creator, $department, $jobPosition): Employee {
                    return Employee::query()->firstOrCreate(
                        ['work_email' => $profile['email']],
                        [
                            'name'          => $profile['name'],
                            'job_title'     => $profile['job'],
                            'employee_type' => 'employee',
                            'is_active'     => true,
                            'company_id'    => $company?->id,
                            'creator_id'    => $creator?->id,
                            'department_id' => $department->id,
                            'job_id'        => $jobPosition->id,
                            'time_zone'     => 'UTC',
                        ]
                    );
                });

                if (! $employee->user_id) {
                    $employee->synchronizeHrRecords();
                }

                return $employee;
            })
            ->filter(function (?Employee $employee): bool {
                return $employee instanceof Employee;
            })
            ->filter(function (Employee $employee): bool {
                return $employee->department?->name === 'Development';
            })
            ->values();
    }
}
