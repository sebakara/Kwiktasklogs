<?php

return [
    'navigation' => [
        'title' => 'Reviews',
    ],
    'form' => [
        'section' => [
            'period' => [
                'title' => 'Review period & rating',
            ],
        ],
        'period-type' => 'Review period type',
        'reference-date' => 'Reference date',
        'custom-period-start' => 'Start date',
        'custom-period-end' => 'End date',
        'manager-rating' => 'Manager rating',
        'manager-comments' => 'Comments',
    ],
    'infolist' => [
        'section' => [
            'review' => [
                'title' => 'Review details',
            ],
        ],
        'metrics' => [
            'label' => 'Snapshot metrics (projects & tasks)',
        ],
    ],
    'table' => [
        'columns' => [
            'period-label' => 'Period',
            'period-type' => 'Period type',
            'period-start' => 'Start',
            'period-end' => 'End',
            'status' => 'Status',
            'manager-rating' => 'Rating',
            'reviewer' => 'Reviewer',
            'created-at' => 'Created',
        ],
        'header-actions' => [
            'create' => 'Create review',
        ],
        'actions' => [
            'finalize' => [
                'label' => 'Finalize',
                'modal-heading' => 'Finalize this review?',
                'modal-description' => 'After finalization, project metrics and the review period can no longer be changed.',
            ],
        ],
    ],
    'notifications' => [
        'duplicate-period' => [
            'title' => 'Review already exists',
            'body' => 'A review for this employee and this period is already saved.',
        ],
    ],
];
