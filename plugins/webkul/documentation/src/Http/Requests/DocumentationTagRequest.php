<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DocumentationTagRequest extends FormRequest
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
        $tagId = $this->route('tag') ?? $this->route('id');

        return [
            'name'       => [...$requiredRule, 'string', 'max:255'],
            'slug'       => ['nullable', 'string', 'max:255', Rule::unique('documentation_tags', 'slug')->where('company_id', $this->input('company_id'))->ignore($tagId)],
            'color'      => ['nullable', 'string', 'max:50'],
            'sort_order' => ['nullable', 'integer', 'min:0'],
            'company_id' => ['nullable', 'integer', 'exists:companies,id'],
        ];
    }
}
