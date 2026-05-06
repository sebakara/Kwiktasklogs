<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signature Verification</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; background: #f8fafc; }
        .card { background: #fff; border: 1px solid #e5e7eb; border-radius: 10px; padding: 18px; max-width: 760px; }
        .status { display: inline-block; padding: 4px 10px; border-radius: 999px; font-weight: 700; margin-bottom: 10px; }
        .valid { background: #dcfce7; color: #166534; }
        .invalid { background: #fee2e2; color: #991b1b; }
        dt { font-weight: 700; margin-top: 8px; }
        dd { margin: 2px 0 0; font-family: monospace; word-break: break-all; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Signed Document Verification</h1>
        <p class="status {{ $status === 'valid' ? 'valid' : 'invalid' }}">
            {{ strtoupper($status) }}
        </p>
        <p>{{ $message }}</p>

        <dl>
            <dt>Document ID</dt>
            <dd>{{ $document->id }}</dd>

            <dt>Document Title</dt>
            <dd>{{ $document->title }}</dd>

            <dt>Signed Name</dt>
            <dd>{{ $document->signed_name ?? '—' }}</dd>

            <dt>Signed At</dt>
            <dd>{{ $document->signed_at?->toIso8601String() ?? '—' }}</dd>

            <dt>Recorded SHA-256</dt>
            <dd>{{ $document->signed_file_sha256 ?? '—' }}</dd>

            <dt>Computed SHA-256</dt>
            <dd>{{ $computedSha256 ?? '—' }}</dd>
        </dl>
    </div>
</body>
</html>
