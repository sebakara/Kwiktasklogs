<?php

namespace Webkul\Performance\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class KeyResult extends Model
{
    use SoftDeletes;

    protected $table = 'performance_key_results';

    protected $fillable = [
        'objective_id',
        'title',
        'target_value',
        'current_value',
        'unit',
    ];

    protected $casts = [
        'target_value'  => 'decimal:2',
        'current_value' => 'decimal:2',
    ];

    public function objective(): BelongsTo
    {
        return $this->belongsTo(Objective::class);
    }

    public function getProgressAttribute(): float
    {
        $target = (float) $this->target_value;

        if ($target == 0) {
            return 0;
        }

        return min(100, round(((float) $this->current_value / $target) * 100, 1));
    }
}
