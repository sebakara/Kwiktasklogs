<?php

namespace Webkul\Employee\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Webkul\Chatter\Traits\HasChatter;
use Webkul\Chatter\Traits\HasLogActivity;
use Webkul\Employee\Database\Factories\EmployeeFactory;
use Webkul\Field\Traits\HasCustomFields;
use Webkul\Partner\Models\BankAccount;
use Webkul\Partner\Models\Partner;
use Webkul\Security\Mail\UserInvitationMail;
use Webkul\Security\Models\Invitation;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;
use Webkul\Security\Settings\UserSettings;
use Webkul\Support\Models\Company;
use Webkul\Support\Models\Country;
use Webkul\Support\Models\State;

class Employee extends Model
{
    use HasChatter, HasCustomFields, HasFactory, HasLogActivity, SoftDeletes;

    protected $table = 'employees_employees';

    protected $fillable = [
        'company_id',
        'user_id',
        'creator_id',
        'calendar_id',
        'department_id',
        'job_id',
        'attendance_manager_id',
        'partner_id',
        'work_location_id',
        'parent_id',
        'coach_id',
        'country_id',
        'state_id',
        'country_of_birth',
        'bank_account_id',
        'departure_reason_id',
        'name',
        'job_title',
        'work_phone',
        'mobile_phone',
        'color',
        'work_email',
        'children',
        'distance_home_work',
        'km_home_work',
        'distance_home_work_unit',
        'private_phone',
        'private_email',
        'private_street1',
        'private_street2',
        'private_city',
        'private_zip',
        'private_state_id',
        'private_country_id',
        'private_car_plate',
        'lang',
        'gender',
        'birthday',
        'marital',
        'spouse_complete_name',
        'spouse_birthdate',
        'place_of_birth',
        'ssnid',
        'sinid',
        'identification_id',
        'passport_id',
        'permit_no',
        'visa_no',
        'certificate',
        'study_field',
        'study_school',
        'emergency_contact',
        'emergency_phone',
        'employee_type',
        'barcode',
        'pin',
        'address_id',
        'time_zone',
        'work_permit',
        'leave_manager_id',
        'visa_expire',
        'work_permit_expiration_date',
        'departure_date',
        'departure_description',
        'additional_note',
        'notes',
        'is_active',
        'is_flexible',
        'is_fully_flexible',
        'work_permit_scheduled_activity',
    ];

    protected $casts = [
        'is_active'                      => 'boolean',
        'is_flexible'                    => 'boolean',
        'is_fully_flexible'              => 'boolean',
        'work_permit_scheduled_activity' => 'boolean',
    ];

    public function getModelTitle(): string
    {
        return __('employees::models/employee.title');
    }

    public function privateState(): BelongsTo
    {
        return $this->belongsTo(State::class, 'private_state_id');
    }

    public function privateCountry(): BelongsTo
    {
        return $this->belongsTo(Country::class, 'private_country_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function calendar(): BelongsTo
    {
        return $this->belongsTo(Calendar::class, 'calendar_id');
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class, 'department_id');
    }

    public function job(): BelongsTo
    {
        return $this->belongsTo(EmployeeJobPosition::class, 'job_id');
    }

    public function partner(): BelongsTo
    {
        return $this->belongsTo(Partner::class, 'partner_id');
    }

    public function workLocation(): BelongsTo
    {
        return $this->belongsTo(WorkLocation::class, 'work_location_id');
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function coach(): BelongsTo
    {
        return $this->belongsTo(self::class, 'coach_id');
    }

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class, 'country_id');
    }

    public function state(): BelongsTo
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function countryOfBirth(): BelongsTo
    {
        return $this->belongsTo(Country::class, 'country_of_birth');
    }

    public function bankAccount()
    {
        return $this->belongsTo(BankAccount::class, 'bank_account_id');
    }

    public function departureReason(): BelongsTo
    {
        return $this->belongsTo(DepartureReason::class, 'departure_reason_id');
    }

    public function employmentType(): BelongsTo
    {
        return $this->belongsTo(EmploymentType::class, 'employee_type');
    }

    public function categories()
    {
        return $this->belongsToMany(EmployeeCategory::class, 'employees_employee_categories', 'employee_id', 'category_id');
    }

    public function skills(): HasMany
    {
        return $this->hasMany(EmployeeSkill::class, 'employee_id');
    }

    public function resumes()
    {
        return $this->hasMany(EmployeeResume::class, 'employee_id');
    }

    protected static function newFactory(): EmployeeFactory
    {
        return EmployeeFactory::new();
    }

    public function leaveManager(): BelongsTo
    {
        return $this->belongsTo(User::class, 'leave_manager_id');
    }

    public function attendanceManager(): BelongsTo
    {
        return $this->belongsTo(User::class, 'attendance_manager_id');
    }

