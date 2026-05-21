<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Webkul\Documentation\Enums\DocumentationPermissionLevel;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;

class DocumentationPermissionRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return array<string, mixed>
     */
    public function rules(): array
    {
        return [
            'permission'          => ['required', 'string', Rule::enum(DocumentationPermissionLevel::class)],
            'permissionable_type' => ['required', 'string', Rule::in([DocumentationSpace::class, DocumentationPage::class])],
            'permissionable_id'   => ['required', 'integer'],
            'user_id'             => ['nullable', 'integer', 'exists:users,id'],
            'team_id'             => ['nullable', 'integer', 'exists:teams,id'],
            'role_id'             => ['nullable', 'integer', 'exists:roles,id'],
            'company_id'          => ['nullable', 'integer', 'exists:companies,id'],
        ];
    }
}
