<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;
use Webkul\Documentation\Database\Factories\DocumentationAttachmentFactory;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationAttachment extends Model
{
    use HasFactory;

    protected $table = 'documentation_attachments';

    protected $fillable = [
        'name',
        'file_path',
        'original_file_name',
        'mime_type',
        'file_size',
        'page_id',
        'page_version_id',
        'company_id',
        'creator_id',
    ];

    protected $casts = [
        'file_size' => 'integer',
    ];

    public function page(): BelongsTo
    {
        return $this->belongsTo(DocumentationPage::class, 'page_id');
    }

    public function pageVersion(): BelongsTo
    {
        return $this->belongsTo(DocumentationPageVersion::class, 'page_version_id');
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

        static::creating(function (DocumentationAttachment $attachment): void {
            $attachment->creator_id ??= Auth::id();
        });
    }

    protected static function newFactory(): DocumentationAttachmentFactory
    {
        return DocumentationAttachmentFactory::new();
    }
}
