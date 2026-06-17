<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Voucher — {{ $payment->name ?? 'Draft' }}</title>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            font-size: 11.5px;
            color: #000;
            background: #d0d0d0;
        }

        /* ── No-print toolbar ───────────────────── */
        .toolbar {
            display: flex;
            gap: 10px;
            padding: 8px 14px;
            background: #f0f0f0;
            border-bottom: 1px solid #ccc;
        }
        .btn {
            padding: 6px 18px;
            border: 1px solid #aaa;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            background: #fff;
        }
        .btn-primary { background: #1a56db; color: #fff; border-color: #1a56db; }

        /* ── Page wrapper ───────────────────────── */
        .page-wrap {
            display: flex;
            justify-content: center;
            padding: 28px 20px 40px;
        }

        /* ── Voucher card ───────────────────────── */
        .voucher {
            width: 210mm;
            min-height: 260mm;
            background: #fff;
            position: relative;
            overflow: hidden;
            padding: 14mm 14mm 12mm;
            box-shadow: 0 2px 14px rgba(0,0,0,0.22);
        }

        /* ── Sunburst via CSS conic gradient from top-right ── */
        .voucher::before {
            content: '';
            position: absolute;
            inset: 0;
            background: repeating-conic-gradient(
                from 180deg at 100% 0%,
                rgba(160,160,160,0.13) 0deg 2.5deg,
                transparent              2.5deg 6deg
            );
            pointer-events: none;
            z-index: 0;
        }

        /* All real content above background */
        .content { position: relative; z-index: 1; }

        /* ── Header ─────────────────────────────── */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 8px;
        }

        .company-info {
            font-size: 10px;
            line-height: 1.8;
            color: #000;
        }

        .logo-block {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-width: 90px;
        }
        .logo-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 36px;
            border: 2px solid #1a56db;
            border-radius: 3px;
            font-size: 13px;
            font-weight: bold;
            color: #1a56db;
            font-family: 'Courier New', monospace;
            margin-bottom: 2px;
        }
        .logo-name {
            font-size: 14px;
            font-weight: 900;
            letter-spacing: 0.5px;
            color: #000;
            line-height: 1.1;
            text-align: center;
        }
        .logo-sub {
            font-size: 9px;
            color: #555;
            margin-top: 1px;
            text-align: center;
        }
        .logo-img {
            max-height: 58px;
            max-width: 130px;
            object-fit: contain;
        }

        /* ── Title ──────────────────────────────── */
        .voucher-title {
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            margin: 10px 0 14px;
        }

        /* ── Field rows (2-column) ───────────────── */
        .row {
            display: flex;
            align-items: flex-start;
            margin-bottom: 10px;
            gap: 20px;
        }
        .field {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .field-label {
            font-size: 10.5px;
            font-weight: 700;
        }
        .field-label, .val, .val-tall { display: block; }

        /* Gray value box */
        .val {
            background: #d9d9d9;
            min-height: 18px;
            padding: 2px 6px;
            font-size: 11px;
            line-height: 1.5;
            width: 100%;
        }

        /* Full-width row */
        .row-full {
            display: flex;
            flex-direction: column;
            gap: 2px;
            margin-bottom: 10px;
        }
        .row-full .field-label {
            font-size: 10.5px;
            font-weight: 700;
        }
        .row-full .val {
            background: #d9d9d9;
            min-height: 18px;
            padding: 2px 6px;
            font-size: 11px;
            width: 100%;
        }

        /* Purposes taller */
        .val-tall {
            background: #d9d9d9;
            min-height: 38px;
            padding: 4px 6px;
            font-size: 11px;
            width: 100%;
        }

        /* ── Signature section ───────────────────── */
        .sig-section {
            display: flex;
            gap: 10px;
            margin-top: 18px;
        }
        .sig-block { flex: 1; }
        .sig-title {
            font-weight: bold;
            font-size: 10.5px;
            text-decoration: underline;
            text-align: center;
            margin-bottom: 10px;
        }
        .sig-line {
            display: flex;
            align-items: flex-end;
            gap: 4px;
            margin-bottom: 18px;
        }
        .sig-line-label {
            font-size: 10px;
            font-weight: 600;
            min-width: 50px;
        }
        .sig-line-value {
            flex: 1;
            border-bottom: 1px solid #000;
            min-height: 22px;
            font-size: 10.5px;
            padding-bottom: 1px;
        }

        /* ── Print ──────────────────────────────── */
        @media print {
            body { background: #fff; }
            .toolbar { display: none !important; }
            .page-wrap { padding: 0; background: #fff; }
            .voucher {
                width: 100%;
                box-shadow: none;
                padding: 8mm 12mm 8mm;
                min-height: unset;
            }
            @page { size: A4 portrait; margin: 5mm; }
        }
    </style>
</head>
<body>

<div class="toolbar">
    <button class="btn btn-primary" onclick="window.print()">&#128438;&nbsp; Print</button>
    <button class="btn" onclick="window.close()">Close</button>
</div>

<div class="page-wrap">
<div class="voucher">

    <div class="content">

        @php
            /* Use company DB values where populated, fall back to GKK defaults */
            $gkk_tin     = $company?->tax_id     ?: '133560121';
            $gkk_addr    = trim(implode('/ ', array_filter([$company?->city, $company?->street1, $company?->street2]))) ?: 'KIGALICITY/ GASABO/ REMERA';
            $gkk_phone   = $company?->phone      ?: '+250786055919';
            $gkk_email   = $company?->email      ?: 'global.kwikkoders@gmail.com';
            $gkk_name    = ($company?->name && !in_array($company->name, ['YourERP', config('app.name')])) ? $company->name : 'GLOBAL';
            $gkk_has_logo = $company?->logo && file_exists(storage_path('app/public/' . $company->logo));
        @endphp

        {{-- ── Header ── --}}
        <div class="header">
            <div class="company-info">
                <div>TIN: {{ $gkk_tin }}</div>
                <div>{{ strtoupper($gkk_addr) }}</div>
                <div>TEL: {{ $gkk_phone }}</div>
                <div>Email:{{ $gkk_email }}</div>
            </div>

            <div class="logo-block">
                @if($gkk_has_logo)
                    <img class="logo-img" src="{{ asset('storage/' . $company->logo) }}" alt="{{ $gkk_name }}">
                @else
                    <div class="logo-icon">&lt;/&gt;</div>
                    <div class="logo-name">{{ $gkk_name }}</div>
                    <div class="logo-sub">Kwik Koders&nbsp;—</div>
                @endif
            </div>
        </div>

        {{-- ── Title ── --}}
        <div class="voucher-title">Payment Voucher</div>

        {{-- Row 1 --}}
        <div class="row">
            <div class="field">
                <span class="field-label">Date</span>
                <span class="val">{{ $payment->date ? $payment->date->format('d/m/Y') : '' }}</span>
            </div>
            <div class="field">
                <span class="field-label">Voucher No.</span>
                <span class="val">{{ $payment->name ?? '' }}</span>
            </div>
        </div>

        {{-- Row 2 --}}
        <div class="row">
            <div class="field">
                <span class="field-label">Method of Payment</span>
                <span class="val">{{ $payment->paymentMethodLine?->name ?? '' }}</span>
            </div>
            <div class="field">
                <span class="field-label">Vendor</span>
                <span class="val">{{ $payment->partner?->name ?? '' }}</span>
            </div>
        </div>

        {{-- Row 3 --}}
        <div class="row">
            <div class="field">
                <span class="field-label">Bank Payment</span>
                <span class="val">{{ $payment->journal?->name ?? '' }}</span>
            </div>
            <div class="field">
                <span class="field-label">Chart of Account</span>
                <span class="val">{{ $payment->chartOfAccount?->name ?? '' }}</span>
            </div>
        </div>

        {{-- Row 4 --}}
        <div class="row">
            <div class="field">
                <span class="field-label">Amount</span>
                <span class="val">{{ $payment->amount ? number_format($payment->amount, 2) : '' }}</span>
            </div>
            <div class="field">
                <span class="field-label">Project</span>
                <span class="val">{{ $payment->project?->name ?? '' }}</span>
            </div>
        </div>

        {{-- Amount In Word --}}
        <div class="row-full">
            <span class="field-label">Amount In Word</span>
            <span class="val">{{ $amountInWord }}</span>
        </div>

        {{-- Purposes --}}
        <div class="row-full">
            <span class="field-label">Purposes</span>
            <span class="val-tall">{{ $payment->purposes ?? '' }}</span>
        </div>

        {{-- ── Signature section ── --}}
        <div class="sig-section">
            @foreach([
                ['title' => 'Prepared By',  'user' => $payment->preparedBy],
                ['title' => 'Verified By',  'user' => $payment->verifiedBy],
                ['title' => 'Aproved By',   'user' => $payment->approvedBy],
            ] as $sig)
            <div class="sig-block">
                <div class="sig-title">{{ $sig['title'] }}</div>
                <div class="sig-line">
                    <span class="sig-line-label">Name</span>
                    <span class="sig-line-value">{{ $sig['user']?->name ?? '' }}</span>
                </div>
                <div class="sig-line">
                    <span class="sig-line-label">Date</span>
                    <span class="sig-line-value"></span>
                </div>
                <div class="sig-line">
                    <span class="sig-line-label">Signature</span>
                    <span class="sig-line-value"></span>
                </div>
            </div>
            @endforeach
        </div>

    </div>{{-- /content --}}
</div>{{-- /voucher --}}
</div>{{-- /page-wrap --}}

<script>
    if (new URLSearchParams(window.location.search).get('autoprint') === '1') {
        window.addEventListener('load', function () {
            setTimeout(function () { window.print(); }, 350);
        });
    }
</script>
</body>
</html>
