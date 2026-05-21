<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Webkul\Documentation\Enums\DocumentationPageStatus;

class DocumentationPageRequest extends FormRequest
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
        $pageId = $this->route('page') ?? $this->route('id');
        $spaceId = $this->input('space_id');

        return [
            'title'          => [...$requiredRule, 'string', 'max:255'],
            'slug'           => ['nullable', 'string', 'max:255', Rule::unique('documentation_pages', 'slug')->where('space_id', $spaceId)->ignore($pageId)],
            'summary'        => ['nullable', 'string'],
            'content'        => ['nullable', 'string'],
            'status'         => ['nullable', 'string', Rule::enum(DocumentationPageStatus::class)],
            'module'         => ['nullable', 'string', 'max:255'],
            'audience'       => ['nullable', 'string', 'max:50'],
            'is_published'   => ['nullable', 'boolean'],
            'published_at'   => ['nullable', 'date'],
            'sort_order'     => ['nullable', 'integer', 'min:0'],
            'space_id'       => [$isUpdate ? 'sometimes' : 'required', 'integer', 'exists:documentation_spaces,id'],
            'parent_id'      => ['nullable', 'integer', 'exists:documentation_pages,id'],
            'template_id'    => ['nullable', 'integer', 'exists:documentation_templates,id'],
            'project_id'     => ['nullable', 'integer'],
            'company_id'     => ['nullable', 'integer', 'exists:companies,id'],
            'change_note'    => ['nullable', 'string', 'max:1000'],
            'tag_ids'        => ['nullable', 'array'],
            'tag_ids.*'      => ['integer', 'exists:documentation_tags,id'],
        ];
    }
}
