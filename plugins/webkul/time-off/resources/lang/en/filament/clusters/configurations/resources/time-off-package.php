<?php

return [
    'title'            => 'Time off package',
    'plural'           => 'Time off packages',
    'navigation'       => [
        'title' => 'Time off packages',
    ],
    'form'             => [
        'sections' => [
            'general' => [
                'title' => 'Package details',
            ],
            'validity' => [
                'title' => 'Validity period',
            ],
        ],
        'fields' => [
            'name'                 => 'Package name',
            'description'          => 'Description',
            'company'              => 'Company',
            'is-active'            => 'Active',
            'valid-from'           => 'Valid from',
            'valid-to'             => 'Valid to',
            'valid-to-placeholder' => 'Leave empty for no end date',
        ],
    ],
    'table' => [
        'columns' => [
            'name'       => 'Name',
            'valid-from' => 'Valid from',
            'valid-to'   => 'Valid to',
            'lines'      => 'Leave types',
            'total-days' => 'Total days / employee',
            'active'     => 'Active',
        ],
    ],
    'actions' => [
        'assign' => [
            'label'  => 'Assign to employees',
            'modal'  => [
                'heading'     => 'Assign package to employees',
                'description' => 'Creates one allocation per leave type in this package for each selected employee.',
            ],
            'fields' => [
                'employees'    => 'Employees',
                'auto-approve' => 'Approve allocations immediately',
                'notes'        => 'Notes (optional)',
            ],
            'assign-all-active' => 'Assign to all active employees',
            'notification'      => [
                'success' => [
                    'title' => 'Package assigned',
                    'body'  => 'Created :created allocation(s) for :employees employee(s).',
                ],
                'warning' => [
                    'title' => 'Package assigned with warnings',
                    'body'  => 'Created :created allocation(s), skipped :skipped duplicate(s).',
                ],
                'empty' => [
                    'title'       => 'Nothing assigned',
                    'body'        => 'No allocations were created. Check that the package has lines and employees are selected.',
                    'all-skipped' => 'No new allocations were created — each employee already has an overlapping allocation for every line in this package.',
                ],
            ],
        ],
    ],
    'relation-managers' => [
        'lines' => [
            'title'  => 'Leave types in package',
            'fields' => [
                'leave-type' => 'Time off type',
                'days'       => 'Days',
            ],
        ],
    ],
];
