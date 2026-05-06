<?php

use Carbon\Carbon;
use Webkul\Employee\Enums\EmployeeReviewPeriodType;
use Webkul\Employee\Services\EmployeeReviewPeriodResolver;

it('resolves monthly calendar period', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2026-05-15');
    $period = $resolver->resolve(EmployeeReviewPeriodType::Monthly, $reference);

    expect($period['start']->toDateString())->toBe('2026-05-01')
        ->and($period['end']->toDateString())->toBe('2026-05-31')
        ->and($period['label'])->toBe('2026-05');
});

it('resolves quarterly period for May', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2026-05-10');
    $period = $resolver->resolve(EmployeeReviewPeriodType::Quarterly, $reference);

    expect($period['start']->toDateString())->toBe('2026-04-01')
        ->and($period['end']->toDateString())->toBe('2026-06-30')
        ->and($period['label'])->toBe('2026-Q2');
});

it('resolves mid-year first half', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2026-05-01');
    $period = $resolver->resolve(EmployeeReviewPeriodType::MidYear, $reference);

    expect($period['start']->toDateString())->toBe('2026-01-01')
        ->and($period['end']->toDateString())->toBe('2026-06-30')
        ->and($period['label'])->toBe('2026-H1');
});

it('resolves mid-year second half', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2026-08-15');
    $period = $resolver->resolve(EmployeeReviewPeriodType::MidYear, $reference);

    expect($period['start']->toDateString())->toBe('2026-07-01')
        ->and($period['end']->toDateString())->toBe('2026-12-31')
        ->and($period['label'])->toBe('2026-H2');
});

it('resolves yearly period', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2026-03-20');
    $period = $resolver->resolve(EmployeeReviewPeriodType::Yearly, $reference);

    expect($period['start']->toDateString())->toBe('2026-01-01')
        ->and($period['end']->toDateString())->toBe('2026-12-31')
        ->and($period['label'])->toBe('2026');
});

it('resolves leap year February monthly period', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $reference = Carbon::parse('2024-02-15');
    $period = $resolver->resolve(EmployeeReviewPeriodType::Monthly, $reference);

    expect($period['start']->toDateString())->toBe('2024-02-01')
        ->and($period['end']->toDateString())->toBe('2024-02-29');
});

it('resolves custom period', function () {
    $resolver = app(EmployeeReviewPeriodResolver::class);
    $period = $resolver->resolveCustom(
        Carbon::parse('2026-01-10'),
        Carbon::parse('2026-02-20')
    );

    expect($period['start']->toDateString())->toBe('2026-01-10')
        ->and($period['end']->toDateString())->toBe('2026-02-20')
        ->and($period['label'])->toContain('2026-01-10');
});
