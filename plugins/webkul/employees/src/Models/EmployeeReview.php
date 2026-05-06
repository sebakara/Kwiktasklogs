<?php

namespace Webkul\Employee\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Webkul\Employee\Database\Factories\EmployeeReviewFactory;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Enums\EmployeeReviewStatus;
use Webkul\Security\Models\User;
use Webkul\Support\Models\Company;

class EmployeeReview extends Model
{
    /** @use HasFactory<EmployeeReviewFactory> */
    use HasFactory;

    protected $table = 'employees_reviews';

    protected $fillable = [
        'employee_id',
        'reviewer_id',
        'period_type',
        'period_start',
        'period_end',
        'period_label',
        'metrics_snapshot',
        'manager_rating',
        'manager_comments',
        'status',
        'company_id',
    ];

    public function getModelTitle(): string
    {
        return __('employees::models/employee-review.title');
    }

    protected function casts(): array
    {
        return [
            'period_start'     => 'date',
            'period_end'       => 'date',
            'period_type'      => EmployeeReviewPeriodType::class,
            'status'           => EmployeeReviewStatus::class,
            'metrics_snapshot' => 'array',
            'manager_rating'   => 'decimal:2',
        ];
    }

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class, 'employee_id');
    }

    public function reviewer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reviewer_id');
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    protected static function newFactory(): EmployeeReviewFactory
    {
        return EmployeeReviewFactory::new();
    }
}
