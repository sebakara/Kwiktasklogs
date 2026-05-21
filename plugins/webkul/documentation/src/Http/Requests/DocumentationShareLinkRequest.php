<?php

namespace Webkul\Documentation\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;

class DocumentationShareLinkRequest extends FormRequest
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
        $visibility = $this->input('visibility', DocumentationShareLinkVisibility::Public->value);

        return [
            'visibility' => ['nullable', 'string', Rule::enum(DocumentationShareLinkVisibility::class)],
            'password'   => [
                Rule::requiredIf($visibility === DocumentationShareLinkVisibility::Restricted->value),
                'nullable',
                'string',
                'min:4',
                'max:255',
            ],
            'expires_at' => ['nullable', 'date', 'after:now'],
            'max_views'  => ['nullable', 'integer', 'min:1'],
            'is_active'  => ['nullable', 'boolean'],
        ];
    }
}
