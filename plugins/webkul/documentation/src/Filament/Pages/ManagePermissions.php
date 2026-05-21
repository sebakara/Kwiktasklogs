<?php

namespace Webkul\Documentation\Filament\Pages;

use BackedEnum;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Gate;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Filament\Clusters\DocumentationHubCluster;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubActions;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubAuthorization;
use Webkul\Documentation\Filament\Pages\Concerns\InteractsWithDocumentationHubLayout;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Documentation\Services\DocumentationAccessService;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationPermissionAssignmentService;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\Team;
use Webkul\Security\Models\User;

class ManagePermissions extends Page
{
    use InteractsWithDocumentationHubActions;
    use InteractsWithDocumentationHubAuthorization;
    use InteractsWithDocumentationHubLayout;

    protected static ?string $cluster = DocumentationHubCluster::class;

    protected static ?string $slug = 'permissions';

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-shield-check';

    protected static ?int $navigationSort = 3;

    protected string $view = 'documentation::filament.hub.permissions.index';

    public string $filterTarget = 'all';

    /** @var array<int, array<string, mixed>> */
    public array $permissions = [];

    public bool $showForm = false;

    public string $permission = 'view';

    public string $permissionable_type = DocumentationSpace::class;

    public ?int $permissionable_id = null;

    public string $subject_type = 'user';

    public ?int $subject_id = null;

    /** @var array<int, string> */
    public array $spaceOptions = [];

    /** @var array<int, string> */
    public array $pageOptions = [];

    /** @var array<int, string> */
    public array $userOptions = [];

    /** @var array<int, string> */
    public array $teamOptions = [];

    /** @var array<int, string> */
    public array $roleOptions = [];

    public function mount(): void
    {
        Gate::authorize('viewAny', DocumentationPermission::class);

        $this->loadOptions();
        $this->loadPermissions();
    }

    public function updatedPermissionableType(): void
    {
        $this->permissionable_id = null;
    }

    public function updatedFilterTarget(): void
    {
        $this->loadPermissions();
    }

    public function openCreateForm(): void
    {
        Gate::authorize('create', DocumentationPermission::class);

        $this->resetForm();
        $this->showForm = true;
    }

    public function closeForm(): void
    {
        $this->showForm = false;
        $this->resetForm();
    }

    public function savePermission(): void
    {
        $this->runHubAction(function (): string {
            Gate::authorize('create', DocumentationPermission::class);

            $data = [
                'permission'          => $this->permission,
                'permissionable_type' => $this->permissionable_type,
                'permissionable_id'   => $this->permissionable_id,
                'user_id'             => $this->subject_type === 'user' ? $this->subject_id : null,
                'team_id'             => $this->subject_type === 'team' ? $this->subject_id : null,
                'role_id'             => $this->subject_type === 'role' ? $this->subject_id : null,
            ];

            $permission = app(DocumentationPermissionAssignmentService::class)->assign($data);

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::PermissionChanged,
                auth()->user(),
                metadata: ['permission_id' => $permission->id, 'action' => 'created'],
            );

            $this->closeForm();
            $this->loadPermissions();

            return __('documentation::filament/hub.permissions.created');
        });
    }

    public function deletePermission(int $permissionId): void
    {
        $this->runHubAction(function () use ($permissionId): string {
            $permission = DocumentationPermission::query()->findOrFail($permissionId);

            Gate::authorize('delete', $permission);

            $permission->delete();

            app(DocumentationAuditService::class)->log(
                DocumentationAuditAction::PermissionChanged,
                auth()->user(),
                metadata: ['permission_id' => $permissionId, 'action' => 'deleted'],
            );

            $this->loadPermissions();

            return __('documentation::filament/hub.permissions.deleted');
        });
    }

    protected function loadPermissions(): void
    {
        $query = DocumentationPermission::query()
            ->with(['user:id,name', 'team:id,name', 'role:id,name'])
            ->latest();

        if ($this->filterTarget === 'space') {
            $query->where('permissionable_type', DocumentationSpace::class);
        } elseif ($this->filterTarget === 'page') {
            $query->where('permissionable_type', DocumentationPage::class);
        }

        $spaceNames = DocumentationSpace::query()->pluck('name', 'id');
        $pageTitles = DocumentationPage::query()->pluck('title', 'id');

        $this->permissions = $query->limit(200)->get()->map(function (DocumentationPermission $permission) use ($spaceNames, $pageTitles): array {
            $targetName = $permission->permissionable_type === DocumentationSpace::class
                ? ($spaceNames[$permission->permissionable_id] ?? null)
                : ($pageTitles[$permission->permissionable_id] ?? null);

            return [
                'id'                  => $permission->id,
                'permission'          => $permission->permission?->value ?? $permission->permission,
                'permissionable_type' => class_basename($permission->permissionable_type),
                'permissionable_id'   => $permission->permissionable_id,
                'target_name'         => $targetName,
                'subject_label'       => $permission->user?->name
                    ?? $permission->team?->name
                    ?? $permission->role?->name
                    ?? '—',
                'subject_type'        => $permission->user_id ? 'user' : ($permission->team_id ? 'team' : 'role'),
            ];
        })->all();
    }

    protected function loadOptions(): void
    {
        $this->spaceOptions = DocumentationSpace::query()
            ->orderBy('name')
            ->pluck('name', 'id')
            ->all();

        $this->pageOptions = DocumentationPage::query()
            ->orderBy('title')
            ->limit(500)
            ->pluck('title', 'id')
            ->all();

        $this->userOptions = User::query()
            ->orderBy('name')
            ->limit(500)
            ->pluck('name', 'id')
            ->all();

        $this->teamOptions = Team::query()
            ->orderBy('name')
            ->pluck('name', 'id')
            ->all();

        $this->roleOptions = Role::query()
            ->where('guard_name', 'web')
            ->orderBy('name')
            ->pluck('name', 'id')
            ->all();
    }

    protected function resetForm(): void
    {
        $this->permission = DocumentationPermissionLevel::View->value;
        $this->permissionable_type = DocumentationSpace::class;
        $this->permissionable_id = array_key_first($this->spaceOptions) ?: null;
        $this->subject_type = 'user';
        $this->subject_id = null;
    }

    /**
     * @return array<string, string>
     */
    public function permissionLevelOptions(): array
    {
        return [
            DocumentationPermissionLevel::View->value    => __('documentation::filament/hub.permissions.levels.view'),
            DocumentationPermissionLevel::Comment->value => __('documentation::filament/hub.permissions.levels.comment'),
            DocumentationPermissionLevel::Edit->value    => __('documentation::filament/hub.permissions.levels.edit'),
            DocumentationPermissionLevel::Manage->value  => __('documentation::filament/hub.permissions.levels.manage'),
        ];
    }

    public static function getNavigationLabel(): string
    {
        return __('documentation::filament/hub.nav.permissions');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }

    public static function canAccess(): bool
    {
        $user = auth()->user();

        return InteractsWithDocumentationHubAuthorization::canAccess()
            && $user !== null
            && app(DocumentationAccessService::class)->canManagePermissions($user);
    }

    public function getTitle(): string|Htmlable
    {
        return __('documentation::filament/hub.permissions.title');
    }
}
