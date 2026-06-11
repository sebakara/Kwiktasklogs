<?php

namespace Webkul\Performance\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Chatter\Traits\HasChatter;
use Webkul\Chatter\Traits\HasLogActivity;
use Webkul\Security\Models\User;

class Kpi extends Model
{
    use HasChatter, HasLogActivity, SoftDeletes;

    protected $table = 'performance_kpis';

    public function getModelTitle(): string
    {
        return $this->name ?? 'KPI';
    }

    protected $fillable = [
        'name',
        'description',
        'target_value',
        'current_value',
        'unit',
        'period',
        'owner_id',
        'creator_id',
    ];

    protected $casts = [
        'target_value'  => 'decimal:2',
        'current_value' => 'decimal:2',
    ];

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function getProgressAttribute(): float
    {
        if ((float) $this->target_value == 0) {
            return 0;
        }

        return min(100, round(((float) $this->current_value / (float) $this->target_value) * 100, 1));
    }

    public function getStatusAttribute(): string
    {
        $progress = $this->progress;

        return match (true) {
            $progress >= 80 => 'on_track',
            $progress >= 50 => 'at_risk',
            default         => 'off_track',
        };
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (self $kpi): void {
            $kpi->creator_id ??= Auth::id();
        });
    }
}
