<?php

namespace Webkul\Documentation\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Webkul\Documentation\Models\DocumentationArticle;
use Webkul\Project\Models\Project;
use Webkul\Security\Models\User;

class DocumentationArticlePolicy
{
    use HandlesAuthorization;

    protected function userIsProjectDocumentationLead(User $user, ?int $projectId): bool
    {
        if (! $projectId) {
            return false;
        }

        return Project::query()
            ->whereKey($projectId)
            ->where('documentation_assignee_id', $user->id)
            ->exists();
    }

    public function viewAny(User $user): bool
    {
        return true;
    }

    public function view(User $user, DocumentationArticle $documentationArticle): bool
    {
        if ($user->can('view_documentation_article')) {
            return true;
        }

        if ($documentationArticle->assignee_id === $user->id) {
            return true;
        }

        if ($this->userIsProjectDocumentationLead($user, $documentationArticle->project_id)) {
            return true;
        }

        /*
         * Anyone authenticated can read PUBLISHED articles. Drafts are restricted to
         * privileged users (handled by the branches above).
         */
        return (bool) $documentationArticle->is_published;
    }

    public function create(User $user): bool
    {
        if ($user->can('create_documentation_article')) {
            return true;
        }

        return Project::query()->where('documentation_assignee_id', $user->id)->exists();
    }

    public function update(User $user, DocumentationArticle $documentationArticle): bool
    {
        if ($user->can('update_documentation_article')) {
            return true;
        }

        if ($this->userIsProjectDocumentationLead($user, $documentationArticle->project_id)) {
            return true;
        }

        return $documentationArticle->assignee_id === $user->id;
    }

    public function delete(User $user, DocumentationArticle $documentationArticle): bool
    {
        if ($user->can('delete_documentation_article')) {
            return true;
        }

        return $this->userIsProjectDocumentationLead($user, $documentationArticle->project_id);
    }

    public function deleteAny(User $user): bool
    {
        return $this->viewAny($user);
    }

    public function forceDelete(User $user, DocumentationArticle $documentationArticle): bool
    {
        if ($user->can('force_delete_documentation_article')) {
            return true;
        }

        return $this->userIsProjectDocumentationLead($user, $documentationArticle->project_id);
    }

    public function forceDeleteAny(User $user): bool
    {
        return $user->can('force_delete_any_documentation_article')
            || Project::query()->where('documentation_assignee_id', $user->id)->exists();
    }

    public function restore(User $user, DocumentationArticle $documentationArticle): bool
    {
        if ($user->can('restore_documentation_article')) {
            return true;
        }

        return $this->userIsProjectDocumentationLead($user, $documentationArticle->project_id);
    }

    public function restoreAny(User $user): bool
    {
        return $user->can('restore_any_documentation_article')
            || Project::query()->where('documentation_assignee_id', $user->id)->exists();
    }

    public function reorder(User $user): bool
    {
        return $user->can('reorder_documentation_article');
    }
}
