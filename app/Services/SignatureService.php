<?php

namespace App\Services;

use App\Models\DocumentUser;
use App\Models\Signature;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use InvalidArgumentException;

class SignatureService
{
    /**
     * @param  array{signed_name:string,agree:bool,signature_data:?string}  $payload
     */
    public function signAssignment(DocumentUser $assignment, array $payload, Request $request): Signature
    {
        if ($assignment->status === 'signed' || $assignment->signature()->exists()) {
            throw new InvalidArgumentException('This document has already been signed.');
        }

        $signaturePath = null;

        if (! empty($payload['signature_data'])) {
            $signaturePath = $this->storeSignatureImage(
                (string) $payload['signature_data'],
                $assignment->document_id,
                $assignment->user_id
            );
        }

        $signedAt = now();

        $signature = Signature::query()->create([
            'document_user_id'     => $assignment->id,
            'signed_name'          => trim((string) $payload['signed_name']),
            'signature_image_path' => $signaturePath,
            'ip_address'           => $request->ip(),
            'user_agent'           => (string) $request->userAgent(),
            'signed_at'            => $signedAt,
        ]);

        $assignment->update([
            'status'    => 'signed',
            'signed_at' => $signedAt,
        ]);

        return $signature;
    }

    private function storeSignatureImage(string $dataUrl, int $documentId, int $userId): string
    {
        if (! str_starts_with($dataUrl, 'data:image/png;base64,')) {
            throw new InvalidArgumentException('Signature format is invalid.');
        }

        $base64 = substr($dataUrl, strlen('data:image/png;base64,'));
        $binary = base64_decode($base64, true);

        if ($binary === false) {
            throw new InvalidArgumentException('Signature image could not be decoded.');
        }

        $path = 'documents/signatures/document-'.$documentId.'-user-'.$userId.'-'.now()->format('YmdHis').'.png';
        Storage::disk('local')->put($path, $binary);

        return $path;
    }
}
