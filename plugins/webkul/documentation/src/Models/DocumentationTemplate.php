<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationTemplateFactory;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationTemplate extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'documentation_templates';

    protected $fillable = [
        'name',
        'slug',
        'description',
        'content',
        'module',
        'is_active',
        'company_id',
        'creator_id',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    public function pages(): HasMany
    {
        return $this->hasMany(DocumentationPage::class, 'template_id');
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
        return $query->where('is_active', true);
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationTemplate $template): void {
            $template->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationTemplateFactory
    {
        return DocumentationTemplateFactory::new();
    }
}
