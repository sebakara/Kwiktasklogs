<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationSpaceFactory;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationSpace extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'documentation_spaces';

    protected $fillable = [
        'name',
        'slug',
        'description',
        'visibility',
        'icon',
        'color',
        'sort_order',
        'is_active',
        'parent_id',
        'project_id',
        'product_id',
        'company_id',
        'creator_id',
    ];

    protected $casts = [
        'visibility'  => DocumentationSpaceVisibility::class,
        'sort_order'  => 'integer',
        'is_active'   => 'boolean',
    ];

    public function parent(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(self::class, 'parent_id');
    }

    public function pages(): HasMany
    {
        return $this->hasMany(DocumentationPage::class, 'space_id');
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(DocumentationProduct::class, 'product_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function permissions(): MorphMany
    {
        return $this->morphMany(DocumentationPermission::class, 'permissionable');
    }

    public function auditLogs(): HasMany
    {
        return $this->hasMany(DocumentationAuditLog::class, 'space_id');
    }

    /**
     * @param  Builder<self>  $query
     * @return Builder<self>
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationSpace $space): void {
            $space->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationSpaceFactory
    {
        return DocumentationSpaceFactory::new();
    }
}
