<?php

namespace Webkul\Support\Mail;

use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Envelope;

class PayloadEnvelope
{
    public static function make(string $subject, array $payload): Envelope
    {
        $replyTo = [];

        if (! empty($payload['from']['address'])) {
            $replyTo[] = new Address(
                $payload['from']['address'],
                $payload['from']['name'] ?? '',
            );
        }

        return new Envelope(
            subject: $subject,
            from: new Address(
                (string) config('mail.from.address'),
                (string) config('mail.from.name'),
            ),
            replyTo: $replyTo,
        );
    }
}
