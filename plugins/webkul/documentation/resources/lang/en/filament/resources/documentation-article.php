<?php

return [
    'model_label'        => 'Feature',
    'plural_model_label' => 'Features',

    'navigation' => [
        'label' => 'Features',
        'group' => 'Documentation',
    ],

    'audiences' => [
        'all'      => 'All',
        'employee' => 'Employee',
        'manager'  => 'Manager',
        'admin'    => 'Admin',
    ],

    'form' => [
        'sections' => [
            'content'  => 'Feature content',
            'settings' => 'Settings',
        ],
        'fields' => [
            'title'              => 'Feature name',
            'slug'               => 'Slug',
            'module'             => 'Module',
            'module_placeholder' => 'Example: Sales, HR, Accounting',
            'project'            => 'Project',
            'assignee'           => 'Contributing employee (optional)',
            'assignee_helper'    => 'Optional: link this feature to a specific contributor. Attribution for project documentation still follows the project documentation assignee.',
            'audience'           => 'Audience',
            'summary'            => 'Short summary',
            'content'            => 'Documentation',
            'is_published'       => 'Published',
            'sort_order'         => 'Sort order',
        ],
        'validation' => [
            'project_not_allowed' => 'You can only create features for projects where you are the documentation assignee.',
        ],
    ],

    'table' => [
        'columns' => [
            'title'                                 => 'Feature',
            'module'                                => 'Module',
            'project'                               => 'Project',
            'assignee'                              => 'Contributor',
            'created_by'                            => 'Recorded author',
            'documentation_assignee_author_subtitle'=> 'Authored by project documentation assignee',
            'audience'                              => 'Audience',
            'is_published'                          => 'Published',
            'sort_order'                            => 'Sort',
            'updated_at'                            => 'Updated',
        ],
        'filters' => [
            'project'               => 'Project',
            'assignee'              => 'Contributor',
            'my_assignment'         => 'Assignment',
            'my_assignment_options' => [
                'mine' => 'Assigned to me',
            ],
        ],
    ],
];
