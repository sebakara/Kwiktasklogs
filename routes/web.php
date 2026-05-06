<?php

use App\Http\Controllers\Employee\EmployeeDocumentController;
use App\Http\Controllers\EmployeeDocumentSignatureVerificationController;
use App\Http\Controllers\HR\DocumentController;
use Illuminate\Support\Facades\Route;

Route::redirect('/login', '/admin/login')
    ->name('login');

Route::get('/employee-documents/{document}/verify-signature', EmployeeDocumentSignatureVerificationController::class)
    ->middleware('signed')
    ->name('employee-documents.verify-signature');

Route::middleware(['web', 'auth'])->group(function (): void {
    Route::prefix('hr/documents')
        ->name('hr.documents.')
        ->group(function (): void {
            Route::get('/', [DocumentController::class, 'index'])->name('index');
            Route::post('/', [DocumentController::class, 'store'])->name('store');
            Route::post('/{document}/assign', [DocumentController::class, 'assign'])->name('assign');
        });

    Route::prefix('employee/documents')
        ->name('employee.documents.')
        ->group(function (): void {
            Route::get('/', [EmployeeDocumentController::class, 'index'])->name('index');
            Route::get('/{assignment}', [EmployeeDocumentController::class, 'show'])->name('show');
            Route::get('/{assignment}/file', [EmployeeDocumentController::class, 'file'])->name('file');
            Route::post('/{assignment}/sign', [EmployeeDocumentController::class, 'sign'])->name('sign');
        });
});
