<?php

use Illuminate\Support\Facades\Route;
use Webkul\Documentation\Livewire\PublicSharedPage;

Route::get('documentation/shared/{token}', PublicSharedPage::class)
    ->name('documentation.shared');
