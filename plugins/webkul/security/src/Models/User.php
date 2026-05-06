<?php

namespace Webkul\Security\Models;

use App\Models\Document;
use App\Models\DocumentUser;
use App\Models\User as BaseUser;
use Filament\Auth\MultiFactor\App\Concerns\InteractsWithAppAuthentication;
use Filament\Auth\MultiFactor\App\Concerns\InteractsWithAppAuthenticationRecovery;
use Filament\Auth\MultiFactor\App\Contracts\HasAppAuthentication;
use Filament\Auth\MultiFactor\App\Contracts\HasAppAuthenticationRecovery;
use Filament\Auth\MultiFactor\Email\Concerns\InteractsWithEmailAuthentication;
use Filament\Auth\MultiFactor\Email\Contracts\HasEmailAuthentication;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Traits\HasRoles;
use Webkul\Employee\Models\Department;
use Webkul\Employee\Models\Employee;
use Webkul\Employee\Models\EmployeeChatMessage;
use Webkul\Partner\Models\Partner;
use Webkul\Security\Enums\PermissionType;
use Webkul\Security\Traits\HasPermissionScope;
use Webkul\Support\Models\Company;

class User extends BaseUser implements FilamentUser, HasAppAuthentication, HasAppAuthenticationRecovery, HasEmailAuthentication
{
    use HasPermissionScope,
        HasRoles,
        InteractsWithAppAuthentication,
        InteractsWithAppAuthenticationRecovery,
        InteractsWithEmailAuthentication,
        SoftDeletes;

    public function __construct(array $attributes = [])
    {
        $this->mergeFillable([
            'partner_id',
            'language',
            'creator_id',
            'is_active',
            'default_company_id',
            'resource_permission',
            'is_default',
        ]);

        $this->mergeCasts([
            'default_company_id'  => 'integer',
            'resource_permission' => PermissionType::class,
            'is_default'          => 'boolean',
            'is_active'           => 'boolean',
        ]);

        parent::__construct($attributes);
    }

    protected function getAssignmentColumn(): ?string
    {
        return 'id';
    }

    protected $guard_name = ['web', 'sanctum'];

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->is_active;
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function getAvatarUrlAttribute()
    {
        return $this->partner?->avatar_url;
    }

    public function teams(): BelongsToMany
    {
        return $this->belongsToMany(Team::class, 'user_team', 'user_id', 'team_id');
    }

    public function employee(): HasOne
    {
        return $this->hasOne(Employee::class, 'user_id');
    }

    public function sentEmployeeChatMessages(): HasMany
    {
        return $this->hasMany(EmployeeChatMessage::class, 'sender_id');
    }

    public function receivedEmployeeChatMessages(): HasMany
    {
        return $this->hasMany(EmployeeChatMessage::class, 'recipient_id');
    }

    public function departments(): HasMany
    {
        return $this->hasMany(Department::class, 'manager_id');
    }

    public function companies(): HasMany
    {
        return $this->hasMany(Company::class);
    }

    public function partner(): BelongsTo
    {
        return $this->belongsTo(Partner::class, 'partner_id');
    }

    public function allowedCompanies(): BelongsToMany
    {
        return $this->belongsToMany(Company::class, 'user_allowed_companies', 'user_id', 'company_id');
    }

    public function defaultCompany(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'default_company_id');
    }

    public function uploadedDocuments(): HasMany
    {
        return $this->hasMany(Document::class, 'uploaded_by_user_id');
    }

    public function assignedDocuments(): BelongsToMany
    {
        return $this->belongsToMany(Document::class, 'document_user')
            ->using(DocumentUser::class)
            ->withPivot(['id', 'status', 'viewed_at', 'signed_at'])
            ->withTimestamps();
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($user) {
            $user->creator_id ??= Auth::id();
        });

        static::saved(function ($user) {
            if (! $user->partner_id) {
                $user->handlePartnerCreation($user);
            } else {
                $user->handlePartnerUpdation($user);
            }

            $user->pushSharedUserIdentityToEmployee();
        });

        static::deleting(function (User $user): void {
            if ($user->isNonDeletableAccount()) {
                throw ValidationException::withMessages([
                    'email' => __('security::models/user.cannot_delete_protected'),
                ]);
            }
        });
    }

    /**
     * @return list<string>
     */
    protected static function normalizedNonDeletableEmailsFromConfig(): array
    {
        $list = config('webkul_security.non_deletable_user_emails', ['admin@example.com']);

        if (! is_array($list)) {
            return ['admin@example.com'];
        }

        $normalized = array_values(array_unique(array_filter(array_map(
            static fn (mixed $part): string => mb_strtolower(trim((string) $part)),
            $list
        ))));

        return $normalized !== [] ? $normalized : ['admin@example.com'];
    }

    public static function isNonDeletableEmail(?string $email): bool
    {
        if ($email === null || trim($email) === '') {
            return false;
        }

        $needle = mb_strtolower(trim($email));

        foreach (self::normalizedNonDeletableEmailsFromConfig() as $blocked) {
            if ($needle === mb_strtolower($blocked)) {
                return true;
            }
        }

        return false;
    }

    public function isNonDeletableAccount(): bool
    {
        return self::isNonDeletableEmail(is_string($this->email) ? $this->email : null);
    }

    /**
     * @return list<int>
     */
    public static function protectedAccountIds(): array
    {
        $emails = self::normalizedNonDeletableEmailsFromConfig();

        return self::withTrashed()
            ->where(function (Builder $query) use ($emails): void {
                foreach ($emails as $email) {
                    $query->orWhereRaw('LOWER(email) = ?', [mb_strtolower($email)]);
                }
            })
            ->pluck('id')
            ->map(static fn ($id): int => (int) $id)
            ->all();
    }

    /**
     * Mirror common identity fields onto the linked {@see Employee} so HR and auth profiles stay consistent.
     */
    public function pushSharedUserIdentityToEmployee(): void
    {
        $employee = $this->employee()->first();

        if (! $employee instanceof Employee) {
            return;
        }

        $userName = trim((string) ($this->name ?? ''));
        if ($userName !== '') {
            $employee->name = $userName;
        }

        $employee->is_active = (bool) $this->is_active;

        $emailLower = strtolower(trim((string) $this->email));
        if ($emailLower !== '' && filter_var($emailLower, FILTER_VALIDATE_EMAIL)) {
            $work = strtolower(trim((string) ($employee->work_email ?? '')));
            if ($work !== $emailLower) {
                $employee->work_email = $emailLower;
            }
        }

        if ($employee->isDirty()) {
            $employee->save();
        }
    }

    private function handlePartnerCreation(self $user): void
    {
        $partner = $user->partner()->create($this->attributesForPartnerRecord($user));

        $user->partner_id = $partner->id;
        $user->save();
    }

    private function handlePartnerUpdation(self $user): void
    {
        $partner = Partner::updateOrCreate(
            ['id' => $user->partner_id],
            $this->attributesForPartnerRecord($user)
        );

        if ($user->partner_id !== $partner->id) {
            $user->partner_id = $partner->id;
            $user->save();
        }
    }

    /**
     * @return array<string, mixed>
     */
    private function attributesForPartnerRecord(self $user): array
    {
        return [
            'creator_id' => Auth::user()->id ?? $user->id,
            'user_id'    => $user->id,
            'sub_type'   => 'partner',
            'name'       => $user->name,
            'email'      => $user->email,
            'company_id' => $user->default_company_id,
        ];
    }
}
