<?php

namespace Webkul\Employee\Traits\Resources\Employee;

use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Checkbox;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;
use Filament\Notifications\Notification;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use InvalidArgumentException;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;
use Webkul\Employee\Enums\EmployeeDocumentStatus;
use Webkul\Employee\Models\EmployeeDocument;
use Webkul\Employee\Services\EmployeeSignedDocumentPdfService;

trait EmployeeDocumentRelation
{
    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make([
                    TextInput::make('title')
                        ->required()
                        ->maxLength(255),
                    TextInput::make('document_type')
                        ->maxLength(255),
                    Select::make('status')
                        ->options(EmployeeDocumentStatus::options())
                        ->required()
                        ->default(EmployeeDocumentStatus::Draft->value),
                    FileUpload::make('original_file_path')
                        ->label('Document file')
                        ->required()
                        ->disk('public_root')
                        ->directory(EmployeeDocument::ORIGINAL_STORAGE_DIRECTORY)
                        ->visibility('public')
                        ->getUploadedFileNameForStorageUsing(function (TemporaryUploadedFile $file): string {
                            $baseName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                            $extension = strtolower((string) $file->getClientOriginalExtension());
                            $safeBaseName = Str::slug($baseName) ?: 'employee-document';

                            return $safeBaseName.'-'.now()->format('YmdHis').'-'.Str::lower(Str::random(8)).'.'.$extension;
                        })
                        ->openable()
                        ->downloadable(),
                    DateTimePicker::make('sent_at')
                        ->label('Sent at')
                        ->default(now())
                        ->seconds(true),
                    DateTimePicker::make('signed_at')
                        ->seconds(false),
                    Textarea::make('notes')
                        ->columnSpanFull(),
                    Hidden::make('requested_by_user_id')
                        ->default(fn (): ?int => Auth::id()),
                    Hidden::make('signed_by_user_id'),
                ])->columns(2),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('document_type')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('status')
                    ->badge()
                    ->searchable()
                    ->sortable(),
                TextColumn::make('requestedBy.name')
                    ->label('Requested by')
                    ->toggleable(),
                TextColumn::make('signedBy.name')
                    ->label('Signed by')
                    ->toggleable(),
                TextColumn::make('signed_name')
                    ->label('Signed name')
                    ->searchable()
                    ->toggleable(),
                TextColumn::make('sent_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('signed_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->headerActions([
                CreateAction::make()
                    ->visible(fn (): bool => ! $this->isCurrentUserEmployeeOwnerForContext())
                    ->authorize(fn (): bool => ! $this->isCurrentUserEmployeeOwnerForContext())
                    ->mutateDataUsing(function (array $data): array {
                        $data['creator_id'] = Auth::id();
                        $data['requested_by_user_id'] ??= Auth::id();
                        $data['sent_at'] ??= now();

                        return $data;
                    })
                    ->successNotification(
                        Notification::make()
                            ->success()
                            ->title('Document created')
                    ),
            ])
            ->recordActions([
                Action::make('viewDocument')
                    ->label('View original')
                    ->icon('heroicon-o-eye')
                    ->color('gray')
                    ->iconButton()
                    ->tooltip('View original document')
                    ->visible(fn ($record): bool => ! empty($record->original_file_path))
                    ->url(fn ($record): string => $this->resolveDocumentUrl($record->original_file_path))
                    ->openUrlInNewTab(),
                Action::make('viewSignedDocument')
                    ->label('View signed')
                    ->icon('heroicon-o-document-check')
                    ->color('success')
                    ->iconButton()
                    ->tooltip('View signed document')
                    ->visible(fn ($record): bool => ! empty($record->signed_file_path))
                    ->url(fn ($record): string => $this->resolveDocumentUrl($record->signed_file_path))
                    ->openUrlInNewTab(),
                Action::make('signDocument')
                    ->label('Sign')
                    ->icon('heroicon-o-pencil-square')
                    ->color('success')
                    ->visible(fn ($record): bool => $record->status === EmployeeDocumentStatus::PendingSignature->value
                        && $this->isAuthenticatedUserEmployeeOwner($record->employee))
                    ->schema([
                        Placeholder::make('sign_note')
                            ->label('Sign electronically')
                            ->content('By signing, you confirm this is your legal electronic signature.'),
                        TextInput::make('signed_name')
                            ->label('Full legal name')
                            ->required()
                            ->maxLength(255)
                            ->default(fn (): string => (string) Auth::user()?->name),
                        Checkbox::make('agreed_to_sign')
                            ->label('I agree to sign this document electronically')
                            ->required()
                            ->accepted(),
                    ])
                    ->action(function ($record, array $data): void {
                        $authUser = Auth::user();
                        $isOwner = $this->isAuthenticatedUserEmployeeOwner($record->employee);

                        if (! $isOwner) {
                            Notification::make()
                                ->danger()
                                ->title('Only the employee can sign this document')
                                ->send();

                            return;
                        }

                        if ($record->status !== EmployeeDocumentStatus::PendingSignature->value) {
                            Notification::make()
                                ->warning()
                                ->title('This document is not awaiting signature')
                                ->send();

                            return;
                        }

                        $originalRelative = $record->original_file_path;

                        if (! $originalRelative) {
                            Notification::make()
                                ->danger()
                                ->title('No document file to sign')
                                ->send();

                            return;
                        }

                        if (strtolower((string) pathinfo($originalRelative, PATHINFO_EXTENSION)) !== 'pdf') {
                            Notification::make()
                                ->warning()
                                ->title('Only PDF documents can be signed electronically')
                                ->body('Convert the document to PDF, attach it again, then request signature.')
                                ->send();

                            return;
                        }

                        $absoluteOriginal = $this->absolutePathForStoredDocument($originalRelative);

                        if ($absoluteOriginal === null) {
                            Notification::make()
                                ->danger()
                                ->title('The original document file could not be found on storage.')
                                ->send();

                            return;
                        }

                        $request = Request::instance();
                        $signedName = trim((string) Arr::get($data, 'signed_name'));
                        $signedAt = now();

                        $titleSlug = Str::slug((string) $record->title) ?: 'employee-document';
                        $filename = $titleSlug.'-record-'.$record->id.'-signed-'.$signedAt->format('YmdHis').'.pdf';
                        $signedFilePath = EmployeeDocument::SIGNED_STORAGE_DIRECTORY.'/'.$filename;
                        $tempSignedBase = tempnam(sys_get_temp_dir(), 'employee-signed-');

                        if ($tempSignedBase === false) {
                            Notification::make()
                                ->danger()
                                ->title('Signing failed — temporary file could not be created.')
                                ->body(__('Please notify an administrator.'))
                                ->send();

                            return;
                        }

                        @unlink($tempSignedBase);
                        $temporarySignedPath = $tempSignedBase.'.pdf';

                        $originalSha256 = hash_file('sha256', $absoluteOriginal);

                        $bindingPayload = implode('|', [
                            'v1-esig',
                            (string) $record->id,
                            (string) ($authUser?->id ?? ''),
                            $signedName,
                            $signedAt->toIso8601String(),
                            (string) $request->ip(),
                            (string) $request->userAgent(),
                            $originalSha256,
                            $signedFilePath,
                        ]);

                        $bindingFingerprint = hash('sha256', $bindingPayload);
                        $verificationUrl = URL::temporarySignedRoute(
                            'employee-documents.verify-signature',
                            now()->addYears(10),
                            ['document' => $record->id]
                        );

                        try {
                            app(EmployeeSignedDocumentPdfService::class)->mergeWithElectronicSignatureCertificate(
                                $absoluteOriginal,
                                $temporarySignedPath,
                                $signedAt,
                                $record->id,
                                (string) $record->title,
                                $record->document_type,
                                $signedName,
                                (int) ($authUser?->id ?? 0),
                                $authUser->email ?? null,
                                $request->ip(),
                                $request->userAgent(),
                                $originalSha256,
                                $bindingFingerprint,
                                $verificationUrl,
                            );
                        } catch (\Throwable $exception) {
                            report($exception);

                            $failureBody = __('Please notify an administrator.');

                            if ($exception instanceof InvalidArgumentException) {
                                $failureBody = $exception->getMessage();
                            }

                            Notification::make()
                                ->danger()
                                ->title('Signing failed — the PDF could not be finalized.')
                                ->body($failureBody)
                                ->send();

                            return;
                        }

                        if (! is_file($temporarySignedPath)) {
                            Notification::make()
                                ->danger()
                                ->title('Signing failed — generated signed file was not found.')
                                ->body(__('Please notify an administrator.'))
                                ->send();

                            return;
                        }

                        $signedPdfContents = file_get_contents($temporarySignedPath);

                        if ($signedPdfContents === false) {
                            @unlink($temporarySignedPath);

                            Notification::make()
                                ->danger()
                                ->title('Signing failed — generated file could not be read.')
                                ->body(__('Please notify an administrator.'))
                                ->send();

                            return;
                        }

                        @unlink($temporarySignedPath);

                        $absoluteSigned = public_path($signedFilePath);
                        File::ensureDirectoryExists(dirname($absoluteSigned));
                        $bytesWritten = @file_put_contents($absoluteSigned, $signedPdfContents);

                        if ($bytesWritten === false || ! is_file($absoluteSigned)) {
                            Notification::make()
                                ->danger()
                                ->title('Signing failed — signed file is missing after storage write.')
                                ->body(__('Please notify an administrator.'))
                                ->send();

                            return;
                        }

                        $outputSha256 = hash_file('sha256', $absoluteSigned);

                        $signatureHashStored = hash('sha256', implode('|', ['v2-esig-record', $bindingFingerprint, $outputSha256]));

                        $record->update([
                            'status'            => EmployeeDocumentStatus::Signed->value,
                            'signed_by_user_id' => $authUser?->id,
                            'signed_name'       => $signedName,
                            'signed_at'         => $signedAt,
                            'signed_file_path'  => $signedFilePath,
                            'signed_ip_address' => $request->ip(),
                            'signed_user_agent' => (string) $request->userAgent(),
                            'signature_hash'    => $signatureHashStored,
                            'signed_file_sha256'=> $outputSha256,
                        ]);

                        Notification::make()
                            ->success()
                            ->title('Document signed successfully')
                            ->send();
                    }),
                EditAction::make()
                    ->visible(fn ($record): bool => ! $this->isEmployeeDocumentOwner($record))
                    ->authorize(fn ($record): bool => ! $this->isEmployeeDocumentOwner($record))
                    ->mutateDataUsing(function (array $data): array {
                        if (! empty($data['signed_file_path']) && empty($data['signed_by_user_id'])) {
                            $data['signed_by_user_id'] = Auth::id();
                        }

                        return $data;
                    }),
                DeleteAction::make()
                    ->visible(fn ($record): bool => ! $this->isEmployeeDocumentOwner($record))
                    ->authorize(fn ($record): bool => ! $this->isEmployeeDocumentOwner($record)),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make()
                        ->visible(function (): bool {
                            $ownerRecord = method_exists($this, 'getOwnerRecord') ? $this->getOwnerRecord() : null;

                            return ! $this->isEmployeeDocumentOwner($ownerRecord);
                        })
                        ->authorize(function (Collection $records): bool {
                            /** @var Model $record */
                            foreach ($records as $record) {
                                if ($this->isEmployeeDocumentOwner($record)) {
                                    return false;
                                }
                            }

                            return true;
                        }),
                ]),
            ]);
    }

    public function infolist(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make([
                    TextEntry::make('title'),
                    TextEntry::make('document_type'),
                    TextEntry::make('status')->badge(),
                    TextEntry::make('requestedBy.name')->label('Requested by'),
                    TextEntry::make('signedBy.name')->label('Signed by'),
                    TextEntry::make('signed_name')->label('Signed name'),
                    TextEntry::make('signed_ip_address')->label('Signed IP'),
                    TextEntry::make('sent_at')->dateTime(),
                    TextEntry::make('signed_at')->dateTime(),
                    TextEntry::make('original_file_path')
                        ->label('Document file')
                        ->url(fn ($record): string => $this->resolveDocumentUrl($record->original_file_path))
                        ->openUrlInNewTab(),
                    TextEntry::make('signed_file_path')
                        ->label('Signed file')
                        ->url(fn ($record): string => $this->resolveDocumentUrl($record->signed_file_path))
                        ->openUrlInNewTab(),
                    TextEntry::make('notes')
                        ->columnSpanFull(),
                ])->columns(2),
            ]);
    }

    private function resolveDocumentUrl(?string $path): string
    {
        if (! $path) {
            return '#';
        }

        if (filter_var($path, FILTER_VALIDATE_URL)) {
            return $path;
        }

        $normalizedPath = ltrim($path, '/');

        if (str_starts_with($normalizedPath, 'storage/')) {
            $normalizedPath = substr($normalizedPath, strlen('storage/'));
        }

        if (Storage::disk('public_root')->exists($normalizedPath)) {
            return asset($normalizedPath);
        }

        if (Storage::disk('public')->exists($normalizedPath)) {
            return Storage::disk('public')->url($normalizedPath);
        }

        return '#';
    }

    /**
     * @return non-empty-string|null Absolute filesystem path if the stored relative path resolves on local disks.
     */
    private function absolutePathForStoredDocument(string $relativePath): ?string
    {
        $normalizedPath = ltrim($relativePath, '/');

        if (str_starts_with($normalizedPath, 'storage/')) {
            $normalizedPath = substr($normalizedPath, strlen('storage/'));
        }

        if (Storage::disk('public_root')->exists($normalizedPath)) {
            return Storage::disk('public_root')->path($normalizedPath);
        }

        if (Storage::disk('public')->exists($normalizedPath)) {
            return Storage::disk('public')->path($normalizedPath);
        }

        return null;
    }

    private function isEmployeeDocumentOwner(mixed $record): bool
    {
        if (! $record || ! isset($record->employee)) {
            return false;
        }

        return $this->isAuthenticatedUserEmployeeOwner($record->employee);
    }

    private function isCurrentUserEmployeeOwnerForContext(): bool
    {
        $ownerRecord = method_exists($this, 'getOwnerRecord') ? $this->getOwnerRecord() : null;

        if (! $ownerRecord) {
            return false;
        }

        return $this->emailEqualsAuthenticatedUser($ownerRecord->work_email)
            || $this->emailEqualsAuthenticatedUser($ownerRecord->private_email)
            || $this->emailEqualsAuthenticatedUser($ownerRecord->user?->email);
    }

    private function isAuthenticatedUserEmployeeOwner(mixed $employee): bool
    {
        if (! $employee) {
            return false;
        }

        $authenticatedUser = Auth::user();

        if (! $authenticatedUser) {
            return false;
        }

        if ((int) ($employee->user_id ?? 0) === (int) $authenticatedUser->id) {
            return true;
        }

        return $this->emailEqualsAuthenticatedUser($employee->work_email)
            || $this->emailEqualsAuthenticatedUser($employee->private_email)
            || $this->emailEqualsAuthenticatedUser($employee->user?->email);
    }

    private function emailEqualsAuthenticatedUser(?string $email): bool
    {
        if (! $email) {
            return false;
        }

        $authenticatedEmail = Auth::user()?->email;

        if (! $authenticatedEmail) {
            return false;
        }

        return mb_strtolower(trim($email)) === mb_strtolower(trim($authenticatedEmail));
    }
}
