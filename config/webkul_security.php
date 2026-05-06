<?php

return [
    /*
    | User emails that must never be deleted (soft or hard), case-insensitive.
    | Comma-separated in env; defaults to bootstrap admin seed email.
    */
    'non_deletable_user_emails' => array_values(array_unique(array_filter(array_map(
        static fn (string $email): string => mb_strtolower(trim($email)),
        explode(',', (string) env('KWIK_NON_DELETABLE_USER_EMAILS', 'admin@example.com'))
    )))),
];
