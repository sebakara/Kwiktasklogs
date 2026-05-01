<?php

namespace Webkul\Employee\Enums;

enum EmployeeReviewPeriodType: string
{
    case Monthly = 'monthly';
    case Quarterly = 'quarterly';
    case MidYear = 'mid_year';
    case Yearly = 'yearly';
    case Custom = 'custom';

    public function getLabel(): string
    {
        return match ($this) {
            self::Monthly => __('employees::enums/employee-review-period-type.monthly'),
            self::Quarterly => __('employees::enums/employee-review-period-type.quarterly'),
            self::MidYear => __('employees::enums/employee-review-period-type.mid-year'),
            self::Yearly => __('employees::enums/employee-review-period-type.yearly'),
            self::Custom => __('employees::enums/employee-review-period-type.custom'),
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
