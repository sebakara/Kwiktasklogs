<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationTagFactory;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationTag extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'documentation_tags';

    protected $fillable = [
        'name',
        'slug',
        'color',
        'sort_order',
        'company_id',
        'creator_id',
    ];

    protected $casts = [
        'sort_order' => 'integer',
    ];

    public function pages(): BelongsToMany
    {
        return $this->belongsToMany(
            DocumentationPage::class,
            'documentation_page_tags',
            'tag_id',
            'page_id',
        );
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

        static::creating(function (DocumentationTag $tag): void {
            $tag->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationTagFactory
    {
        return DocumentationTagFactory::new();
    }
}
