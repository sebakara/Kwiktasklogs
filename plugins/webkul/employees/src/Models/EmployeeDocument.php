<?php

namespace Webkul\Employee\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;
use Webkul\Employee\Enums\EmployeeDocumentStatus;
use Webkul\Security\Models\User;

class EmployeeDocument extends Model
{
    public const ORIGINAL_STORAGE_DIRECTORY = 'employees/documents/original';

    public const SIGNED_STORAGE_DIRECTORY = 'employees/documents/signed';

    protected $table = 'employees_employee_documents';

    protected $fillable = [
        'employee_id',
        'creator_id',
        'requested_by_user_id',
        'signed_by_user_id',
        'signed_name',
        'signed_ip_address',
        'signed_user_agent',
        'signature_hash',
        'signed_file_sha256',
        'title',
        'document_type',
        'status',
        'original_file_path',
        'signed_file_path',
        'notes',
        'sent_at',
        'signed_at',
    ];

    protected $casts = [
        'sent_at'   => 'datetime',
        'signed_at' => 'datetime',
    ];

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class, 'employee_id');
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function requestedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'requested_by_user_id');
    }

    public function signedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'signed_by_user_id');
    }

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function (self $employeeDocument): void {
            $employeeDocument->creator_id ??= Auth::id();
            $employeeDocument->requested_by_user_id ??= Auth::id();
            $employeeDocument->status ??= EmployeeDocumentStatus::Draft->value;
        });
    }
}