    public function companyAddress()
    {
        return $this->belongsTo(Partner::class, 'address_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::saved(function (self $employee) {
            $employee->synchronizeHrRecords();
        });
    }

    /**
     * Ensure linked User and Partner rows exist so the employee can sign in where applicable.
     */
    public function synchronizeHrRecords(): void
    {
        $this->creator_id ??= Auth::id();
        $this->ensureUserAccount();

        if (! $this->partner_id) {
            $this->handlePartnerCreation($this);
        } else {
            $this->handlePartnerUpdation($this);
        }
    }

    private function handlePartnerCreation(self $employee): void
    {
        $partner = $employee->partner()->create([
            'account_type' => 'individual',
            'sub_type'     => 'employee',
            'creator_id'   => $employee->creator_id ?? Auth::id(),
            'name'         => $employee?->name,
            'email'        => $employee?->work_email ?? $employee?->private_email,
            'job_title'    => $employee?->job_title,
            'phone'        => $employee?->work_phone,
            'mobile'       => $employee?->mobile_phone,
            'color'        => $employee?->color,
            'parent_id'    => $employee?->parent_id,
            'company_id'   => $employee?->company_id,
            'user_id'      => $employee?->user_id,
        ]);

        $employee->partner_id = $partner->id;
        $employee->save();
    }

    private function handlePartnerUpdation(self $employee): void
    {
        $partner = Partner::updateOrCreate(
            ['id' => $employee->partner_id],
            [
                'account_type' => 'individual',
                'sub_type'     => 'employee',
                'creator_id'   => $employee->creator_id ?? Auth::id(),
                'name'         => $employee?->name,
                'email'        => $employee?->work_email ?? $employee?->private_email,
                'job_title'    => $employee?->job_title,
                'phone'        => $employee?->work_phone,
                'mobile'       => $employee?->mobile_phone,
                'color'        => $employee?->color,
                'parent_id'    => $employee?->parent_id,
                'company_id'   => $employee?->company_id,
                'user_id'      => $employee?->user_id,
            ]
        );

        if ($employee->partner_id !== $partner->id) {
            $employee->partner_id = $partner->id;
            $employee->save();
        }
    }

    private function ensureUserAccount(): void
    {
        if ($this->user_id) {
            $this->ensureUserAccessContext($this->user);
            $this->ensureEmployeeRole($this->user);

            return;
        }

        $email = $this->resolveEmployeeLoginEmail();
        $defaultCompanyId = $this->company_id ?: app(UserSettings::class)->default_company_id;

        $user = User::query()->create([
            'name'               => $this->name ?: 'Employee #'.$this->id,
            'email'              => $email,
            'password'           => Str::password(16),
            'is_active'          => (bool) $this->is_active,
            'default_company_id' => $defaultCompanyId,
        ]);

        $this->user_id = $user->id;
        $this->saveQuietly();

        $this->ensureUserAccessContext($user);
        $this->ensureEmployeeRole($user);
        $this->sendEmployeeInvitation($user);
    }

    private function ensureEmployeeRole(?User $user): void
    {
        if (! $user) {
            return;
        }

        $defaultRoleId = app(UserSettings::class)->default_role_id;

        if ($defaultRoleId && ! $user->roles()->whereKey($defaultRoleId)->exists()) {
            $user->assignRole($defaultRoleId);

            return;
        }

        $employeeRole = Role::query()
            ->whereRaw('LOWER(name) = ?', ['employee'])
            ->first();

        if (! $employeeRole) {
            return;
        }

        if ($user->roles()->whereKey($employeeRole->id)->exists()) {
            return;
        }

        $user->assignRole($employeeRole);
    }

    private function ensureUserAccessContext(?User $user): void
    {
        if (! $user) {
            return;
        }

        $defaultCompanyId = $this->company_id ?: app(UserSettings::class)->default_company_id;

        if ($defaultCompanyId && ! $user->default_company_id) {
            $user->default_company_id = $defaultCompanyId;
            $user->saveQuietly();
        }

        if ($defaultCompanyId) {
            $user->allowedCompanies()->syncWithoutDetaching([$defaultCompanyId]);
        }
    }

    private function sendEmployeeInvitation(User $user): void
    {
        if (! filter_var($user->email, FILTER_VALIDATE_EMAIL) || str_ends_with($user->email, '@employee.local')) {
            return;
        }

        $invitation = Invitation::query()->firstOrCreate([
            'email' => $user->email,
        ]);

        Mail::to($invitation->email)->send(new UserInvitationMail($invitation));
    }

    private function resolveEmployeeLoginEmail(): string
    {
        $preferredEmails = array_filter([
            $this->work_email,
            $this->private_email,
        ]);

        foreach ($preferredEmails as $preferredEmail) {
            if (! User::query()->where('email', $preferredEmail)->exists()) {
                return $preferredEmail;
            }
        }

        $baseLocalPart = Str::slug($this->name ?: 'employee-'.$this->id, separator: '.');
        $baseLocalPart = $baseLocalPart !== '' ? $baseLocalPart : 'employee-'.$this->id;

        $counter = 0;

        do {
            $suffix = $counter === 0 ? '' : '.'.$counter;
            $candidate = "{$baseLocalPart}{$suffix}@employee.local";
            $counter++;
        } while (User::query()->where('email', $candidate)->exists());

        return $candidate;
    }
}
