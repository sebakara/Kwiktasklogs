<?php

namespace Webkul\Documentation\Services;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Webkul\Documentation\Enums\DocumentationPageStatus;
use Webkul\Documentation\Enums\DocumentationSpaceVisibility;
use Webkul\Documentation\Filament\Pages\EditPage;
use Webkul\Documentation\Filament\Pages\ViewPage;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationProduct;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Project\Models\Project;

class DocumentationSpaceProvisioningService
{
    public function forProject(Project $project): DocumentationSpace
    {
        $space = DocumentationSpace::query()
            ->where('project_id', $project->id)
            ->first();

        if ($space !== null) {
            return $space;
        }

        $slug = $this->uniqueSpaceSlug(Str::slug($project->name) ?: 'project-'.$project->id, $project->company_id);

        return DocumentationSpace::query()->create([
            'name'        => $project->name,
            'slug'        => $slug,
            'description' => $project->description,
            'visibility'  => DocumentationSpaceVisibility::Internal,
            'color'       => $project->color ?? '#3b82f6',
            'is_active'   => true,
            'project_id'  => $project->id,
            'company_id'  => $project->company_id,
            'creator_id'  => $this->resolveCreatorId($project->creator_id),
        ]);
    }

    public function provisionForProject(Project $project): DocumentationSpace
    {
        $space = $this->forProject($project);

        $this->ensureOverviewPage($space);

        return $space;
    }

    public function forProduct(DocumentationProduct $product): DocumentationSpace
    {
        $space = DocumentationSpace::query()
            ->where('product_id', $product->id)
            ->first();

        if ($space !== null) {
            return $space;
        }

        $slug = $this->uniqueSpaceSlug($product->slug, $product->company_id);

        return DocumentationSpace::query()->create([
            'name'        => $product->name,
            'slug'        => $slug,
            'description' => $product->description,
            'visibility'  => DocumentationSpaceVisibility::Internal,
            'color'       => $product->color ?? '#8b5cf6',
            'product_id'  => $product->id,
            'company_id'  => $product->company_id,
            'creator_id'  => $this->resolveCreatorId($product->creator_id),
        ]);
    }

    public function ensureOverviewPage(DocumentationSpace $space): DocumentationPage
    {
        $page = DocumentationPage::query()
            ->where('space_id', $space->id)
            ->where('slug', 'overview')
            ->first();

        if ($page !== null) {
            return $page;
        }

        return DocumentationPage::query()->create([
            'space_id'    => $space->id,
            'project_id'  => $space->project_id,
            'company_id'  => $space->company_id,
            'title'       => __('documentation::filament/hub.portal.overview_title'),
            'slug'        => 'overview',
            'summary'     => __('documentation::filament/hub.portal.overview_summary'),
            'content'     => '<p>'.e(__('documentation::filament/hub.portal.overview_body')).'</p>',
            'status'      => DocumentationPageStatus::Draft,
            'is_published'=> false,
            'creator_id'  => $this->resolveCreatorId($space->creator_id),
        ]);
    }

    public function defaultPageUrl(DocumentationSpace $space): string
    {
        $page = DocumentationPage::query()
            ->where('space_id', $space->id)
            ->where('slug', 'overview')
            ->first()
            ?? DocumentationPage::query()
                ->where('space_id', $space->id)
                ->orderBy('sort_order')
                ->orderBy('title')
                ->first();

        if ($page === null) {
            $page = $this->ensureOverviewPage($space);
        }

        return ViewPage::getUrl([
            'documentationSpace' => $space->id,
            'pageRecord'         => $page->id,
        ]);
    }

    public function createPageUrl(DocumentationSpace $space): string
    {
        return EditPage::getUrl([
            'documentationSpace' => $space->id,
            'pageRecord'         => 'create',
        ]);
    }

    protected function uniqueSpaceSlug(string $base, ?int $companyId): string
    {
        $slug = $base !== '' ? $base : 'space';
        $candidate = $slug;
        $suffix = 1;

        while (DocumentationSpace::query()
            ->where('company_id', $companyId)
            ->where('slug', $candidate)
            ->exists()) {
            $candidate = $slug.'-'.$suffix;
            $suffix++;
        }

        return $candidate;
    }

    protected function resolveCreatorId(?int $fallback = null): ?int
    {
        $authId = Auth::id();

        if ($authId !== null) {
            return (int) $authId;
        }

        return $fallback;
    }
}
