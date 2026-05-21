# Documentation Hub (Aureus ERP Plugin)

In-app documentation and knowledge base for Aureus ERP. The plugin provides a **Documentation Hub** (custom Filament cluster), a **REST API**, and **public share links** for published pages.

## Installation

```bash
php artisan documentation:install
php artisan db:seed --class="Webkul\Documentation\Database\Seeders\DocumentationHubSeeder"
```

Assign hub roles via `DocumentationHubRoleSeeder` or Filament Shield permissions from `config/filament-shield.php`.

## Hub URL

After login: `/admin/documentation/hub` (redirects from `/admin/documentation`).

## Architecture

```
plugins/webkul/documentation/
├── config/           documentation.php, filament-shield.php
├── database/         migrations, factories, seeders
├── resources/
│   ├── lang/         hub + legacy article translations
│   └── views/        hub blades, public share, Blade components
├── routes/
│   ├── api.php       admin/api/v1/documentation/*
│   └── web.php       public shared pages
└── src/
    ├── Filament/     Hub cluster + pages; legacy DocumentationArticle resource
    ├── Http/         API controllers, form requests, JSON resources
    ├── Livewire/     PublicSharedPage
    ├── Models/       spaces, pages, versions, permissions, share links, audit logs
    ├── Policies/     authorization per model
    └── Services/     access, audit, versions, share links, slugs, TOC, etc.
```

### Two UI tracks

| Track | Purpose | Entry |
|-------|---------|--------|
| **Documentation Hub** | Spaces, pages, templates, permissions, audit logs, versions | Cluster `documentation` |
| **Documentation Articles** (legacy) | Project-linked feature docs | Resource `documentation/features` |

Hub and Articles share the plugin package but use separate data models. Hub does **not** require the Project module.

## Module boundaries

| Dependency | Required | Usage |
|------------|----------|--------|
| **Security** (`Webkul\Security`) | Yes | Users, roles, teams; all auth |
| **Support** (`Webkul\Support`) | Optional | `company_id` on records |
| **Project** (`Webkul\Project`) | Optional | Legacy articles + assignee column only |
| **PluginManager** | Yes | Package install lifecycle |

All documentation data lives in `documentation_*` tables owned by this plugin.

## Access control

`DocumentationAccessService` centralizes hub access:

- **Roles**: Super Admin, Admin, Editor, Viewer (config `documentation.roles`)
- **Grants**: `documentation_permissions` on spaces or pages (user, team, or role)
- **Policies**: Gate checks on every Filament page and API action

Editors need explicit Edit/Manage grants; creators do not automatically retain edit rights.

## Features

### Spaces & pages

- Hierarchical pages per space (parent/child)
- Draft / published workflow
- Tags, templates, slug uniqueness per space
- Rich-text editor (hub partial)

### Version history

Snapshots on create, publish, and content change. View, compare, and restore from the hub or API.

### Share links

Public or password-protected links for published pages. Standalone layout at `/documentation/shared/{token}`.

### Audit logs

Tracks create/update/delete/archive, permissions, shares, and version events. Global log for admins; per-page activity on the viewer.

## API (v1)

Base: `admin/api/v1/documentation` (Sanctum).

| Area | Endpoints |
|------|-----------|
| Spaces, pages, tags, templates | CRUD + soft delete |
| Page versions | list, show, create snapshot, restore |
| Permissions | CRUD |
| Share links | create (on page), revoke |
| Audit logs | list, show |

Public: `GET /api/v1/documentation/shared/{token}`.

## Filament hub pages

| Page | Slug |
|------|------|
| Dashboard | `hub` |
| Spaces | `spaces`, `spaces/create`, `spaces/{id}`, `spaces/{id}/edit` |
| Page view/edit | `spaces/{space}/pages/{page}`, `.../edit` |
| Versions | `.../versions`, `.../versions/{version}` |
| Templates | `templates` |
| Permissions | `permissions` |
| Audit logs | `audit-logs` |

## UI components

Reusable Blade components (namespace `documentation::filament.hub.*`):

- `empty-state` — dashed empty panels with icon and optional action
- `section-card` — bordered content sections
- `btn` — buttons with `wire:loading` and optional `wire:confirm`
- `filter-pills` / `filter-pill` — filter toggles

Livewire pages use `InteractsWithDocumentationHubActions` for consistent success/error notifications.

## Configuration

`config/documentation.php`:

- `roles` — Spatie role names
- `permissions` — Shield permission keys
- `integrations` — related module class names (documentation only)

## Tests

```bash
php artisan test --compact plugins/webkul/documentation
```

## Development

```bash
vendor/bin/pint --dirty plugins/webkul/documentation
```
