<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreDocumentRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user() !== null;
    }

    /**
     * @return array<string, array<int, string>>
     */
    public function rules(): array
    {
        return [
            'title'              => ['required', 'string', 'max:255'],
            'file'               => ['required', 'file', 'mimes:pdf', 'max:10240'],
            'parent_document_id' => ['nullable', 'integer', 'exists:documents,id'],
        ];
    }
}
