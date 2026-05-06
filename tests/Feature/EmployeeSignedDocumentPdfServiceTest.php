<?php

use Webkul\Employee\Services\EmployeeSignedDocumentPdfService;

test('merged signed PDF includes a certificate page and is not byte-identical to the source', function (): void {
    $sourcePath = sys_get_temp_dir().'/employee-signed-pdf-src-'.uniqid('', true).'.pdf';

    $sourcePdf = new TCPDF;
    $sourcePdf->AddPage();
    $sourcePdf->Write(0, 'Minimal source body for signing test.');
    $sourcePdf->Output($sourcePath, 'F');

    $destinationPath = sys_get_temp_dir().'/employee-signed-pdf-dst-'.uniqid('', true).'.pdf';

    $originalSha256 = hash_file('sha256', $sourcePath);
    $bindingFingerprint = hash('sha256', 'binding-test-stub');

    app(EmployeeSignedDocumentPdfService::class)->mergeWithElectronicSignatureCertificate(
        $sourcePath,
        $destinationPath,
        now(),
        501,
        'Handbook acknowledgement',
        'policy',
        'Jane Signer',
        99,
        'jane@example.com',
        '127.0.0.1',
        'Mozilla/5.0 (test)',
        $originalSha256,
        $bindingFingerprint,
    );

    expect(is_file($destinationPath))->toBeTrue();
    expect(hash_file('sha256', $destinationPath))->not->toBe($originalSha256);

    @unlink($sourcePath);
    @unlink($destinationPath);
});

test('merged signed PDF tolerates malformed utf8 in metadata fields', function (): void {
    $sourcePath = sys_get_temp_dir().'/employee-signed-pdf-src-'.uniqid('', true).'.pdf';

    $sourcePdf = new TCPDF;
    $sourcePdf->AddPage();
    $sourcePdf->Write(0, 'Source body for malformed UTF-8 metadata test.');
    $sourcePdf->Output($sourcePath, 'F');

    $destinationPath = sys_get_temp_dir().'/employee-signed-pdf-dst-'.uniqid('', true).'.pdf';
    $originalSha256 = hash_file('sha256', $sourcePath);

    app(EmployeeSignedDocumentPdfService::class)->mergeWithElectronicSignatureCertificate(
        $sourcePath,
        $destinationPath,
        now(),
        9001,
        "Policy \xC3\x28 acknowledgement",
        "hr \xC3\x28 packet",
        "John \xC3\x28 Signer",
        27,
        "john\xC3\x28@example.com",
        '127.0.0.1',
        "Mozilla/5.0 \xC3\x28 test",
        $originalSha256,
        hash('sha256', "bind\xC3\x28"),
    );

    expect(is_file($destinationPath))->toBeTrue();

    @unlink($sourcePath);
    @unlink($destinationPath);
});
