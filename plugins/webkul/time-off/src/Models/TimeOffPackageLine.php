<?php

namespace Webkul\TimeOff\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Webkul\TimeOff\Database\Factories\TimeOffPackageLineFactory;

class TimeOffPackageLine extends Model
{
    use HasFactory;

    protected $table = 'time_off_package_lines';

    protected $fillable = [
        'package_id',
        'leave_type_id',
        'number_of_days',
        'sort',
    ];

    protected $casts = [
        'number_of_days' => 'decimal:4',
    ];

    public function package(): BelongsTo
    {
        return $this->belongsTo(TimeOffPackage::class, 'package_id');
    }

    public function leaveType(): BelongsTo
    {
        return $this->belongsTo(LeaveType::class, 'leave_type_id');
    }

    protected static function newFactory(): TimeOffPackageLineFactory
    {
        return TimeOffPackageLineFactory::new();
    }
}
