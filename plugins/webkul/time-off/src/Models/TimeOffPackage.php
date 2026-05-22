<?php

namespace Webkul\TimeOff\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Auth;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;
use Webkul\TimeOff\Database\Factories\TimeOffPackageFactory;

class TimeOffPackage extends Model
{
    use HasFactory;

    protected $table = 'time_off_packages';

    protected $fillable = [
        'company_id',
        'creator_id',
        'name',
        'description',
        'valid_from',
        'valid_to',
        'is_active',
    ];

    protected $casts = [
        'valid_from' => 'date',
        'valid_to'   => 'date',
        'is_active'  => 'boolean',
    ];

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function lines(): HasMany
    {
        return $this->hasMany(TimeOffPackageLine::class, 'package_id')->orderBy('sort');
    }

    public function assignments(): HasMany
    {
        return $this->hasMany(TimeOffPackageAssignment::class, 'package_id');
    }

    public function allocations(): HasMany
    {
        return $this->hasMany(LeaveAllocation::class, 'package_id');
    }

    public function totalDaysPerEmployee(): float
    {
        return (float) $this->lines()->sum('number_of_days');
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (TimeOffPackage $package): void {
            $package->creator_id ??= Auth::id();
            $package->company_id ??= Auth::user()?->default_company_id;
        });
    }

    protected static function newFactory(): TimeOffPackageFactory
    {
        return TimeOffPackageFactory::new();
    }
}
