<x-support::emails.layout>
    <div class="breadcrumb">
        Time Off Request
    </div>

    <div class="notification">
        <p>Hello {{ $payload['to']['name'] }},</p>
        <p>
            <strong>{{ $payload['employee_name'] }}</strong> has submitted a time off request that requires your attention.
        </p>

        <hr class="separator">

        <table class="details-table">
            <tr>
                <td class="label">Leave Type</td>
                <td>{{ $payload['leave_type'] }}</td>
            </tr>
            <tr>
                <td class="label">From</td>
                <td>{{ $payload['date_from'] }}</td>
            </tr>
            <tr>
                <td class="label">To</td>
                <td>{{ $payload['date_to'] }}</td>
            </tr>
            <tr>
                <td class="label">Duration</td>
                <td>{{ $payload['duration'] }}</td>
            </tr>
            @if (!empty($payload['description']))
            <tr>
                <td class="label">Description</td>
                <td>{{ $payload['description'] }}</td>
            </tr>
            @endif
        </table>

        <div class="view-button-container">
            <a href="{{ $payload['record_url'] }}" class="view-button">Review Request</a>
        </div>
    </div>

    @isset($payload['from']['company'])
        <div class="company-info">
            <div class="company-name">{{ $payload['from']['company']['name'] }}</div>
            <p class="company-details">
                {{ $payload['from']['company']['phone'] }} | {{ $payload['from']['company']['email'] }}
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
    .details-table {
        width: 100%;
        border-collapse: collapse;
        margin: 12px 0 20px;
        font-size: 13px;
    }
    .details-table tr td {
        padding: 6px 8px;
        border-bottom: 1px solid #eee;
    }
    .details-table .label {
        font-weight: bold;
        color: #333;
        width: 30%;
    }
    .separator {
        background-color: rgb(204, 204, 204);
        border: none;
        height: 1px;
        margin: 16px 0;
    }
    .view-button-container {
        margin-top: 16px;
    }
    .view-button {
        display: inline-block;
        padding: 8px 14px;
        font-size: 12px;
        font-weight: bold;
        color: #ffffff;
        background-color: #007bff;
        border-radius: 3px;
        text-decoration: none;
    }
    .company-info {
        font-size: 13px;
        color: #666;
        border-top: 1px solid rgb(204, 204, 204);
        padding-top: 10px;
    }
    .company-details { margin: 0; }
</style>
