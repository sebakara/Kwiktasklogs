<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DocumentationPageReorderRequest extends FormRequest
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
            'page_ids'   => ['required', 'array', 'min:1'],
            'page_ids.*' => ['integer', 'exists:documentation_pages,id'],
        ];
    }
}
