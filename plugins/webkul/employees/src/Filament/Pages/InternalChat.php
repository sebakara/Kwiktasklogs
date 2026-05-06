<?php

namespace Webkul\Employee\Filament\Pages;

use Filament\Facades\Filament;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Webkul\Employee\Services\EmployeeMessagingService;
use Webkul\Security\Models\User;

class InternalChat extends Page
{
    protected string $view = 'employees::filament.pages.internal-chat';

    protected static ?string $slug = 'employees/internal-chat';

    protected static ?int $navigationSort = 15;

    public ?int $selectedPeerId = null;

    public string $composeBody = '';

    public static function canAccess(array $parameters = []): bool
    {
        $user = Auth::user();

        return $user instanceof User && $user->is_active;
    }

    public function getTitle(): string|Htmlable
    {
        return __('employees::filament/pages/internal-chat.title');
    }

    public function getHeading(): string|Htmlable
    {
        return __('employees::filament/pages/internal-chat.heading');
    }

    public static function getNavigationLabel(): string
    {
        return __('employees::filament/pages/internal-chat.navigation.title');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('employees::filament/resources/employee.navigation.group');
    }

    public function updatedSelectedPeerId(?int $value): void
    {
        if ($value === null || $value < 1) {
            return;
        }

        $user = $this->authUser();
        $recipient = User::query()->find($value);

        if (! $recipient instanceof User || ! app(EmployeeMessagingService::class)->canSend($user, $recipient)) {
            $this->selectedPeerId = null;
            Notification::make()
                ->title(__('employees::filament/pages/internal-chat.notifications.access_denied.title'))
                ->danger()
                ->send();

            return;
        }

        app(EmployeeMessagingService::class)->markIncomingReadForPeer($user, $value);
    }

    public function send(): void
    {
        $this->validate([
            'composeBody'      => ['required', 'string', 'max:10000'],
            'selectedPeerId'   => ['required', 'integer', 'exists:users,id'],
        ]);

        $user = $this->authUser();

        $created = app(EmployeeMessagingService::class)->send($user, $this->selectedPeerId, $this->composeBody);

        if (! $created) {
            Notification::make()
                ->title(__('employees::filament/pages/internal-chat.notifications.send_failed.title'))
                ->danger()
                ->send();

            return;
        }

        $this->composeBody = '';
        app(EmployeeMessagingService::class)->markIncomingReadForPeer($user, (int) $this->selectedPeerId);

        Notification::make()
            ->title(__('employees::filament/pages/internal-chat.notifications.sent.title'))
            ->success()
            ->send();
    }

    /**
     * @return array<string, mixed>
     */
    protected function getViewData(): array
    {
        $user = $this->authUser();
        $service = app(EmployeeMessagingService::class);

        $recipientOptions = $service->availableRecipients($user)
            ->mapWithKeys(fn (User $u): array => [$u->id => $u->name.' ('.$u->email.')'])
            ->all();

        $thread = new Collection;
        $selectedPeer = null;

        if ($this->selectedPeerId) {
            $selectedPeer = User::query()
                ->select(['id', 'name', 'email'])
                ->find($this->selectedPeerId);

            if ($selectedPeer instanceof User) {
                $thread = $service->threadBetween($user, $this->selectedPeerId);
            }
        }

        return [
            'conversations'    => $service->conversationSummaries($user),
            'recipientOptions' => $recipientOptions,
            'thread'           => $thread,
            'selectedPeer'     => $selectedPeer,
        ];
    }

    private function authUser(): User
    {
        $user = Filament::auth()->user();

        if (! $user instanceof User) {
            abort(403);
        }

        return $user;
    }
}
