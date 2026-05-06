<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Webkul\Employee\Enums\EmployeeDocumentStatus;
use Webkul\Employee\Models\EmployeeDocument;

class EmployeeDocumentSignatureVerificationController extends Controller
{
    public function __invoke(Request $request, EmployeeDocument $document): View
    {
        $status = 'invalid';
        $message = 'The signed document could not be verified.';
        $computedSha256 = null;

        if ($document->status !== EmployeeDocumentStatus::Signed->value) {
            $message = 'This document is not marked as signed.';

            return view('employee-documents/verify-signature', compact('document', 'status', 'message', 'computedSha256'));
        }

        if (! $document->signed_file_path || ! $document->signed_file_sha256) {
            $message = 'Signature verification data is incomplete for this document.';

            return view('employee-documents/verify-signature', compact('document', 'status', 'message', 'computedSha256'));
        }

        $absoluteSigned = public_path(ltrim($document->signed_file_path, '/'));

        if (! is_file($absoluteSigned) || ! is_readable($absoluteSigned)) {
            $message = 'Signed file was not found on storage.';

            return view('employee-documents/verify-signature', compact('document', 'status', 'message', 'computedSha256'));
        }

        $computedSha256 = hash_file('sha256', $absoluteSigned) ?: null;

        if ($computedSha256 !== null && hash_equals($document->signed_file_sha256, $computedSha256)) {
            $status = 'valid';
            $message = 'Signature verified successfully. File integrity matches recorded hash.';
        } else {
            $message = 'File integrity mismatch detected. This signed file may have been altered.';
        }

        return view('employee-documents/verify-signature', compact('document', 'status', 'message', 'computedSha256'));
    }
}
