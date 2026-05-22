<?php

namespace Webkul\TimeOff\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\User;
use Webkul\TimeOff\Database\Factories\TimeOffPackageAssignmentFactory;

class TimeOffPackageAssignment extends Model
{
    use HasFactory;

    protected $table = 'time_off_package_assignments';

    protected $fillable = [
        'package_id',
        'employee_id',
        'assigned_by',
        'auto_approved',
        'allocations_created',
        'allocations_skipped',
        'notes',
    ];

    protected $casts = [
        'auto_approved' => 'boolean',
    ];

    public function package(): BelongsTo
    {
        return $this->belongsTo(TimeOffPackage::class, 'package_id');
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class, 'employee_id');
    }

    public function assignedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'assigned_by');
    }

    public function allocations(): HasMany
    {
        return $this->hasMany(LeaveAllocation::class, 'package_assignment_id');
    }

    protected static function newFactory(): TimeOffPackageAssignmentFactory
    {
        return TimeOffPackageAssignmentFactory::new();
    }
}
