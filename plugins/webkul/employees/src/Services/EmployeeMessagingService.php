<?php

namespace Webkul\Employee\Services;

use Illuminate\Database\Eloquent\Collection;
use Webkul\Employee\Models\Employee;
use Webkul\Employee\Models\EmployeeChatMessage;
use Webkul\Security\Models\User;

class EmployeeMessagingService
{
    public function canSend(User $sender, User $recipient): bool
    {
        if (! $sender->is_active || ! $recipient->is_active || $sender->id === $recipient->id) {
            return false;
        }

        if (! $recipient->employee()->exists()) {
            return false;
        }

        if ($sender->can('view_any_employee_employee')) {
            return true;
        }

        $senderEmployee = $sender->employee;
        $recipientEmployee = $recipient->employee;

        if (! $senderEmployee instanceof Employee || ! $recipientEmployee instanceof Employee) {
            return false;
        }

        return $this->sameCompanyForPeers($senderEmployee, $recipientEmployee);
    }

    /**
     * @return Collection<int, User>
     */
    public function availableRecipients(User $sender): Collection
    {
        $query = User::query()
            ->where('is_active', true)
            ->whereKeyNot($sender->id)
            ->whereHas('employee')
            ->orderBy('name');

        if (! $sender->can('view_any_employee_employee')) {
            $senderEmployee = $sender->employee;

            if (! $senderEmployee instanceof Employee || ! $senderEmployee->company_id) {
                return new Collection;
            }

            $companyId = $senderEmployee->company_id;

            $query->whereHas('employee', function ($q) use ($companyId): void {
                $q->where('company_id', $companyId);
            });
        }

        return $query->get();
    }

    /**
     * @return array<int, int>
     */
    public function peerUserIds(User $user): array
    {
        $id = $user->id;

        $from = EmployeeChatMessage::query()
            ->where('sender_id', $id)
            ->pluck('recipient_id');

        $to = EmployeeChatMessage::query()
            ->where('recipient_id', $id)
            ->pluck('sender_id');

        return $from->merge($to)->unique()->sort()->values()->all();
    }

    /**
     * @return Collection<int, EmployeeChatMessage>
     */
    public function threadBetween(User $viewer, int $otherUserId): Collection
    {
        return EmployeeChatMessage::query()
            ->betweenUsers($viewer->id, $otherUserId)
            ->with(['sender:id,name,email', 'recipient:id,name,email'])
            ->orderBy('created_at')
            ->get();
    }

    public function send(User $sender, int $recipientId, string $body): ?EmployeeChatMessage
    {
        $recipient = User::query()->find($recipientId);

        if (! $recipient instanceof User || ! $this->canSend($sender, $recipient)) {
            return null;
        }

        $trimmed = trim($body);

        if ($trimmed === '') {
            return null;
        }

        $companyId = $sender->default_company_id ?? $sender->employee?->company_id;

        return EmployeeChatMessage::query()->create([
            'sender_id'    => $sender->id,
            'recipient_id' => $recipient->id,
            'company_id'   => $companyId,
            'body'         => $trimmed,
        ]);
    }

    public function markIncomingReadForPeer(User $reader, int $peerId): void
    {
        EmployeeChatMessage::query()
            ->where('recipient_id', $reader->id)
            ->where('sender_id', $peerId)
            ->whereNull('read_at')
            ->update(['read_at' => now()]);
    }

    /**
     * @return array<int, array{last_message: EmployeeChatMessage, unread: int}>
     */
    public function conversationSummaries(User $user): array
    {
        $peerIds = $this->peerUserIds($user);

        if ($peerIds === []) {
            return [];
        }

        $summaries = [];

        foreach ($peerIds as $peerId) {
            $last = EmployeeChatMessage::query()
                ->betweenUsers($user->id, (int) $peerId)
                ->orderByDesc('created_at')
                ->first();

            if (! $last instanceof EmployeeChatMessage) {
                continue;
            }

            $unread = (int) EmployeeChatMessage::query()
                ->where('recipient_id', $user->id)
                ->where('sender_id', $peerId)
                ->whereNull('read_at')
                ->count();

            $peer = User::query()
                ->select(['id', 'name', 'email'])
                ->find($peerId);

            $summaries[(int) $peerId] = [
                'peer'         => $peer,
                'last_message' => $last,
                'unread'       => $unread,
            ];
        }

        uasort($summaries, function (array $a, array $b): int {
            return $b['last_message']->created_at <=> $a['last_message']->created_at;
        });

        return $summaries;
    }

    private function sameCompanyForPeers(Employee $a, Employee $b): bool
    {
        $aMissing = $a->company_id === null;
        $bMissing = $b->company_id === null;

        if ($aMissing !== $bMissing) {
            return false;
        }

        if ($aMissing && $bMissing) {
            return true;
        }

        return (int) $a->company_id === (int) $b->company_id;
    }
}
