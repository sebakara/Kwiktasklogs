<?php

namespace Webkul\Performance\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Chatter\Traits\HasChatter;
use Webkul\Chatter\Traits\HasLogActivity;
use Webkul\Security\Models\User;

class Objective extends Model
{
    use HasChatter, HasLogActivity, SoftDeletes;

    protected $table = 'performance_objectives';

    public function getModelTitle(): string
    {
        return $this->title ?? 'Objective';
    }

    protected $fillable = [
        'title',
        'description',
        'owner_id',
        'start_date',
        'end_date',
        'status',
        'creator_id',
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date'   => 'date',
    ];

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function keyResults(): HasMany
    {
        return $this->hasMany(KeyResult::class);
    }

    public function getProgressAttribute(): float
    {
        $keyResults = $this->relationLoaded('keyResults') ? $this->keyResults : $this->keyResults()->get();

        if ($keyResults->isEmpty()) {
            return 0;
        }

        return round($keyResults->avg(fn (KeyResult $kr) => $kr->progress), 1);
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (self $objective): void {
            $objective->creator_id ??= Auth::id();
        });
    }
}
