<?php

namespace Webkul\Employee\Enums;

enum EmployeeReviewStatus: string
{
    case Draft = 'draft';
    case Finalized = 'finalized';

    public function getLabel(): string
    {
        return match ($this) {
            self::Draft => __('employees::enums/employee-review-status.draft'),
            self::Finalized => __('employees::enums/employee-review-status.finalized'),
        };
    }

    /**
     * @return array<string, string>
     */
    public static function options(): array
    {
        $options = [];

        foreach (self::cases() as $case) {
            $options[$case->value] = $case->getLabel();
        }

        return $options;
    }
}
