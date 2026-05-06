<?php

namespace Webkul\Employee\Enums;

enum EmployeeDocumentStatus: string
{
    case Draft = 'draft';
    case PendingSignature = 'pending_signature';
    case Signed = 'signed';

    public function getLabel(): string
    {
        return match ($this) {
            self::Draft            => __('employees::enums/employee-document-status.draft'),
            self::PendingSignature => __('employees::enums/employee-document-status.pending-signature'),
            self::Signed           => __('employees::enums/employee-document-status.signed'),
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
