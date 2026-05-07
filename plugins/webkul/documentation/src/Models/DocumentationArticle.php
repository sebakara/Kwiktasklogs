<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationArticle extends Model
{
    use SoftDeletes;

    protected $table = 'documentation_articles';

    protected $fillable = [
        'title',
        'slug',
        'module',
        'project_id',
        'audience',
        'summary',
        'content',
        'is_published',
        'published_at',
        'sort_order',
        'creator_id',
        'assignee_id',
    ];

    protected $casts = [
        'is_published' => 'boolean',
        'published_at' => 'datetime',
        'sort_order'   => 'integer',
    ];

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'project_id');
    }

    public function assignee(): BelongsTo
    {
        return $this->belongsTo(User::class, 'assignee_id');
    }

    /**
     * Whether this feature was recorded as authored by the user assigned as the
     * project's documentation assignee (same employee responsible for project docs).
     */
    public function isAuthoredByProjectDocumentationAssignee(): bool
    {
        if (! $this->creator_id || ! $this->project_id) {
            return false;
        }

        $documentationAssigneeId = $this->relationLoaded('project')
            ? $this->project?->documentation_assignee_id
            : Project::query()->whereKey($this->project_id)->value('documentation_assignee_id');

        if ($documentationAssigneeId === null) {
            return false;
        }

        return (int) $documentationAssigneeId === (int) $this->creator_id;
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

        static::creating(function (DocumentationArticle $article): void {
            $article->creator_id ??= Auth::id();
        });
    }
}
