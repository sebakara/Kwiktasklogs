<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationPermissionFactory;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\Team;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationPermission extends Model
{
    use HasFactory;

    protected $table = 'documentation_permissions';

    protected $fillable = [
        'permission',
        'permissionable_type',
        'permissionable_id',
        'user_id',
        'team_id',
        'role_id',
        'company_id',
        'creator_id',
    ];

    protected $casts = [
        'permission' => DocumentationPermissionLevel::class,
    ];

    public function permissionable(): MorphTo
    {
        return $this->morphTo();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function team(): BelongsTo
    {
        return $this->belongsTo(Team::class, 'team_id');
    }

    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class, 'role_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationPermission $permission): void {
            $permission->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationPermissionFactory
    {
        return DocumentationPermissionFactory::new();
    }
}
