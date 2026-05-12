<x-mail::message>
@lang('security::views/emails/user-invitation.greeting', ['name' => $recipientName])

@lang('security::views/emails/user-invitation.welcome')

@lang('security::views/emails/user-invitation.invitation', ['app' => config('app.name')])

<x-mail::button :url="$acceptUrl">
@lang('security::views/emails/user-invitation.create-account')
</x-mail::button>

@lang('security::views/emails/user-invitation.portal-info')

@lang('security::views/emails/user-invitation.discard-email')

@lang('security::views/emails/user-invitation.closing')

@lang('security::views/emails/user-invitation.signature', ['company' => $companyName])
</x-mail::message>
