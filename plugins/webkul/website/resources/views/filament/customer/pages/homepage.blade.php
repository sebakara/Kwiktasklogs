<x-filament-panels::page class="fi-home-page" dir="{{ app()->getLocale() === 'ar' ? 'rtl' : 'ltr' }}">
    <style>
        .gk-home-wrap {
            margin-top: -1.25rem;
            margin-left: -1.5rem;
            margin-right: -1.5rem;
            background: linear-gradient(180deg, #f8fbff 0%, #f6f7fb 60%, #f8fafc 100%);
            padding: 2rem 1.5rem 3rem;
        }

        @media (min-width: 1024px) {
            .gk-home-wrap {
                margin-left: -2rem;
                margin-right: -2rem;
                padding: 2.5rem 2rem 4rem;
            }
        }

        .gk-home-container {
            max-width: 1160px;
            margin: 0 auto;
        }

        .gk-hero {
            display: grid;
            gap: 1.5rem;
            grid-template-columns: 1.2fr 0.8fr;
            background: #ffffff;
            border: 1px solid #e4eaf4;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
            padding: 2rem;
        }

        @media (max-width: 980px) {
            .gk-hero {
                grid-template-columns: 1fr;
                padding: 1.25rem;
            }
        }

        .gk-kicker {
            display: inline-flex;
            align-items: center;
            border: 1px solid #cfe0ff;
            background: #eef4ff;
            color: #1d4ed8;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.12em;
            border-radius: 999px;
            padding: 0.35rem 0.85rem;
            margin-bottom: 0.9rem;
        }

        .gk-title {
            margin: 0;
            color: #0f172a;
            font-size: 2.4rem;
            line-height: 1.1;
            font-weight: 800;
        }

        .gk-desc {
            margin-top: 1rem;
            color: #475569;
            line-height: 1.75;
            font-size: 1rem;
            max-width: 58ch;
        }

        .gk-actions {
            margin-top: 1.25rem;
            display: flex;
            flex-wrap: wrap;
            gap: 0.7rem;
        }

        .gk-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            padding: 0.7rem 1.2rem;
            text-decoration: none;
            font-weight: 700;
            font-size: 0.92rem;
            transition: all 0.2s ease;
        }

        .gk-btn-primary {
            background: #2563eb;
            color: #fff;
            box-shadow: 0 8px 18px rgba(37, 99, 235, 0.25);
        }

        .gk-btn-primary:hover {
            background: #1d4ed8;
        }

        .gk-btn-secondary {
            background: #fff;
            color: #334155;
            border: 1px solid #dbe4f0;
        }

        .gk-btn-secondary:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
        }

        .gk-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.8rem;
        }

        .gk-stat {
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            background: #f8fafc;
            padding: 0.9rem;
        }

        .gk-stat-label {
            font-size: 0.72rem;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.08em;
        }

        .gk-stat-value {
            margin-top: 0.35rem;
            font-size: 1.4rem;
            font-weight: 800;
            color: #0f172a;
        }

        .gk-section {
            margin-top: 2.25rem;
        }

        .gk-section-title {
            margin: 0;
            text-align: center;
            color: #0f172a;
            font-size: 1.9rem;
            font-weight: 800;
        }

        .gk-section-subtitle {
            margin: 0.65rem auto 0;
            text-align: center;
            color: #64748b;
            max-width: 70ch;
            line-height: 1.65;
        }

        .gk-grid {
            margin-top: 1.3rem;
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 0.9rem;
        }

        @media (max-width: 980px) {
            .gk-grid {
                grid-template-columns: 1fr;
            }
        }

        .gk-card {
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 1rem 1rem 0.95rem;
            box-shadow: 0 6px 20px rgba(2, 6, 23, 0.04);
        }

        .gk-card-title {
            margin: 0;
            color: #0f172a;
            font-weight: 700;
            font-size: 1.02rem;
        }

        .gk-card-desc {
            margin-top: 0.55rem;
            color: #475569;
            font-size: 0.92rem;
            line-height: 1.65;
        }

        .gk-cta {
            margin-top: 2.25rem;
            border-radius: 18px;
            border: 1px solid #d7e5ff;
            background: linear-gradient(90deg, #eff6ff, #eef2ff, #f5f3ff);
            padding: 2rem 1.25rem;
            text-align: center;
        }

        .gk-cta-title {
            margin: 0;
            color: #0f172a;
            font-size: 1.9rem;
            font-weight: 800;
        }

        .gk-cta-desc {
            margin: 0.7rem auto 0;
            color: #475569;
            max-width: 68ch;
            line-height: 1.75;
        }

        .gk-home-cms-content {
            margin-top: 1.1rem;
            border-radius: 14px;
            border: 1px solid #e2e8f0;
            background: #fff;
            padding: 1rem;
            box-shadow: 0 6px 20px rgba(2, 6, 23, 0.04);
        }

        .gk-home-cms-content,
        .gk-home-cms-content * {
            color: #0f172a !important;
        }

        .gk-home-cms-content a {
            color: #2563eb !important;
            text-decoration: underline;
        }
    </style>

    <div class="gk-home-wrap">
        <div class="gk-home-container">
            <section class="gk-hero">
                <div>
                    <p class="gk-kicker">
                        Global Kwikkoders
                    </p>

                    <h1 class="gk-title">
                        Smart ERP and Digital Operations for Growing Businesses
                    </h1>

                    <p class="gk-desc">
                        Global Kwikkoders helps organizations unify sales, purchasing, inventory, finance, HR, and project execution in one modern platform designed for speed and control.
                    </p>

                    <div class="gk-actions">
                        <a href="{{ url('/admin/login') }}" class="gk-btn gk-btn-primary">
                            Login to Portal
                        </a>
                        <a href="#gk-solutions" class="gk-btn gk-btn-secondary">
                            Explore Solutions
                        </a>
                    </div>
                </div>

                <div class="gk-stats">
                    <div class="gk-stat">
                        <p class="gk-stat-label">Business Modules</p>
                        <p class="gk-stat-value">12+</p>
                    </div>
                    <div class="gk-stat">
                        <p class="gk-stat-label">Operational Dashboards</p>
                        <p class="gk-stat-value">20+</p>
                    </div>
                    <div class="gk-stat">
                        <p class="gk-stat-label">Daily Transactions</p>
                        <p class="gk-stat-value">50k+</p>
                    </div>
                    <div class="gk-stat">
                        <p class="gk-stat-label">Platform Uptime</p>
                        <p class="gk-stat-value">99.9%</p>
                    </div>
                </div>
            </section>

            <section id="gk-solutions" class="gk-section">
                <h2 class="gk-section-title">
                    Built for Real Business Operations
                </h2>
                <p class="gk-section-subtitle">
                    A connected system for teams that need visibility, speed, and accountability.
                </p>

                <div class="gk-grid">
                    @foreach ([
                        ['Sales & CRM', 'Convert leads faster with better pipeline visibility and customer intelligence.'],
                        ['Purchasing & Vendors', 'Control procurement workflows, approvals, and supplier relationships.'],
                        ['Inventory & Warehousing', 'Track stock movement and optimize warehouse performance in real time.'],
                        ['Finance & Accounting', 'Automate invoicing, payments, and reporting with clean financial controls.'],
                        ['HR & Workforce', 'Manage employee data, attendance, leaves, and onboarding in one place.'],
                        ['Projects & Delivery', 'Plan milestones, align teams, and deliver projects with measurable progress.'],
                    ] as [$title, $description])
                        <article class="gk-card">
                            <h3 class="gk-card-title">{{ $title }}</h3>
                            <p class="gk-card-desc">{{ $description }}</p>
                        </article>
                    @endforeach
                </div>
            </section>

            <section class="gk-cta">
                <div>
                    <h2 class="gk-cta-title">Run Global Kwikkoders at Full Speed</h2>
                    <p class="gk-cta-desc">
                        Centralize your operations and empower every department with one source of truth.
                    </p>
                    <a href="{{ url('/admin/login') }}" class="gk-btn gk-btn-primary" style="margin-top: 1.25rem;">
                        Access Platform
                    </a>
                </div>
            </section>

            @if (filled($this->getContent()))
                <section>
                    <div class="gk-home-cms-content">
                        {!! str($this->getContent())->sanitizeHtml() !!}
                    </div>
                </section>
            @endif
        </div>
    </div>
</x-filament-panels::page>
