<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Webkul\Security\Models\User;

class DocumentUser extends Pivot
{
    protected $table = 'document_user';

    public $incrementing = true;

    protected $fillable = [
        'document_id',
        'user_id',
        'status',
        'viewed_at',
        'signed_at',
    ];

    protected $casts = [
        'viewed_at' => 'datetime',
        'signed_at' => 'datetime',
    ];

    public function document(): BelongsTo
    {
        return $this->belongsTo(Document::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function signature(): HasOne
    {
        return $this->hasOne(Signature::class, 'document_user_id');
    }
}
