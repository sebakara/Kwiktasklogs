<?php

namespace Webkul\TimeOff\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Webkul\Support\Mail\PayloadEnvelope;

class TimeOffRequestMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public string $viewTemplate,
        public array $payload
    ) {}

    public function envelope(): Envelope
    {
        return PayloadEnvelope::make($this->payload['subject'], $this->payload);
    }

    public function content(): Content
    {
        return new Content(view: $this->viewTemplate);
    }

    public function attachments(): array
    {
        return [];
    }
}
