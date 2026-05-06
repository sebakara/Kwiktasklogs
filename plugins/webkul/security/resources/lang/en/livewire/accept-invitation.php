<?php

return [
    'header' => [
        'sub-heading' => [
            'accept-invitation' => 'Accept Invitation',
        ],
    ],

    'title' => 'Register',

    'heading' => 'Sign up',

    'actions' => [

        'login' => [
            'before' => 'or',
            'label'  => 'sign in to your account',
        ],

    ],

    'form' => [

        'section' => [
            'employer_provided' => [
                'label'       => 'Your details from HR',
                'description' => 'Your full name and email are prefilled by your administrator—they should match what you were given.',
            ],
            'banking' => [
                'label'       => 'Banking details',
                'description' => 'Enter the bank name, the name on the account, and the account number exactly as they appear on your bank records.',
            ],
        ],

        'bank' => [
            'bank_name'      => 'Bank name',
            'account_name'   => 'Account name',
            'account_number' => 'Account number',
        ],

        'email' => [
            'label'   => 'Work email address',
            'helper'  => 'This is the email your invitation was sent to; you’ll use it to sign in.',
        ],

        'name' => [
            'label'  => 'Full name',
            'helper' => 'If this doesn’t match your legal name, ask HR to correct your profile before completing onboarding.',
        ],

        'password' => [
            'label'                => 'Password',
            'validation_attribute' => 'password',
        ],

        'password_confirmation' => [
            'label' => 'Confirm password',
        ],

        'actions' => [

            'register' => [
                'label' => 'Sign up',
            ],

        ],

    ],

    'notifications' => [

        'throttled' => [
            'title' => 'Too many registration attempts',
            'body'  => 'Please try again in :seconds seconds.',
        ],

    ],

];
