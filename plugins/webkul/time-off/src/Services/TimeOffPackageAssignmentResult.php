<?php

namespace Webkul\TimeOff\Services;

use Webkul\TimeOff\Models\TimeOffPackageAssignment;

final class TimeOffPackageAssignmentResult
{
    /**
     * @param  array<int, TimeOffPackageAssignment>  $assignments
     * @param  array<int, string>  $messages
     */
    public function __construct(
        public int $employeesProcessed = 0,
        public int $allocationsCreated = 0,
        public int $allocationsSkipped = 0,
        public array $assignments = [],
        public array $messages = [],
    ) {}

    public function hasWarnings(): bool
    {
        return $this->allocationsSkipped > 0 || $this->messages !== [];
    }
}
