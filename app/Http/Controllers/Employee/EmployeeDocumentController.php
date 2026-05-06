<?php

namespace App\Http\Controllers\Employee;

use App\Http\Controllers\Controller;
use App\Http\Requests\SignDocumentRequest;
use App\Models\DocumentUser;
use App\Services\AuditService;
use App\Services\SignatureService;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class EmployeeDocumentController extends Controller
{
    public function __construct(
        private SignatureService $signatureService,
        private AuditService $auditService
    ) {}

    public function index(): View
    {
        $assignments = DocumentUser::query()
            ->where('user_id', Auth::id())
            ->with(['document', 'signature'])
            ->latest()
            ->paginate(15);

        return view('documents.employee.index', [
            'assignments' => $assignments,
        ]);
    }

    public function show(Request $request, DocumentUser $assignment): View
    {
        $this->authorizeAssignment($assignment);

        if ($assignment->status === 'pending') {
            $assignment->update([
                'status'    => 'viewed',
                'viewed_at' => now(),
            ]);

            $this->auditService->log(
                action: 'viewed',
                user: $request->user(),
                request: $request,
                document: $assignment->document,
                assignment: $assignment
            );
        }

        return view('documents.employee.show', [
            'assignment' => $assignment->load(['document', 'signature']),
        ]);
    }

    public function file(DocumentUser $assignment): BinaryFileResponse
    {
        $this->authorizeAssignment($assignment);

        $absolutePath = Storage::disk('local')->path($assignment->document->file_path);
        $currentHash = hash_file('sha256', $absolutePath);

        abort_if($currentHash !== $assignment->document->file_hash_sha256, 409, 'Document integrity check failed.');

        return response()->file($absolutePath);
    }

    public function sign(SignDocumentRequest $request, DocumentUser $assignment): RedirectResponse
    {
        $this->authorizeAssignment($assignment);

        if ($assignment->status === 'signed') {
            return back()->withErrors(['signed_name' => 'This document has already been signed.']);
        }

        $signature = $this->signatureService->signAssignment($assignment, [
            'signed_name'    => $request->string('signed_name')->toString(),
            'signature_data' => $request->input('signature_data'),
            'agree'          => (bool) $request->boolean('agree'),
        ], $request);

        $this->auditService->log(
            action: 'signed',
            user: $request->user(),
            request: $request,
            document: $assignment->document,
            assignment: $assignment,
            metadata: [
                'signature_id' => $signature->id,
            ]
        );

        return redirect()
            ->route('employee.documents.show', $assignment)
            ->with('status', 'Document signed and sent back successfully.');
    }

    private function authorizeAssignment(DocumentUser $assignment): void
    {
        abort_if((int) $assignment->user_id !== (int) Auth::id(), 403);
    }
}
