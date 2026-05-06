<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Document</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .layout { display: grid; grid-template-columns: 2fr 1fr; gap: 20px; }
        .card { border: 1px solid #ddd; border-radius: 8px; padding: 16px; }
        iframe { width: 100%; height: 80vh; border: 1px solid #eee; }
        label { display: block; margin: 10px 0 6px; }
        input, button { width: 100%; padding: 8px; margin-bottom: 10px; }
        canvas { border: 1px solid #aaa; width: 100%; height: 180px; touch-action: none; }
        .flash { padding: 10px; background: #ecfeff; border: 1px solid #67e8f9; margin-bottom: 12px; }
        .error { color: #b91c1c; margin-bottom: 10px; }
    </style>
</head>
<body>
    <a href="{{ route('employee.documents.index') }}">← Back to documents</a>
    <h1>{{ $assignment->document->title }}</h1>

    @if (session('status'))
        <div class="flash">{{ session('status') }}</div>
    @endif

    <div class="layout">
        <div class="card">
            <iframe src="{{ route('employee.documents.file', $assignment) }}"></iframe>
        </div>

        <div class="card">
            <h2>Sign Document</h2>
            <p>Status: <strong>{{ $assignment->status }}</strong></p>
            <p>File integrity hash:</p>
            <code>{{ $assignment->document->file_hash_sha256 }}</code>

            @if ($assignment->status === 'signed' && $assignment->signature)
                <hr>
                <p><strong>Signed by:</strong> {{ $assignment->signature->signed_name }}</p>
                <p><strong>Signed at:</strong> {{ $assignment->signature->signed_at?->toDateTimeString() }}</p>
            @else
                <form method="POST" action="{{ route('employee.documents.sign', $assignment) }}" id="signature-form">
                    @csrf
                    @if ($errors->any())
                        <div class="error">{{ $errors->first() }}</div>
                    @endif

                    <label for="signed_name">Full legal name</label>
                    <input id="signed_name" name="signed_name" value="{{ old('signed_name', auth()->user()?->name) }}" required>

                    <label for="signature-canvas">Draw signature (optional)</label>
                    <canvas id="signature-canvas" width="500" height="180"></canvas>
                    <button type="button" id="clear-signature">Clear signature</button>

                    <input type="hidden" name="signature_data" id="signature_data">

                    <label>
                        <input type="checkbox" name="agree" value="1" required>
                        I agree that this electronic signature is legally binding.
                    </label>

                    <button type="submit">Sign and Send Back</button>
                </form>
            @endif
        </div>
    </div>

    <script>
        (function () {
            const canvas = document.getElementById('signature-canvas');
            const hiddenInput = document.getElementById('signature_data');
            const form = document.getElementById('signature-form');
            const clearButton = document.getElementById('clear-signature');

            if (!canvas || !hiddenInput || !form || !clearButton) {
                return;
            }

            const ctx = canvas.getContext('2d');
            let isDrawing = false;

            function getPoint(event) {
                const rect = canvas.getBoundingClientRect();
                const source = event.touches ? event.touches[0] : event;

                return {
                    x: (source.clientX - rect.left) * (canvas.width / rect.width),
                    y: (source.clientY - rect.top) * (canvas.height / rect.height),
                };
            }

            function start(event) {
                isDrawing = true;
                const point = getPoint(event);
                ctx.beginPath();
                ctx.moveTo(point.x, point.y);
            }

            function draw(event) {
                if (!isDrawing) {
                    return;
                }

                event.preventDefault();
                const point = getPoint(event);
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.strokeStyle = '#111827';
                ctx.lineTo(point.x, point.y);
                ctx.stroke();
            }

            function stop() {
                isDrawing = false;
            }

            canvas.addEventListener('mousedown', start);
            canvas.addEventListener('mousemove', draw);
            window.addEventListener('mouseup', stop);
            canvas.addEventListener('touchstart', start, { passive: true });
            canvas.addEventListener('touchmove', draw, { passive: false });
            canvas.addEventListener('touchend', stop);

            clearButton.addEventListener('click', function () {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                hiddenInput.value = '';
            });

            form.addEventListener('submit', function () {
                const pngData = canvas.toDataURL('image/png');
                const emptyCanvas = document.createElement('canvas');
                emptyCanvas.width = canvas.width;
                emptyCanvas.height = canvas.height;

                if (pngData !== emptyCanvas.toDataURL('image/png')) {
                    hiddenInput.value = pngData;
                }
            });
        })();
    </script>
</body>
</html>
