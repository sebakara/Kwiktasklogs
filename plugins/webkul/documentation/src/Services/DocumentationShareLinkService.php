<?php

namespace Webkul\Documentation\Services;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Webkul\Documentation\Enums\DocumentationShareLinkVisibility;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationShareLink;

class DocumentationShareLinkService
{
    /**
     * @param  array<string, mixed>  $attributes
     */
    public function create(DocumentationPage $page, array $attributes = []): DocumentationShareLink
    {
        $visibility = DocumentationShareLinkVisibility::tryFrom((string) ($attributes['visibility'] ?? ''))
            ?? DocumentationShareLinkVisibility::Public;

        $password = null;

        if ($visibility === DocumentationShareLinkVisibility::Restricted) {
            if (empty($attributes['password'])) {
                throw ValidationException::withMessages([
                    'password' => [__('documentation::filament/hub.share.validation.password_required')],
                ]);
            }

            $password = Hash::make((string) $attributes['password']);
        }

        return $page->shareLinks()->create([
            'token'      => Str::random(64),
            'visibility' => $visibility,
            'password'   => $password,
            'expires_at' => $attributes['expires_at'] ?? null,
            'max_views'  => $attributes['max_views'] ?? null,
            'is_active'  => true,
            'company_id' => $page->company_id,
            'creator_id' => auth()->id(),
        ]);
    }

    public function revoke(DocumentationShareLink $link): DocumentationShareLink
    {
        $link->update(['is_active' => false]);

        return $link->fresh();
    }

    public function findActiveByToken(string $token): ?DocumentationShareLink
    {
        return DocumentationShareLink::query()
            ->active()
            ->where('token', $token)
            ->first();
    }

    public function isRestricted(DocumentationShareLink $link): bool
    {
        return $link->visibility === DocumentationShareLinkVisibility::Restricted
            || $link->password !== null;
    }

    public function validateAccess(DocumentationShareLink $link, ?string $password = null): bool
    {
        if (! $link->is_active || $link->isExpired() || $link->hasReachedViewLimit()) {
            return false;
        }

        if (! $this->isRestricted($link)) {
            return true;
        }

        return $password !== null
            && $password !== ''
            && $link->password !== null
            && Hash::check($password, $link->password);
    }

    public function recordView(DocumentationShareLink $link): void
    {
        $link->increment('view_count');
    }

    public function publicUrl(DocumentationShareLink $link): string
    {
        return route('documentation.shared', ['token' => $link->token]);
    }
}
