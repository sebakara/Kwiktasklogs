<?php

namespace Webkul\Employee\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class EmployeeChatMessage extends Model
{
    protected $table = 'employees_chat_messages';

    protected $fillable = [
        'sender_id',
        'recipient_id',
        'company_id',
        'body',
        'read_at',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'read_at' => 'datetime',
        ];
    }

    public function sender(): BelongsTo
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    public function recipient(): BelongsTo
    {
        return $this->belongsTo(User::class, 'recipient_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    /**
     * @param  Builder<self>  $query
     * @return Builder<self>
     */
    public function scopeBetweenUsers(Builder $query, int $userAId, int $userBId): Builder
    {
        return $query->where(function (Builder $inner) use ($userAId, $userBId): void {
            $inner->where(function (Builder $q) use ($userAId, $userBId): void {
                $q->where('sender_id', $userAId)->where('recipient_id', $userBId);
            })->orWhere(function (Builder $q) use ($userAId, $userBId): void {
                $q->where('sender_id', $userBId)->where('recipient_id', $userAId);
            });
        });
    }
}
