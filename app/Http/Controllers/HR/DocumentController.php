<?php

namespace App\Http\Controllers\HR;

use App\Http\Controllers\Controller;
use App\Http\Requests\AssignDocumentRequest;
use App\Http\Requests\StoreDocumentRequest;
use App\Models\Document;
use App\Services\AuditService;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Webkul\Security\Models\User;

class DocumentController extends Controller
{
    public function __construct(private AuditService $auditService) {}

    public function index(Request $request): View
    {
        $this->authorize('viewAny', Document::class);

        $documents = Document::query()
            ->with(['uploader', 'assignments.user'])
            ->latest()
            ->paginate(15);

        $employees = User::query()
            ->whereHas('roles', function ($query): void {
                $query->whereRaw('LOWER(name) = ?', ['employee']);
            })
            ->orderBy('name')
            ->get(['id', 'name', 'email']);

        return view('documents.hr.index', [
            'documents' => $documents,
            'employees' => $employees,
        ]);
    }

    public function store(StoreDocumentRequest $request): RedirectResponse
    {
        $this->authorize('create', Document::class);

        $file = $request->file('file');
        $storedPath = $file->storeAs(
            'documents/uploads',
            now()->format('YmdHis').'-'.$file->getClientOriginalName(),
            'local'
        );

        $absolutePath = Storage::disk('local')->path($storedPath);
        $parentId = $request->integer('parent_document_id') ?: null;

        $version = 1;

        if ($parentId) {
            $version = (int) Document::query()
                ->where('id', $parentId)
                ->orWhere('parent_document_id', $parentId)
                ->max('version') + 1;
        }

        $document = Document::query()->create([
            'uploaded_by_user_id' => Auth::id(),
            'parent_document_id'  => $parentId,
            'title'               => $request->string('title')->toString(),
            'file_path'           => $storedPath,
            'file_name'           => $file->getClientOriginalName(),
            'file_hash_sha256'    => hash_file('sha256', $absolutePath),
            'version'             => $version,
        ]);

        $this->auditService->log(
            action: 'uploaded',
            user: $request->user(),
            request: $request,
            document: $document
        );

        return back()->with('status', 'Document uploaded successfully.');
    }

    public function assign(AssignDocumentRequest $request, Document $document): RedirectResponse
    {
        $this->authorize('assign', $document);

        $userIds = collect($request->input('user_ids'))
            ->map(fn ($id): int => (int) $id)
            ->unique()
            ->values()
            ->all();

        foreach ($userIds as $userId) {
            $assignment = $document->assignments()->firstOrCreate(
                ['user_id' => $userId],
                ['status' => 'pending']
            );

            $this->auditService->log(
                action: 'assigned',
                user: $request->user(),
                request: $request,
                document: $document,
                assignment: $assignment,
                metadata: ['assigned_user_id' => $userId]
            );
        }

        return back()->with('status', 'Document assigned successfully.');
    }
}
