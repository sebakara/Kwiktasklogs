<?php

use Illuminate\Support\Facades\Route;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationAuditLogController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationPageController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationPageVersionController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationPermissionController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationShareLinkController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationSpaceController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationTagController;
use Webkul\Documentation\Http\Controllers\API\V1\DocumentationTemplateController;
use Webkul\Documentation\Http\Controllers\API\V1\PublicDocumentationShareController;

Route::prefix('api/v1/documentation/shared')
    ->name('api.v1.documentation.shared.')
    ->group(function (): void {
        Route::get('{token}', [PublicDocumentationShareController::class, 'show'])
            ->name('show');
    });

Route::name('admin.api.v1.documentation.')
    ->prefix('admin/api/v1/documentation')
    ->middleware(['auth:sanctum'])
    ->group(function (): void {
        Route::softDeletableApiResource('spaces', DocumentationSpaceController::class);
        Route::softDeletableApiResource('templates', DocumentationTemplateController::class);
        Route::softDeletableApiResource('tags', DocumentationTagController::class);
        Route::apiResource('permissions', DocumentationPermissionController::class)->except(['restore']);
        Route::softDeletableApiResource('share-links', DocumentationShareLinkController::class, ['except' => ['store']]);
        Route::get('spaces/{spaceId}/pages/tree', [DocumentationPageController::class, 'tree'])->name('spaces.pages.tree');
        Route::post('pages/reorder', [DocumentationPageController::class, 'reorder'])->name('pages.reorder');
        Route::patch('pages/{id}/move', [DocumentationPageController::class, 'move'])->name('pages.move');
        Route::softDeletableApiResource('pages', DocumentationPageController::class);
        Route::get('pages/{pageId}/versions', [DocumentationPageVersionController::class, 'index'])->name('pages.versions.index');
        Route::post('pages/{pageId}/versions', [DocumentationPageVersionController::class, 'store'])->name('pages.versions.store');
        Route::get('pages/{pageId}/versions/{versionId}', [DocumentationPageVersionController::class, 'show'])->name('pages.versions.show');
        Route::post('pages/{pageId}/versions/{versionId}/restore', [DocumentationPageVersionController::class, 'restore'])->name('pages.versions.restore');
        Route::post('pages/{pageId}/share-links', [DocumentationShareLinkController::class, 'store'])->name('pages.share-links.store');
        Route::post('share-links/{id}/revoke', [DocumentationShareLinkController::class, 'revoke'])->name('share-links.revoke');
        Route::get('audit-logs', [DocumentationAuditLogController::class, 'index'])->name('audit-logs.index');
        Route::get('audit-logs/{id}', [DocumentationAuditLogController::class, 'show'])->name('audit-logs.show');
    });
