<?php

namespace Webkul\Employee\Services;

use Carbon\CarbonInterface;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;
use Illuminate\Support\Facades\File;
use InvalidArgumentException;
use RuntimeException;
use setasign\Fpdi\Tcpdf\Fpdi;
use Symfony\Component\Process\Process;
use Throwable;

final class EmployeeSignedDocumentPdfService
{
    /**
     * Imports every page from the source PDF, appends an electronic signature certificate page, and writes the result.
     *
     * @throws RuntimeException When the PDF cannot be read or written.
     */
    public function mergeWithElectronicSignatureCertificate(
        string $sourceAbsolutePath,
        string $destinationAbsolutePath,
        CarbonInterface $signedAt,
        int $employeeDocumentId,
        string $documentTitle,
        ?string $documentType,
        string $signedName,
        int $signerUserId,
        ?string $signerEmail,
        ?string $ipAddress,
        ?string $userAgent,
        string $originalSha256,
        string $bindingFingerprint,
        ?string $verificationUrl = null,
    ): void {
        if (! is_file($sourceAbsolutePath) || ! is_readable($sourceAbsolutePath)) {
            throw new InvalidArgumentException('Source PDF is missing or not readable.');
        }

        File::ensureDirectoryExists(dirname($destinationAbsolutePath));

        try {
            $pdf = new Fpdi;
            $pdf->setCreator(config('app.name', 'Application'));
            $pdf->SetTitle('Signed: '.$documentTitle);
            $normalizedPath = null;

            try {
                $pageCount = $pdf->setSourceFile($sourceAbsolutePath);
            } catch (Throwable $throwable) {
                $normalizedPath = $this->normalizePdfForFpdi($sourceAbsolutePath);

                if ($normalizedPath === null) {
                    throw new InvalidArgumentException('This PDF format is not supported for signing. Please re-save or print it as a standard PDF and try again.', 0, $throwable);
                }

                $pageCount = $pdf->setSourceFile($normalizedPath);
            }

            for ($pageNumber = 1; $pageNumber <= $pageCount; $pageNumber++) {
                $templateId = $pdf->importPage($pageNumber);
                $size = $pdf->getTemplateSize($templateId);
                $orientation = $size['orientation'] ?? 'P';
                $pdf->AddPage($orientation, [$size['width'], $size['height']]);
                $pdf->useTemplate($templateId);

                // Make signed pages visually distinguishable from the original.
                $pdf->SetFont('dejavusans', 'B', 9);
                $pdf->SetTextColor(180, 30, 30);
                $pdf->SetXY(12, 8);
                $pdf->Cell(0, 6, $this->lineForTcpdf('SIGNED ELECTRONICALLY'), 0, 1, 'L');
                $pdf->SetTextColor(0, 0, 0);
            }

            $pdf->AddPage('P', 'A4');

            $pdf->SetFont('dejavusans', '', 10);
            $y = 12;
            $pdf->SetFont('dejavusans', 'B', 14);
            $pdf->SetXY(15, $y);
            $pdf->Cell(0, 10, $this->lineForTcpdf('Electronic signature certificate'), 0, 1);
            $y += 12;

            $pdf->SetFont('dejavusans', '', 10);
            $lines = [
                'This appendix was generated when the signer completed electronic signing in '.$this->lineForTcpdf(config('app.name')).'.',
                'The preceding pages reproduce the original document as supplied at signing time.',
                '',
                'Document reference: ID '.$employeeDocumentId,
                'Document title: '.$this->lineForTcpdf($documentTitle),
                'Document type: '.$this->lineForTcpdf($documentType ?? '—'),
                '',
                'Signer legal name (typed): '.$this->lineForTcpdf($signedName),
                'Signer user ID: '.$signerUserId,
                'Signer email: '.$this->lineForTcpdf($signerEmail ?? '—'),
                'Signing timestamp (UTC): '.$signedAt->copy()->utc()->toIso8601String(),
                'Client IP address: '.$this->lineForTcpdf($ipAddress ?? '—'),
                'Integrity — SHA-256 of original file bytes: '.$originalSha256,
                'Integrity — signing binding fingerprint (pre-output digest): '.$bindingFingerprint,
                '',
                'Client user-agent:',
                $this->lineForTcpdf($userAgent ?? '—'),
            ];

            $qrPayload = implode("\n", [
                'Employee e-sign verification',
                'Document ID: '.$employeeDocumentId,
                'Signer: '.$this->lineForTcpdf($signedName),
                'Signer user ID: '.$signerUserId,
                'IP: '.$this->lineForTcpdf($ipAddress ?? '—'),
                'Signed at UTC: '.$signedAt->copy()->utc()->toIso8601String(),
                'Original SHA-256: '.$originalSha256,
                'Signature binding SHA-256: '.$bindingFingerprint,
            ]);

            if ($verificationUrl) {
                $qrPayload .= "\n".'Verification URL: '.$verificationUrl;
            }

            $qrPng = $this->buildQrCodePng($qrPayload);

            foreach ($lines as $line) {
                $pdf->SetXY(15, $y);
                $pdf->MultiCell(180, 5, $line, 0, 'L');
                $y = $pdf->GetY() + 1;

                if ($y > 270) {
                    $pdf->AddPage('P', 'A4');
                    $y = 12;
                    $pdf->SetFont('dejavusans', '', 10);
                }
            }

            if ($qrPng !== null) {
                $temporaryQrBasePath = tempnam(sys_get_temp_dir(), 'employee-signature-qr-');

                if ($temporaryQrBasePath !== false) {
                    @unlink($temporaryQrBasePath);
                }

                $temporaryQrPngPath = $temporaryQrBasePath !== false ? $temporaryQrBasePath.'.png' : null;

                if ($temporaryQrPngPath !== null) {
                    file_put_contents($temporaryQrPngPath, $qrPng);
                }

                // Always place the QR on a dedicated final page so it is predictable and visible.
                $pdf->AddPage('P', 'A4');
                $pdf->SetXY(15, 12);
                $pdf->SetFont('dejavusans', 'B', 14);
                $pdf->Cell(0, 10, $this->lineForTcpdf('Signature verification QR'), 0, 1);
                $pdf->SetFont('dejavusans', '', 10);
                $pdf->SetXY(15, 24);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Scan this QR code to verify document signature integrity and signer metadata.'), 0, 'L');

                if ($temporaryQrPngPath !== null && is_file($temporaryQrPngPath) && filesize($temporaryQrPngPath) > 0) {
                    $pdf->Image($temporaryQrPngPath, 15, 38, 80, 80, 'PNG');
                    @unlink($temporaryQrPngPath);
                } else {
                    $pdf->Image('@'.$qrPng, 15, 38, 80, 80, 'PNG');
                }

                $pdf->SetFont('dejavusans', '', 9);
                $pdf->SetXY(15, 124);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Document ID: '.$employeeDocumentId), 0, 'L');
                $pdf->SetXY(15, 130);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Signer: '.$signedName), 0, 'L');
                $pdf->SetXY(15, 136);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('IP: '.($ipAddress ?? '—')), 0, 'L');
                $pdf->SetXY(15, 142);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Signed at (UTC): '.$signedAt->copy()->utc()->toIso8601String()), 0, 'L');
                $pdf->SetXY(15, 148);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Original SHA-256: '.$originalSha256), 0, 'L');
                $pdf->SetXY(15, 154);
                $pdf->MultiCell(180, 5, $this->lineForTcpdf('Binding SHA-256: '.$bindingFingerprint), 0, 'L');

                if ($verificationUrl) {
                    $pdf->SetXY(15, 164);
                    $pdf->MultiCell(125, 5, $this->lineForTcpdf('Verify URL: '.$verificationUrl), 0, 'L');
                }
            }

            $pdf->Output($destinationAbsolutePath, 'F');

            if (! is_file($destinationAbsolutePath)) {
                throw new RuntimeException('Failed to write merged signed PDF.');
            }

            if ($normalizedPath !== null && is_file($normalizedPath)) {
                @unlink($normalizedPath);
            }
        } catch (InvalidArgumentException $exception) {
            throw $exception;
        } catch (Throwable $exception) {
            throw new RuntimeException('The PDF could not be processed for signing.', 0, $exception);
        }
    }

    private function buildQrCodePng(string $payload): ?string
    {
        try {
            $qrCode = new QrCode(
                data: $payload,
                encoding: new Encoding('UTF-8'),
                errorCorrectionLevel: ErrorCorrectionLevel::Medium,
                size: 280,
                margin: 10,
            );

            return (new PngWriter)->write($qrCode)->getString();
        } catch (Throwable) {
            return null;
        }
    }

    private function normalizePdfForFpdi(string $sourceAbsolutePath): ?string
    {
        $temporaryBasePath = tempnam(sys_get_temp_dir(), 'employee-signing-normalized-');

        if ($temporaryBasePath === false) {
            return null;
        }

        @unlink($temporaryBasePath);
        $normalizedPath = $temporaryBasePath.'.pdf';

        $process = new Process([
            'gs',
            '-q',
            '-dNOPAUSE',
            '-dBATCH',
            '-sDEVICE=pdfwrite',
            '-dCompatibilityLevel=1.4',
            '-sOutputFile='.$normalizedPath,
            $sourceAbsolutePath,
        ]);

        $process->setTimeout(120);
        $process->run();

        if (! $process->isSuccessful() || ! is_file($normalizedPath) || filesize($normalizedPath) === 0) {
            if (is_file($normalizedPath)) {
                @unlink($normalizedPath);
            }

            return null;
        }

        return $normalizedPath;
    }

    /**
     * Remove characters that routinely break TCPDF cell output.
     */
    private function lineForTcpdf(string $value): string
    {
        $value = mb_convert_encoding($value, 'UTF-8', 'UTF-8');
        $value = preg_replace('/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/u', '', $value) ?? '';
        $value = str_replace(["\r\n", "\n", "\r"], ' ', $value);
        $value = trim(preg_replace('/\s+/u', ' ', $value) ?? '');

        if (mb_strlen($value) > 4000) {
            $value = rtrim(mb_substr($value, 0, 3997)).'...';
        }

        return $value === '' ? '—' : $value;
    }
}
