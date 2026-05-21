<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationPageFactory;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationPage extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'documentation_pages';

    protected $fillable = [
        'title',
        'slug',
        'summary',
        'content',
        'status',
        'module',
        'audience',
        'is_published',
        'published_at',
        'sort_order',
        'space_id',
        'parent_id',
        'template_id',
        'project_id',
        'company_id',
        'creator_id',
        'last_editor_id',
    ];

    protected $casts = [
        'status'       => DocumentationPageStatus::class,
        'is_published' => 'boolean',
        'published_at' => 'datetime',
        'sort_order'   => 'integer',
    ];

    public function space(): BelongsTo
    {
        return $this->belongsTo(DocumentationSpace::class, 'space_id');
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(self::class, 'parent_id');
    }

    public function template(): BelongsTo
    {
        return $this->belongsTo(DocumentationTemplate::class, 'template_id');
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function lastEditor(): BelongsTo
    {
        return $this->belongsTo(User::class, 'last_editor_id');
    }

    public function versions(): HasMany
    {
        return $this->hasMany(DocumentationPageVersion::class, 'page_id');
    }

    public function tags(): BelongsToMany
    {
        return $this->belongsToMany(
            DocumentationTag::class,
            'documentation_page_tags',
            'page_id',
            'tag_id',
        );
    }

    public function attachments(): HasMany
    {
        return $this->hasMany(DocumentationAttachment::class, 'page_id');
    }

    public function shareLinks(): HasMany
    {
        return $this->hasMany(DocumentationShareLink::class, 'page_id');
    }

    public function permissions(): MorphMany
    {
        return $this->morphMany(DocumentationPermission::class, 'permissionable');
    }

    public function auditLogs(): HasMany
    {
        return $this->hasMany(DocumentationAuditLog::class, 'page_id');
    }

    /**
     * @param  Builder<self>  $query
     * @return Builder<self>
     */
    public function scopePublished(Builder $query): Builder
    {
        return $query->where('is_published', true);
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationPage $page): void {
            $page->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationPageFactory
    {
        return DocumentationPageFactory::new();
    }
}
