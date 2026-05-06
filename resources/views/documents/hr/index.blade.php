<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR Documents</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .grid { display: grid; gap: 20px; grid-template-columns: 1fr 2fr; }
        .card { border: 1px solid #ddd; border-radius: 8px; padding: 16px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border-bottom: 1px solid #eee; padding: 8px; text-align: left; vertical-align: top; }
        label { display: block; margin-bottom: 6px; }
        input, select, button { width: 100%; margin-bottom: 10px; padding: 8px; }
        .flash { padding: 10px; background: #ecfeff; border: 1px solid #67e8f9; margin-bottom: 12px; }
        .error { color: #b91c1c; }
    </style>
</head>
<body>
    <h1>Document Management</h1>

    @if (session('status'))
        <div class="flash">{{ session('status') }}</div>
    @endif

    <div class="grid">
        <div class="card">
            <h2>Upload PDF</h2>
            <form method="POST" action="{{ route('hr.documents.store') }}" enctype="multipart/form-data">
                @csrf
                <label for="title">Title</label>
                <input id="title" name="title" required>

                <label for="file">PDF File</label>
                <input id="file" name="file" type="file" accept="application/pdf" required>

                <label for="parent_document_id">Version Of (optional)</label>
                <select id="parent_document_id" name="parent_document_id">
                    <option value="">New root document</option>
                    @foreach ($documents as $docOption)
                        <option value="{{ $docOption->id }}">{{ $docOption->title }} (v{{ $docOption->version }})</option>
                    @endforeach
                </select>

                <button type="submit">Upload</button>
            </form>
        </div>

        <div class="card">
            <h2>Uploaded Documents</h2>
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Version</th>
                        <th>Hash (SHA256)</th>
                        <th>Assignments</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($documents as $document)
                        <tr>
                            <td>
                                <strong>{{ $document->title }}</strong><br>
                                <small>{{ $document->file_name }}</small>
                            </td>
                            <td>v{{ $document->version }}</td>
                            <td><code>{{ $document->file_hash_sha256 }}</code></td>
                            <td>
                                <form method="POST" action="{{ route('hr.documents.assign', $document) }}">
                                    @csrf
                                    <select name="user_ids[]" multiple required style="height: 90px;">
                                        @foreach ($employees as $employee)
                                            <option value="{{ $employee->id }}">{{ $employee->name }} ({{ $employee->email }})</option>
                                        @endforeach
                                    </select>
                                    <button type="submit">Assign</button>
                                </form>
                                @if ($document->assignments->isNotEmpty())
                                    <small>
                                        @foreach ($document->assignments as $assignment)
                                            {{ $assignment->user?->name }}: {{ $assignment->status }}<br>
                                        @endforeach
                                    </small>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="4">No documents uploaded yet.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            {{ $documents->links() }}
        </div>
    </div>
</body>
</html>
