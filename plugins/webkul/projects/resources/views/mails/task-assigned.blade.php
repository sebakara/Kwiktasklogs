<x-support::emails.layout>
    <div class="breadcrumb">
        {{ __('projects::mails/task-assigned.breadcrumb', [
            'task' => $payload['task_title'],
        ]) }}
    </div>

    <div class="notification">
        <p>{{ __('projects::mails/task-assigned.greeting', [
            'name' => $payload['to']['name'],
        ]) }}</p>
        <p>
            {{ __('projects::mails/task-assigned.assignment_message') }}
            <strong>{{ $payload['task_title'] }}</strong>
            @if ($payload['project_name'])
                {{ __('projects::mails/task-assigned.in_project', ['project' => $payload['project_name']]) }}
            @endif
        </p>
        <hr class="separator">
        <p class="internal-note">
            <strong>{{ __('projects::mails/task-assigned.internal_communication') }}</strong>
            {{ __('projects::mails/task-assigned.internal_note') }}
        </p>
        <div class="view-button-container">
            <a href="{{ $payload['record_url'] }}" class="view-button">
                {{ __('projects::mails/task-assigned.view_task') }}
            </a>
        </div>
    </div>

    @isset($payload['from']['company'])
        <div class="company-info">
            <div class="company-name">{{ $payload['from']['company']['name'] }}</div>
            <p class="company-details">
                {{ $payload['from']['company']['phone'] }} | {{ $payload['from']['company']['email'] }} |
                <a href="{{ $payload['from']['company']['website'] }}">
                    {{ str_replace(['https://', 'http://'], '', $payload['from']['company']['website']) }}
                </a>
            </p>
        </div>
    @endisset
</x-support::emails.layout>

<style>
    .breadcrumb {
        font-size: 14px;
        margin-bottom: 20px;
        border-bottom: 1px solid rgb(204, 204, 204);
        padding-bottom: 10px;
    }

    .notification {
        margin: 15px 0;
        color: #555;
        font-size: 13px;
    }

    .internal-note {
        background-color: #4394eb;
        padding: 5px;
        color: #ffffff;
        margin-bottom: 16px;
        font-size: 13px;
    }

    .view-button-container {
        margin-top: 10px;
    }

    .view-button {
        display: inline-block;
        padding: 8px 12px;
        font-size: 12px;
        font-weight: bold;
        color: #ffffff;
        background-color: #007bff;
        border-radius: 3px;
        text-decoration: none;
    }

    .separator {
        background-color: rgb(204, 204, 204);
        border: none;
        display: block;
        font-size: 0px;
        height: 1px;
        margin: 16px 0;
    }

    .company-info {
        font-size: 13px;
        color: #666;
        border-top: 1px solid rgb(204, 204, 204);
        padding-top: 10px;
    }

    .company-details {
        margin: 0;
    }
</style>
