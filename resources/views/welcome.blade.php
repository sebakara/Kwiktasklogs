<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="{{ $direction ?? (app()->getLocale() === 'ar' ? 'rtl' : 'ltr') }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{{ __('welcome.meta_description') }}">
    <title>{{ __('welcome.title') }}</title>

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600,700,800&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    @if (file_exists(public_path('build/manifest.json')) || file_exists(public_path('hot')))
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    @endif
</head>
<body class="bg-slate-950 text-slate-100 antialiased {{ app()->getLocale() === 'ar' ? 'font-cairo' : 'font-sans' }}">
<div class="relative min-h-screen overflow-hidden">
    <div class="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_top,_rgba(59,130,246,0.28),_transparent_55%),radial-gradient(circle_at_bottom,_rgba(139,92,246,0.22),_transparent_45%)]"></div>

    <div class="relative mx-auto max-w-7xl px-6 pb-14 pt-6 lg:px-10">
        <div class="mb-8 flex items-center justify-between">
            <div class="inline-flex items-center gap-3 rounded-2xl border border-white/10 bg-white/5 px-4 py-2 backdrop-blur">
                <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-gradient-to-br from-blue-500 to-violet-500 text-base font-bold text-white">
                    GK
                </div>
                <div>
                    <p class="text-sm font-semibold tracking-wide text-white">Global Kwikkoders</p>
                    <p class="text-xs text-slate-300">{{ __('welcome.hero.subtitle') }}</p>
                </div>
            </div>

            <div class="flex items-center gap-2 rounded-xl border border-white/10 bg-slate-900/70 p-1">
                <a href="{{ url('?lang=en') }}" class="rounded-lg px-3 py-1.5 text-sm transition {{ app()->getLocale() === 'en' ? 'bg-blue-600 text-white' : 'text-slate-300 hover:text-white' }}">English</a>
                <a href="{{ url('?lang=ar') }}" class="rounded-lg px-3 py-1.5 text-sm transition {{ app()->getLocale() === 'ar' ? 'bg-blue-600 text-white' : 'text-slate-300 hover:text-white' }}">العربية</a>
            </div>
        </div>

        <header class="grid gap-8 pb-14 pt-6 lg:grid-cols-2 lg:items-center">
            <div>
                <p class="mb-5 inline-flex items-center gap-2 rounded-full border border-blue-400/30 bg-blue-500/10 px-4 py-1.5 text-xs font-semibold uppercase tracking-[0.2em] text-blue-200">
                    {{ __('welcome.hero.kicker') }}
                </p>

                <h1 class="text-4xl font-extrabold leading-tight text-white sm:text-5xl lg:text-6xl">
                    {{ __('welcome.hero.title') }}
                </h1>

                <p class="mt-6 max-w-xl text-lg leading-relaxed text-slate-300">
                    {{ __('welcome.hero.description') }}
                </p>

                <div class="mt-8 flex flex-wrap items-center gap-3">
                    <a href="{{ url('/admin') }}" class="inline-flex items-center rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white shadow-lg shadow-blue-500/30 transition hover:bg-blue-500">
                        {{ __('welcome.hero.cta_primary') }}
                    </a>
                    <a href="#solutions" class="inline-flex items-center rounded-xl border border-white/20 bg-white/5 px-6 py-3 text-sm font-semibold text-white transition hover:bg-white/10">
                        {{ __('welcome.hero.cta_secondary') }}
                    </a>
                </div>
            </div>

            <div class="rounded-3xl border border-white/10 bg-gradient-to-br from-white/10 to-transparent p-6 backdrop-blur">
                <div class="grid gap-4 sm:grid-cols-2">
                    <div class="rounded-2xl border border-white/10 bg-slate-900/70 p-4">
                        <p class="text-xs uppercase tracking-wider text-slate-400">{{ __('welcome.stats.modules') }}</p>
                        <p class="mt-2 text-2xl font-bold text-white">12+</p>
                    </div>
                    <div class="rounded-2xl border border-white/10 bg-slate-900/70 p-4">
                        <p class="text-xs uppercase tracking-wider text-slate-400">{{ __('welcome.stats.users') }}</p>
                        <p class="mt-2 text-2xl font-bold text-white">1,000+</p>
                    </div>
                    <div class="rounded-2xl border border-white/10 bg-slate-900/70 p-4">
                        <p class="text-xs uppercase tracking-wider text-slate-400">{{ __('welcome.stats.transactions') }}</p>
                        <p class="mt-2 text-2xl font-bold text-white">50k+</p>
                    </div>
                    <div class="rounded-2xl border border-white/10 bg-slate-900/70 p-4">
                        <p class="text-xs uppercase tracking-wider text-slate-400">{{ __('welcome.stats.uptime') }}</p>
                        <p class="mt-2 text-2xl font-bold text-white">99.9%</p>
                    </div>
                </div>
            </div>
        </header>

        <section id="solutions" class="py-10">
            <h2 class="text-center text-3xl font-bold text-white sm:text-4xl">{{ __('welcome.features.title') }}</h2>
            <p class="mx-auto mt-4 max-w-3xl text-center text-slate-300">{{ __('welcome.features.subtitle') }}</p>

            <div class="mt-10 grid gap-5 md:grid-cols-2 lg:grid-cols-3">
                @foreach (['sales', 'purchases', 'inventory', 'accounting', 'hr', 'projects'] as $feature)
                    <article class="rounded-2xl border border-white/10 bg-white/[0.04] p-6 transition hover:-translate-y-0.5 hover:bg-white/[0.07]">
                        <h3 class="text-lg font-semibold text-white">{{ __("welcome.features.$feature.title") }}</h3>
                        <p class="mt-3 text-sm leading-relaxed text-slate-300">{{ __("welcome.features.$feature.description") }}</p>
                    </article>
                @endforeach
            </div>
        </section>

        <section class="py-10">
            <div class="rounded-3xl border border-blue-300/20 bg-gradient-to-r from-blue-600/30 via-indigo-600/25 to-violet-600/30 p-8 text-center backdrop-blur sm:p-12">
                <h2 class="text-3xl font-bold text-white">{{ __('welcome.cta.title') }}</h2>
                <p class="mx-auto mt-4 max-w-2xl text-slate-100/90">{{ __('welcome.cta.description') }}</p>
                <a href="{{ url('/admin') }}" class="mt-8 inline-flex items-center rounded-xl bg-white px-8 py-3 text-sm font-semibold text-blue-700 transition hover:bg-blue-50">
                    {{ __('welcome.cta.button') }}
                </a>
            </div>
        </section>

        <footer class="mt-8 border-t border-white/10 pt-6">
            <div class="flex flex-col items-center justify-between gap-3 text-sm text-slate-400 md:flex-row">
                <p>© {{ date('Y') }} Global Kwikkoders. {{ __('welcome.footer.copyright') }}</p>
                <p>{{ __('welcome.footer.powered_by') }} v{{ Illuminate\Foundation\Application::VERSION }}</p>
            </div>
        </footer>
    </div>
</div>
</body>
</html>
