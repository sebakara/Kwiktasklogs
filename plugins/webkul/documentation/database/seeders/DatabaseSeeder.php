<?php

namespace Webkul\Documentation\Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            DocumentationArticleSeeder::class,
        ]);
    }
}
