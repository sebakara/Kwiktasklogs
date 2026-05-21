<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DocumentationTemplateRequest extends FormRequest
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
        $templateId = $this->route('template') ?? $this->route('id');

        return [
            'name'        => [...$requiredRule, 'string', 'max:255'],
            'slug'        => ['nullable', 'string', 'max:255', Rule::unique('documentation_templates', 'slug')->where('company_id', $this->input('company_id'))->ignore($templateId)],
            'description' => ['nullable', 'string'],
            'content'     => ['nullable', 'string'],
            'module'      => ['nullable', 'string', 'max:255'],
            'is_active'   => ['nullable', 'boolean'],
            'company_id'  => ['nullable', 'integer', 'exists:companies,id'],
        ];
    }
}
