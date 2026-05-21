@props(['label' => null])

<div
    x-data="{
        wrap(before, after) {
            const textarea = this.$refs.editor;
            const start = textarea.selectionStart;
            const end = textarea.selectionEnd;
            const selected = textarea.value.substring(start, end);
            const replacement = before + selected + after;
            textarea.setRangeText(replacement, start, end, 'end');
            textarea.dispatchEvent(new Event('input', { bubbles: true }));
            textarea.focus();
        },
        prefixLine(prefix) {
            const textarea = this.$refs.editor;
            const start = textarea.selectionStart;
            const end = textarea.selectionEnd;
            const value = textarea.value;
            const lineStart = value.lastIndexOf('\n', start - 1) + 1;
            const lineEnd = value.indexOf('\n', end);
            const blockEnd = lineEnd === -1 ? value.length : lineEnd;
            const block = value.substring(lineStart, blockEnd);
            const lines = block.split('\n').map((line) => prefix + line.replace(/^#+\s*/, '').replace(/^[-*]\s*/, ''));
            const replacement = lines.join('\n');
            textarea.setRangeText(replacement, lineStart, blockEnd, 'end');
            textarea.dispatchEvent(new Event('input', { bubbles: true }));
            textarea.focus();
        },
        insertLink() {
            const url = window.prompt(@js(__('documentation::filament/hub.pages.editor.link_prompt')));
            if (! url) return;
            this.wrap('<a href=\"' + url + '\">', '</a>');
        },
    }"
    class="space-y-2"
>
    @if ($label)
        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ $label }}</label>
    @endif

    <div class="flex flex-wrap gap-1 rounded-t-lg border border-b-0 border-gray-300 bg-gray-50 p-2 dark:border-gray-600 dark:bg-gray-800">
        <button type="button" @click="wrap('<strong>', '</strong>')" class="rounded px-2 py-1 text-xs font-semibold text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700" title="Bold">B</button>
        <button type="button" @click="wrap('<em>', '</em>')" class="rounded px-2 py-1 text-xs italic text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700" title="Italic">I</button>
        <button type="button" @click="wrap('<h2>', '</h2>')" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">H2</button>
        <button type="button" @click="wrap('<h3>', '</h3>')" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">H3</button>
        <button type="button" @click="wrap('<ul><li>', '</li></ul>')" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">• List</button>
        <button type="button" @click="wrap('<ol><li>', '</li></ol>')" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">1. List</button>
        <button type="button" @click="wrap('<p>', '</p>')" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">¶</button>
        <button type="button" @click="insertLink()" class="rounded px-2 py-1 text-xs text-gray-700 hover:bg-gray-200 dark:text-gray-200 dark:hover:bg-gray-700">Link</button>
    </div>

    <textarea
        x-ref="editor"
        wire:model="pageContent"
        rows="16"
        class="block w-full rounded-b-lg rounded-t-none border-gray-300 font-mono text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-900 dark:text-white"
    ></textarea>

    <p class="text-xs text-gray-500 dark:text-gray-400">{{ __('documentation::filament/hub.pages.editor.hint') }}</p>
</div>
