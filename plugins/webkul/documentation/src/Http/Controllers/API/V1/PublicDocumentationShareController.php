<?php

namespace Webkul\Documentation\Http\Controllers\API\V1;

use Illuminate\Http\JsonResponse;
use Knuckles\Scribe\Attributes\Group;
use Knuckles\Scribe\Attributes\Unauthenticated;
use Webkul\Documentation\Enums\DocumentationAuditAction;
use Webkul\Documentation\Http\Requests\PublicShareLinkRequest;
use Webkul\Documentation\Http\Resources\V1\DocumentationPageResource;
use Webkul\Documentation\Services\DocumentationAuditService;
use Webkul\Documentation\Services\DocumentationShareLinkService;

#[Group('Documentation Hub Public API')]
#[Unauthenticated]
class PublicDocumentationShareController extends Controller
{
    public function __construct(
        protected DocumentationShareLinkService $shareLinkService,
        protected DocumentationAuditService $auditService,
    ) {}

    public function show(string $token, PublicShareLinkRequest $request): JsonResponse|DocumentationPageResource
    {
        $link = $this->shareLinkService->findActiveByToken($token);

        if ($link === null) {
            return response()->json(['message' => 'Share link not found or expired.'], 404);
        }

        if (! $this->shareLinkService->validateAccess($link, $request->input('password'))) {
            return response()->json(['message' => 'Invalid or protected share link.'], 403);
        }

        $page = $link->page()->with(['space', 'tags'])->firstOrFail();

        if (! $page->is_published) {
            return response()->json(['message' => 'This page is not published.'], 403);
        }

        $this->shareLinkService->recordView($link);

        $this->auditService->log(
            DocumentationAuditAction::Viewed,
            user: null,
            page: $page,
            metadata: ['share_link_id' => $link->id, 'public' => true]
        );

        return (new DocumentationPageResource($page))
            ->additional([
                'message' => 'Shared page retrieved successfully.',
                'role'    => 'public_link',
            ]);
    }
}
