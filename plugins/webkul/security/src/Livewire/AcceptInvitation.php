<?php

namespace Webkul\Security\Livewire;

use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Facades\Filament;
use Filament\Forms\Components\Checkbox;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Pages\Concerns\InteractsWithFormActions;
use Filament\Pages\SimplePage;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Validation\Rules\Password;
use Webkul\Employee\Models\Employee;
use Webkul\Security\Models\Invitation;
use Webkul\Security\Models\User;
use Webkul\Security\Settings\UserSettings;

class AcceptInvitation extends SimplePage
{
    use InteractsWithFormActions;
    use InteractsWithForms;

    protected string $view = 'security::livewire.accept-invitation';

    public int $invitation;

    private Invitation $invitationModel;

    public ?array $data = [];

    public function mount(): void
    {
        $this->invitationModel = Invitation::findOrFail($this->invitation);
        $employee = Employee::query()
            ->where('work_email', $this->invitationModel->email)
            ->orWhere('private_email', $this->invitationModel->email)
            ->first();
        $existingUser = User::withTrashed()->where('email', $this->invitationModel->email)->first();

        $resolvedName = '';
        if ($employee !== null && trim((string) ($employee->name ?? '')) !== '') {
            $resolvedName = trim((string) $employee->name);
        } elseif ($existingUser !== null && trim((string) ($existingUser->name ?? '')) !== '') {
            $resolvedName = trim((string) $existingUser->name);
        }

        if ($resolvedName === '') {
            $inviteEmail = (string) $this->invitationModel->email;
            $atPos = strpos($inviteEmail, '@');
            $resolvedName = $atPos !== false
                ? substr($inviteEmail, 0, $atPos)
                : $inviteEmail;
        }

        $this->form->fill([
            'name'                        => $resolvedName,
            'email'                       => $this->invitationModel->email,
            'phone_number'                => $employee?->mobile_phone,
            'address'                     => $employee?->private_street1,
            'nid'                         => $employee?->identification_id,
            'bank_name'                   => $employee?->bank_name,
            'bank_account_holder_name'    => $employee?->bank_account_holder_name,
            'bank_account_number'         => $employee?->bank_account_number,
            'emergency_contact_name'      => $employee?->emergency_contact,
            'emergency_contact_phone'     => $employee?->emergency_phone,
            'emergency_contact_relation'  => $employee?->emergency_contact_relation,
        ]);
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('security::livewire/accept-invitation.form.section.employer_provided.label'))
                    ->description(__('security::livewire/accept-invitation.form.section.employer_provided.description'))
                    ->schema([
                        Grid::make([
                            'default' => 1,
                            'sm'      => 2,
                        ])
                            ->schema([
                                TextInput::make('name')
                                    ->label(__('security::livewire/accept-invitation.form.name.label'))
                                    ->helperText(__('security::livewire/accept-invitation.form.name.helper'))
                                    ->required()
                                    ->readOnly()
                                    ->dehydrated(true)
                                    ->maxLength(255)
                                    ->autofocus(),
                                TextInput::make('email')
                                    ->label(__('security::livewire/accept-invitation.form.email.label'))
                                    ->helperText(__('security::livewire/accept-invitation.form.email.helper'))
                                    ->email()
                                    ->required()
                                    ->readOnly()
                                    ->dehydrated(true)
                                    ->maxLength(255),
                            ]),
                    ]),
                TextInput::make('nid')
                    ->label('NID (National ID)')
                    ->required()
                    ->maxLength(255),
                TextInput::make('password')
                    ->label(__('security::livewire/accept-invitation.form.password.label'))
                    ->password()
                    ->required()
                    ->rule(Password::default())
                    ->same('passwordConfirmation')
                    ->validationAttribute(__('security::livewire/accept-invitation.form.password.validation_attribute')),
                TextInput::make('passwordConfirmation')
                    ->label(__('security::livewire/accept-invitation.form.password_confirmation.label'))
                    ->password()
                    ->required()
                    ->dehydrated(false),
                TextInput::make('phone_number')
                    ->label('Phone number')
                    ->required()
                    ->tel(),
                Textarea::make('address')
                    ->label('Address')
                    ->required()
                    ->rows(3),
                Section::make(__('security::livewire/accept-invitation.form.section.banking.label'))
                    ->description(__('security::livewire/accept-invitation.form.section.banking.description'))
                    ->schema([
                        Grid::make([
                            'default' => 1,
                            'md'      => 3,
                        ])
                            ->schema([
                                TextInput::make('bank_name')
                                    ->label(__('security::livewire/accept-invitation.form.bank.bank_name'))
                                    ->required()
                                    ->maxLength(255),
                                TextInput::make('bank_account_holder_name')
                                    ->label(__('security::livewire/accept-invitation.form.bank.account_name'))
                                    ->required()
                                    ->maxLength(255),
                                TextInput::make('bank_account_number')
                                    ->label(__('security::livewire/accept-invitation.form.bank.account_number'))
                                    ->required()
                                    ->maxLength(255),
                            ]),
                    ]),
                FileUpload::make('passport_image_path')
                    ->label('Passport image upload')
                    ->image()
                    ->disk('public_root')
                    ->directory('employees/onboarding/passport')
                    ->required()
                    ->rules(['required']),
                FileUpload::make('national_id_file_path')
                    ->label('NID upload')
                    ->disk('public_root')
                    ->acceptedFileTypes(['image/*', 'application/pdf'])
                    ->directory('employees/onboarding/nid')
                    ->required()
                    ->rules(['required']),
                TextInput::make('emergency_contact_name')
                    ->label('Emergency contact name')
                    ->required()
                    ->maxLength(255),
                TextInput::make('emergency_contact_phone')
                    ->label('Emergency contact phone number')
                    ->required()
                    ->tel(),
                TextInput::make('emergency_contact_relation')
                    ->label('Emergency contact relation')
                    ->required()
                    ->maxLength(255),
                Checkbox::make('agreed_to_terms')
                    ->label('I agree to the terms and conditions')
                    ->accepted()
                    ->required(),
            ])
            ->statePath('data');
    }

    public function create(): void
    {
        $this->invitationModel = Invitation::findOrFail($this->invitation);

        $this->form->validate();

        $state = $this->form->getState();

        $user = User::withTrashed()
            ->firstOrNew(['email' => $this->invitationModel->email]);

        if ($user->trashed()) {
            $user->restore();
        }

        $user->fill([
            'name'      => $state['name'],
            'password'  => $state['password'],
            'is_active' => true,
        ]);

        if (! $user->default_company_id) {
            $user->default_company_id = app(UserSettings::class)->default_company_id;
        }

        $user->save();

        $employee = Employee::query()
            ->where('user_id', $user->id)
            ->orWhere('work_email', $this->invitationModel->email)
            ->orWhere('private_email', $this->invitationModel->email)
            ->first();

        if ($employee) {
            $employee->update([
                'name'                       => $state['name'],
                'user_id'                    => $user->id,
                'work_email'                 => $this->invitationModel->email,
                'identification_id'          => $state['nid'],
                'mobile_phone'               => $state['phone_number'],
                'private_street1'            => $state['address'],
                'bank_name'                  => $state['bank_name'],
                'bank_account_holder_name'   => $state['bank_account_holder_name'],
                'bank_account_number'        => $state['bank_account_number'],
                'passport_image_path'        => $state['passport_image_path'] ?? null,
                'national_id_file_path'      => $state['national_id_file_path'] ?? null,
                'emergency_contact'          => $state['emergency_contact_name'],
                'emergency_phone'            => $state['emergency_contact_phone'],
                'emergency_contact_relation' => $state['emergency_contact_relation'],
                'agreed_to_terms'            => true,
                'agreed_to_terms_at'         => now(),
            ]);
        }

        if ($employee) {
            Employee::assignEmployeeRoleToUser($user);
        } else {
            $defaultRoleId = app(UserSettings::class)->default_role_id;

            if ($defaultRoleId && ! $user->roles()->whereKey($defaultRoleId)->exists()) {
                $user->assignRole($defaultRoleId);
            }
        }

        $this->invitationModel->delete();

        $loginUrl = Filament::getPanel('admin')->getLoginUrl();

        if (! is_string($loginUrl) || $loginUrl === '') {
            $loginUrl = url('/admin/login');
        }

        session()->flash('status', __('security::livewire/accept-invitation.flash.onboarding_complete'));

        $this->redirect($loginUrl);
    }

    /**
     * @return array<Action | ActionGroup>
     */
    public function getFormActions(): array
    {
        return [
            $this->getRegisterFormAction(),
        ];
    }

    public function getRegisterFormAction(): Action
    {
        return Action::make('register')
            ->label(__('security::livewire/accept-invitation.form.actions.register.label'))
            ->submit('create');
    }

    public function getHeading(): string
    {
        return 'Accept Invitation';
    }

    public function hasLogo(): bool
    {
        return false;
    }

    public function getSubHeading(): string
    {
        return __('security::livewire/accept-invitation.header.sub-heading.accept-invitation');
    }
}
