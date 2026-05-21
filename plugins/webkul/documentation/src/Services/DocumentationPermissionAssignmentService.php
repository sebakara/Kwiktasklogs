<?php

namespace Webkul\Documentation\Services;

use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationPermission;
use Webkul\Documentation\Models\DocumentationSpace;

class DocumentationPermissionAssignmentService
{
    /**
     * @param  array<string, mixed>  $data
     */
    public function assign(array $data): DocumentationPermission
    {
        $validated = $this->validate($data);

        return DocumentationPermission::query()->create($validated);
    }

    /**
     * @param  array<string, mixed>  $data
     */
    public function validate(array $data): array
    {
        $validated = Validator::make($data, [
            'permission'            => ['required', 'string', Rule::enum(DocumentationPermissionLevel::class)],
            'permissionable_type'   => ['required', 'string', Rule::in([DocumentationSpace::class, DocumentationPage::class])],
            'permissionable_id'     => ['required', 'integer'],
            'user_id'               => ['nullable', 'integer', 'exists:users,id'],
            'team_id'               => ['nullable', 'integer', 'exists:teams,id'],
            'role_id'               => ['nullable', 'integer', 'exists:roles,id'],
            'company_id'            => ['nullable', 'integer', 'exists:companies,id'],
        ])->validate();

        $subjectCount = collect([
            $validated['user_id'] ?? null,
            $validated['team_id'] ?? null,
            $validated['role_id'] ?? null,
        ])->filter()->count();

        if ($subjectCount !== 1) {
            throw ValidationException::withMessages([
                'subject' => [__('documentation::filament/hub.permissions.validation.subject_required')],
            ]);
        }

        if ($validated['permissionable_type'] === DocumentationSpace::class) {
            DocumentationSpace::query()->findOrFail($validated['permissionable_id']);
        } else {
            DocumentationPage::query()->findOrFail($validated['permissionable_id']);
        }

        $validated['company_id'] ??= auth()->user()?->default_company_id;

        return $validated;
    }
}
