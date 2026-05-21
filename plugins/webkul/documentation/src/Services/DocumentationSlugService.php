<?php

namespace Webkul\Documentation\Services;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class DocumentationSlugService
{
    public function uniqueFor(Model $model, string $value, string $column = 'slug', array $scopes = []): string
    {
        $baseSlug = Str::slug($value);
        $baseSlug = $baseSlug !== '' ? $baseSlug : 'item';
        $slug = $baseSlug;
        $counter = 1;

        while ($this->exists($model, $column, $slug, $scopes)) {
            $slug = "{$baseSlug}-{$counter}";
            $counter++;
        }

        return $slug;
    }

    /**
     * @param  array<string, mixed>  $scopes
     */
    protected function exists(Model $model, string $column, string $slug, array $scopes): bool
    {
        $query = $model->newQuery()->where($column, $slug);

        foreach ($scopes as $scopeColumn => $scopeValue) {
            $query->where($scopeColumn, $scopeValue);
        }

        if ($model->exists) {
            $query->whereKeyNot($model->getKey());
        }

        return $query->exists();
    }
}
