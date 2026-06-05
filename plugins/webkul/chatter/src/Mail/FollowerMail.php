<?php

namespace Webkul\Chatter\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Webkul\Support\Mail\PayloadEnvelope;

class FollowerMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public function __construct(
        public string $viewTemplate,
        public array $payload
    ) {}

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return PayloadEnvelope::make($this->payload['subject'], $this->payload);
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(view: $this->viewTemplate);
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
