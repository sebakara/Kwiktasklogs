<?php

namespace Webkul\Security\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\URL;
use Webkul\Security\Models\Invitation;

class UserInvitationMail extends Mailable
{
    use Queueable, SerializesModels;

    private Invitation $invitation;

    private string $recipientName;

    private string $companyName;

    /**
     * Create a new message instance.
     */
    public function __construct(Invitation $invitation, ?string $recipientName = null, ?string $companyName = null)
    {
        $this->invitation = $invitation;
        $this->recipientName = $recipientName ?: $invitation->email;
        $this->companyName = $companyName ?: (string) config('app.name');
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: __('security::mail/user-invitation-mail.user-invitation.subject', [
                'app' => config('app.name'),
            ]),
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'security::emails.user-invitation',
            with: [
                'acceptUrl'     => URL::signedRoute(
                    'security.invitation.accept',
                    ['invitation' => $this->invitation]
                ),
                'recipientName' => $this->recipientName,
                'companyName'   => $this->companyName,
            ]
        );
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
