<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DocumentationPageMoveRequest extends FormRequest
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
            'parent_id' => ['nullable', 'integer', 'exists:documentation_pages,id'],
            'space_id'  => ['nullable', 'integer', 'exists:documentation_spaces,id'],
        ];
    }
}
