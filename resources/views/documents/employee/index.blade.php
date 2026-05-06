<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Documents</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border-bottom: 1px solid #eee; padding: 10px; text-align: left; }
        .badge { padding: 4px 8px; border-radius: 999px; font-size: 12px; }
        .pending { background: #fef3c7; }
        .viewed { background: #dbeafe; }
        .signed { background: #dcfce7; }
    </style>
</head>
<body>
    <h1>Assigned Documents</h1>
    <table>
        <thead>
            <tr>
                <th>Document</th>
                <th>Status</th>
                <th>Assigned</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($assignments as $assignment)
                <tr>
                    <td>
                        <strong>{{ $assignment->document->title }}</strong><br>
                        <small>{{ $assignment->document->file_name }}</small>
                    </td>
                    <td>
                        <span class="badge {{ $assignment->status }}">{{ $assignment->status }}</span>
                    </td>
                    <td>{{ $assignment->created_at?->toDateTimeString() }}</td>
                    <td>
                        <a href="{{ route('employee.documents.show', $assignment) }}">Open</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4">No assigned documents.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    {{ $assignments->links() }}
</body>
</html>
