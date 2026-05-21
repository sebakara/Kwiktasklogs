<?php

use Livewire\Livewire;
use Webkul\Documentation\Filament\Pages\EditPage;
use Webkul\Documentation\Filament\Pages\ViewPage;
use Webkul\Documentation\Models\DocumentationPage;
use Webkul\Documentation\Models\DocumentationSpace;
use Webkul\Security\Models\Role;
use Webkul\Security\Models\User;

it('saves a new page as draft and redirects to the reader', function (): void {
    $user = User::factory()->create();
    $user->assignRole(Role::findOrCreate(config('filament-shield.panel_user.name', 'Admin'), 'web'));

    $space = DocumentationSpace::factory()->create();

    Livewire::actingAs($user)
        ->test(EditPage::class, [
            'documentationSpace' => $space->id,
            'pageRecord'         => 'create',
        ])
        ->set('pageTitle', 'Draft test page')
        ->set('pageContent', 'Body content')
        ->call('saveDraft')
        ->assertHasNoErrors()
        ->assertRedirect(ViewPage::getUrl([
            'documentationSpace' => $space->id,
            'pageRecord'         => DocumentationPage::query()
                ->where('space_id', $space->id)
                ->where('title', 'Draft test page')
                ->value('id'),
        ]));

    $page = DocumentationPage::query()
        ->where('space_id', $space->id)
        ->where('title', 'Draft test page')
        ->first();

    expect($page)->not->toBeNull()
        ->and($page->is_published)->toBeFalse()
        ->and($page->content)->toBe('Body content');
});

it('updates an existing page as draft', function (): void {
    $user = User::factory()->create();
    $user->assignRole(Role::findOrCreate(config('filament-shield.panel_user.name', 'Admin'), 'web'));

    $space = DocumentationSpace::factory()->create();
    $page = DocumentationPage::factory()->create([
        'space_id' => $space->id,
        'title'    => 'Original title',
        'content'  => 'Original content',
    ]);

    Livewire::actingAs($user)
        ->test(EditPage::class, [
            'documentationSpace' => $space->id,
            'pageRecord'         => $page->id,
        ])
        ->set('pageTitle', 'Updated draft title')
        ->set('pageContent', 'Updated content')
        ->call('saveDraft')
        ->assertHasNoErrors();

    $page->refresh();

    expect($page->title)->toBe('Updated draft title')
        ->and($page->content)->toBe('Updated content')
        ->and($page->is_published)->toBeFalse();
});
