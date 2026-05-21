<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;

class DocumentationSpaceRequest extends FormRequest
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
        $isUpdate = $this->isMethod('PUT') || $this->isMethod('PATCH');
        $requiredRule = $isUpdate ? ['sometimes', 'required'] : ['required'];
        $spaceId = $this->route('space') ?? $this->route('id');

        return [
            'name'        => [...$requiredRule, 'string', 'max:255'],
            'slug'        => ['nullable', 'string', 'max:255', Rule::unique('documentation_spaces', 'slug')->where('company_id', $this->input('company_id'))->ignore($spaceId)],
            'description' => ['nullable', 'string'],
            'visibility'  => ['nullable', 'string', Rule::enum(DocumentationSpaceVisibility::class)],
            'icon'        => ['nullable', 'string', 'max:255'],
            'color'       => ['nullable', 'string', 'max:50'],
            'sort_order'  => ['nullable', 'integer', 'min:0'],
            'is_active'   => ['nullable', 'boolean'],
            'parent_id'   => ['nullable', 'integer', 'exists:documentation_spaces,id'],
            'project_id'  => ['nullable', 'integer'],
            'company_id'  => ['nullable', 'integer', 'exists:companies,id'],
        ];
    }
}
