<?php

use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPageVersion;
use Webkul\Documentation\Services\DocumentationPageVersionService;

it('detects when a snapshot should be created', function (): void {
    $service = app(DocumentationPageVersionService::class);

    $existing = new DocumentationPage([
        'title'   => 'Original',
        'summary' => 'Summary',
        'content' => 'Body',
    ]);

    expect($service->shouldCreateSnapshot(null, ['title' => 'New'], false))->toBeTrue()
        ->and($service->shouldCreateSnapshot($existing, ['title' => 'Original', 'summary' => 'Summary', 'content' => 'Body'], false))->toBeFalse()
        ->and($service->shouldCreateSnapshot($existing, ['title' => 'Original', 'summary' => 'Summary', 'content' => 'Body'], true))->toBeTrue()
        ->and($service->shouldCreateSnapshot($existing, ['title' => 'Changed', 'summary' => 'Summary', 'content' => 'Body'], false))->toBeTrue();
});

it('detects when a version matches current page content', function (): void {
    $service = app(DocumentationPageVersionService::class);

    $page = new DocumentationPage([
        'title'   => 'Title',
        'summary' => 'Summary',
        'content' => 'Body',
    ]);

    $version = new DocumentationPageVersion([
        'title'   => 'Title',
        'summary' => 'Summary',
        'content' => 'Body',
    ]);

    expect($service->isCurrentVersion($page, $version))->toBeTrue();

    $version->title = 'Other';

    expect($service->isCurrentVersion($page, $version))->toBeFalse();
});
