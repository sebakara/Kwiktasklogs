<?php

namespace App\Http\Controllers\Documentation;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UploadController extends Controller
{
    public function upload(Request $request): JsonResponse
    {
        try {
            $request->validate([
                'file' => 'required|file|max:10240',
            ]);

            $file = $request->file('file');
            $isImage = str_starts_with((string) $file->getMimeType(), 'image/');

            $folder = $isImage ? 'documentation/images' : 'documentation/files';
            $path = $file->store($folder, 'public');

            return response()->json([
                'url'      => asset('storage/' . $path),
                'name'     => $file->getClientOriginalName(),
                'is_image' => $isImage,
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json(['error' => $e->getMessage(), 'errors' => $e->errors()], 422);
        } catch (\Throwable $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
