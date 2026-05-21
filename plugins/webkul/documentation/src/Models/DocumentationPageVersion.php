<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationPageVersionFactory;
use Webkul\Security\Models\User;

class DocumentationPageVersion extends Model
{
    use HasFactory;

    protected $table = 'documentation_page_versions';

    protected $fillable = [
        'version_number',
        'title',
        'summary',
        'content',
        'change_note',
        'page_id',
        'creator_id',
    ];

    protected $casts = [
        'version_number' => 'integer',
    ];

    public function page(): BelongsTo
    {
        return $this->belongsTo(DocumentationPage::class, 'page_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function attachments(): HasMany
    {
        return $this->hasMany(DocumentationAttachment::class, 'page_version_id');
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (DocumentationPageVersion $version): void {
            $version->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationPageVersionFactory
    {
        return DocumentationPageVersionFactory::new();
    }
}
