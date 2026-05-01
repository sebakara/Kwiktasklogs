<?php

namespace Webkul\Employee\Services;

use Carbon\Carbon;
use InvalidArgumentException;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;

class EmployeeReviewPeriodResolver
{
    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    public function resolve(EmployeeReviewPeriodType $type, Carbon $referenceDate): array
    {
        $reference = $referenceDate->copy()->startOfDay();

        return match ($type) {
            EmployeeReviewPeriodType::Monthly => $this->monthly($reference),
            EmployeeReviewPeriodType::Quarterly => $this->quarterly($reference),
            EmployeeReviewPeriodType::MidYear => $this->midYear($reference),
            EmployeeReviewPeriodType::Yearly => $this->yearly($reference),
            EmployeeReviewPeriodType::Custom => throw new InvalidArgumentException('Use resolveCustom for custom period type.'),
        };
    }

    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    public function resolveCustom(Carbon $start, Carbon $end): array
    {
        if ($end->lt($start)) {
            throw new InvalidArgumentException('Custom period end must be on or after the start date.');
        }

        $from = $start->copy()->startOfDay();
        $to = $end->copy()->endOfDay();

        return [
            'start' => $from,
            'end' => $to,
            'label' => $from->toDateString().' — '.$to->toDateString(),
        ];
    }

    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    protected function monthly(Carbon $reference): array
    {
        $start = $reference->copy()->startOfMonth();
        $end = $reference->copy()->endOfMonth();

        return [
            'start' => $start,
            'end' => $end,
            'label' => $start->format('Y-m'),
        ];
    }

    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    protected function quarterly(Carbon $reference): array
    {
        $quarter = (int) ceil($reference->month / 3);
        $startMonth = ($quarter - 1) * 3 + 1;

        $start = $reference->copy()->month($startMonth)->startOfMonth();
        $end = $start->copy()->addMonths(2)->endOfMonth();

        return [
            'start' => $start,
            'end' => $end,
            'label' => $start->format('Y').'-Q'.$quarter,
        ];
    }

    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    protected function midYear(Carbon $reference): array
    {
        $year = $reference->year;

        if ($reference->month <= 6) {
            $start = Carbon::create($year, 1, 1)->startOfDay();
            $end = Carbon::create($year, 6, 30)->endOfDay();
            $label = $year.'-H1';
        } else {
            $start = Carbon::create($year, 7, 1)->startOfDay();
            $end = Carbon::create($year, 12, 31)->endOfDay();
            $label = $year.'-H2';
        }

        return [
            'start' => $start,
            'end' => $end,
            'label' => $label,
        ];
    }

    /**
     * @return array{start: Carbon, end: Carbon, label: string}
     */
    protected function yearly(Carbon $reference): array
    {
        $start = $reference->copy()->startOfYear();
        $end = $reference->copy()->endOfYear();

        return [
            'start' => $start,
            'end' => $end,
            'label' => (string) $start->year,
        ];
    }
}
