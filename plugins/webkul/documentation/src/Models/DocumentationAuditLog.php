<?php

namespace Webkul\Documentation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Webkul\Documentation\Database\Factories\DocumentationAuditLogFactory;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class DocumentationAuditLog extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'documentation_audit_logs';

    protected $fillable = [
        'action',
        'ip_address',
        'user_agent',
        'metadata',
        'space_id',
        'page_id',
        'user_id',
        'company_id',
        'created_at',
    ];

    protected $casts = [
        'action'     => DocumentationAuditAction::class,
        'metadata'   => 'array',
        'created_at' => 'datetime',
    ];

    public function space(): BelongsTo
    {
        return $this->belongsTo(DocumentationSpace::class, 'space_id');
    }

    public function page(): BelongsTo
    {
        return $this->belongsTo(DocumentationPage::class, 'page_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    protected static function newFactory(): DocumentationAuditLogFactory
    {
        return DocumentationAuditLogFactory::new();
    }
}
