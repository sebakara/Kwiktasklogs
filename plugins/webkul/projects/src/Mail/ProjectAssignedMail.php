<?php

namespace Webkul\Project\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ProjectAssignedMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * @var array<int, array<string, mixed>>
     */
    protected array $attachmentData = [];

    public function __construct(
        public string $viewTemplate,
        public array $payload
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: $this->payload['subject'],
            from: new Address($this->payload['from']['address'], '"'.addslashes($this->payload['from']['name']).'"'),
        );
    }

    public function content(): Content
    {
        return new Content(view: $this->viewTemplate);
    }

    /**
     * @return array<int, Attachment>
     */
    public function attachments(): array
    {
        $attachments = [];

        foreach ($this->attachmentData as $attachment) {
            if (isset($attachment['path'])) {
                $attachments[] = Attachment::fromPath($attachment['path'])
                    ->as($attachment['name'] ?? null)
                    ->withMime($attachment['mime'] ?? null);
            } elseif (isset($attachment['data'])) {
                $attachments[] = Attachment::fromData(
                    fn () => $attachment['data'],
                    $attachment['name']
                )->withMime($attachment['mime'] ?? null);
            }
        }

        return $attachments;
    }

    /**
     * @param  array<int, array<string, mixed>>  $attachments
     */
    public function withAttachments(array $attachments): static
    {
        $this->attachmentData = $attachments;

        return $this;
    }
}
