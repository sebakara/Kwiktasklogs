<?php

namespace Webkul\Documentation\Services;

use DOMDocument;
use DOMXPath;
use Illuminate\Support\Str;

class DocumentationTableOfContentsService
{
    /**
     * @return array{content: string, items: array<int, array{id: string, level: int, text: string}>}
     */
    public function process(?string $html): array
    {
        if ($html === null || trim($html) === '') {
            return ['content' => '', 'items' => []];
        }

        $document = new DOMDocument;
        libxml_use_internal_errors(true);
        $document->loadHTML(
            '<?xml encoding="utf-8" ?><div id="documentation-root">'.$html.'</div>',
            LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD
        );
        libxml_clear_errors();

        $xpath = new DOMXPath($document);
        $items = [];
        $usedIds = [];

        foreach ($xpath->query('//h1|//h2|//h3|//h4') as $heading) {
            $level = (int) substr($heading->nodeName, 1);
            $text = trim($heading->textContent ?? '');

            if ($text === '') {
                continue;
            }

            $id = $this->uniqueHeadingId($text, $usedIds);
            $usedIds[] = $id;
            $heading->setAttribute('id', $id);

            $items[] = [
                'id'    => $id,
                'level' => $level,
                'text'  => $text,
            ];
        }

        $root = $document->getElementById('documentation-root');
        $content = '';

        if ($root !== null) {
            foreach ($root->childNodes as $child) {
                $content .= $document->saveHTML($child);
            }
        }

        return ['content' => $content, 'items' => $items];
    }

    /**
     * @param  array<int, string>  $usedIds
     */
    protected function uniqueHeadingId(string $text, array $usedIds): string
    {
        $base = Str::slug($text) ?: 'section';
        $id = $base;
        $counter = 2;

        while (in_array($id, $usedIds, true)) {
            $id = $base.'-'.$counter;
            $counter++;
        }

        return $id;
    }
}
