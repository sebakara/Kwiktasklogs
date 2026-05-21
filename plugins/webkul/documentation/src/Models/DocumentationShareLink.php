<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationShareLinkFactory;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationShareLink extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'documentation_share_links';

    protected $fillable = [
        'token',
        'visibility',
        'password',
        'expires_at',
        'max_views',
        'view_count',
        'is_active',
        'page_id',
        'company_id',
        'creator_id',
    ];

    protected $hidden = [
        'password',
    ];

    protected $casts = [
        'visibility' => DocumentationShareLinkVisibility::class,
        'expires_at' => 'datetime',
        'max_views'  => 'integer',
        'view_count' => 'integer',
        'is_active'  => 'boolean',
    ];

    public function page(): BelongsTo
    {
        return $this->belongsTo(DocumentationPage::class, 'page_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    /**
     * @param  Builder<self>  $query
     * @return Builder<self>
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query
            ->where('is_active', true)
            ->where(function (Builder $query): void {
                $query->whereNull('expires_at')
                    ->orWhere('expires_at', '>', now());
            });
    }

    public function isExpired(): bool
    {
        return $this->expires_at !== null && $this->expires_at->isPast();
    }

    public function hasReachedViewLimit(): bool
    {
        return $this->max_views !== null && $this->view_count >= $this->max_views;
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationShareLink $link): void {
            $link->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationShareLinkFactory
    {
        return DocumentationShareLinkFactory::new();
    }
}
