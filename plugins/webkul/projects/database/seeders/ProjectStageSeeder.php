<?php

namespace Webkul\Project\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Webkul\Security\Models\User;

class ProjectStageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::first();
        $now = now();
        $requiredStages = [
            'Brain shorming',
            'Architecture design',
            'development',
            'Testing',
            'Deployment',
            'Maintenance',
        ];

        $existingStageIds = DB::table('projects_project_stages')
            ->orderBy('sort')
            ->orderBy('id')
            ->pluck('id')
            ->values();

        $keptStageIds = [];

        foreach ($requiredStages as $index => $stageName) {
            $stagePayload = [
                'name'       => $stageName,
                'is_active'  => 1,
                'sort'       => $index + 1,
                'creator_id' => $user?->id,
                'updated_at' => $now,
            ];

            $existingStageId = $existingStageIds->get($index);

            if ($existingStageId) {
                DB::table('projects_project_stages')
                    ->where('id', $existingStageId)
                    ->update($stagePayload);

                $keptStageIds[] = $existingStageId;

                continue;
            }

            $keptStageIds[] = DB::table('projects_project_stages')->insertGetId([
                ...$stagePayload,
                'created_at' => $now,
            ]);
        }

        if ($keptStageIds === []) {
            return;
        }

        DB::table('projects_projects')
            ->whereNotIn('stage_id', $keptStageIds)
            ->update([
                'stage_id'    => $keptStageIds[0],
                'updated_at'  => $now,
            ]);

        DB::table('projects_project_stages')
            ->whereNotIn('id', $keptStageIds)
            ->delete();
    }
}
