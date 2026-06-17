<?php

return [
    'model-label' => 'Payment Method',

    'navigation' => [
        'title' => 'Payment Methods',
        'group' => 'Invoicing',
    ],

    'form' => [
        'fields' => [
            'name'         => 'Name',
            'code'         => 'Code',
            'payment-type' => 'Payment Type',
        ],
    ],

    'table' => [
        'columns' => [
            'name'         => 'Name',
            'code'         => 'Code',
            'payment-type' => 'Payment Type',
        ],
    ],
];
