<?php

return [
    'title'      => 'Employee review',
    'navigation' => [
        'title' => 'Employee reviews',
    ],
    'table' => [
        'columns' => [
            'employee'       => 'Employee',
            'department'     => 'Department',
            'period-label'   => 'Period',
            'period-type'    => 'Period type',
            'period-start'   => 'Start',
            'period-end'     => 'End',
            'status'         => 'Status',
            'manager-rating' => 'Rating',
            'reviewer'       => 'Reviewer',
            'created-at'     => 'Created',
        ],
        'filters' => [
            'employee'     => 'Employee',
            'reviewer'     => 'Reviewer',
            'department'   => 'Department',
            'period-type'  => 'Period type',
            'status'       => 'Status',
            'period-start' => 'Period start',
        ],
    ],
    'infolist' => [
        'sections' => [
            'review' => [
                'title' => 'Review',
            ],
            'metrics' => [
                'title' => 'Metrics snapshot',
            ],
        ],
    ],
];
