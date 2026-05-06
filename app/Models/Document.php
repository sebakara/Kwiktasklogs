<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Webkul\Security\Models\User;

class Document extends Model
{
    protected $fillable = [
        'uploaded_by_user_id',
        'parent_document_id',
        'title',
        'file_path',
        'file_name',
        'file_hash_sha256',
        'version',
    ];

    public function uploader(): BelongsTo
    {
        return $this->belongsTo(User::class, 'uploaded_by_user_id');
    }

    public function parentDocument(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_document_id');
    }

    public function versions(): HasMany
    {
        return $this->hasMany(self::class, 'parent_document_id');
    }

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'document_user')
            ->using(DocumentUser::class)
            ->withPivot(['id', 'status', 'viewed_at', 'signed_at'])
            ->withTimestamps();
    }

    public function assignments(): HasMany
    {
        return $this->hasMany(DocumentUser::class);
    }

    public function auditLogs(): HasMany
    {
        return $this->hasMany(AuditLog::class);
    }
}
