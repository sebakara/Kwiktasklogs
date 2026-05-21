<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Documentation Hub roles (Spatie)
    |--------------------------------------------------------------------------
    |
    | Hub access is granted via these roles and/or explicit documentation_permissions
    | rows. Security module (Webkul\Security) provides User, Role, and Team models.
    |
    */
    'roles' => [
        'super_admin' => 'Documentation Super Admin',
        'admin'       => 'Documentation Admin',
        'editor'      => 'Documentation Editor',
        'viewer'      => 'Documentation Viewer',
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom permissions (Filament Shield)
    |--------------------------------------------------------------------------
    */
    'permissions' => [
        'super_admin' => 'documentation_hub_super_admin',
        'manage'      => 'manage_documentation_hub',
        'editor'      => 'documentation_hub_editor',
        'viewer'      => 'documentation_hub_viewer',
    ],

    /*
    |--------------------------------------------------------------------------
    | Module boundaries
    |--------------------------------------------------------------------------
    |
    | The Documentation plugin owns all documentation_* tables and hub UI.
    | Optional integrations with other Aureus ERP modules:
    |
    | - security: required — authentication, users, roles, teams
    | - support:  optional — company_id on spaces/pages (multi-tenant)
    | - project:  optional — legacy Documentation Articles feature assignee workflow
    |
    | Hub features do not depend on Project; only DocumentationArticle does.
    |
    */
    'integrations' => [
        'security' => 'Webkul\\Security\\Models\\User',
        'company'  => 'Webkul\\Support\\Models\\Company',
        'project'  => 'Webkul\\Project\\Models\\Project',
    ],

    /*
    |--------------------------------------------------------------------------
    | Project documentation auto-provisioning
    |--------------------------------------------------------------------------
    |
    | When enabled, creating a project also creates a linked documentation space
    | and a starter Overview page in the Documentation Hub.
    |
    */
    'auto_provision_project_space' => env('DOCUMENTATION_AUTO_PROVISION_PROJECT', true),

];
