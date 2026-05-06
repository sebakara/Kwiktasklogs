<?php

return [
    'title'       => 'Internal chat',
    'heading'     => 'Internal chat',
    'navigation'  => [
        'title' => 'Internal chat',
    ],

    'sidebar' => [
        'badge' => 'Team messages',
        'hint'  => 'Pick someone to continue or begin a conversation.',
    ],

    'empty_state' => [
        'title' => 'Choose someone to chat with',
    ],

    /** Shown in the main panel header/thread when no recipient is selected yet */
    'no_peer_selected' => [
        'heading'           => 'Your conversation',
        'subheading'        => 'Select someone on the left to view messages.',
        'thread_hint_title' => 'Nothing to show yet',
        'composer_locked'   => 'Choose who you’re messaging above to unlock the composer.',
    ],

    'unread_line' => ':count unread message|:count unread messages',

    /** Displayed under each message bubble (Carbon format tokens). */
    'datetime_format' => 'M j, Y · g:i A',

    'intro'       => 'Choose a teammate from the list to read the thread or start a new conversation. HR can message anyone with an employee profile; peers can message colleagues in the same company.',
    'recent'      => 'Recent conversations',
    'unknown_user'=> 'Unknown user',

    'empty_conversations' => 'No conversations yet.',

    'fields' => [
        'recipient' => 'Who do you want to chat with?',
        'message'   => 'Message',
    ],

    'placeholders' => [
        'choose_recipient' => 'Select a person…',
        'message'          => 'Type a short message…',
    ],

    'actions' => [
        'send' => 'Send',
    ],

    'notifications' => [
        'access_denied' => [
            'title' => 'You cannot open a chat with that user.',
        ],
        'send_failed' => [
            'title' => 'Could not send the message.',
        ],
        'sent' => [
            'title' => 'Message sent.',
        ],
    ],
];
