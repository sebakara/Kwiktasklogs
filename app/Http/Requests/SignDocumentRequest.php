<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SignDocumentRequest extends FormRequest
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
            'signed_name'    => ['required', 'string', 'max:255'],
            'signature_data' => ['nullable', 'string'],
            'agree'          => ['required', 'accepted'],
        ];
    }
}
