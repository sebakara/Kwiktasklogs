<?php

namespace Webkul\PluginManager\Support;

class ShellCommand
{
    public static function phpExecutable(string $phpPath, string $memoryLimit = '512M'): string
    {
        return escapeshellarg($phpPath).' -d memory_limit='.escapeshellarg($memoryLimit);
    }

    public static function withTimeout(int $seconds, string $command): string
    {
        if (PHP_OS_FAMILY === 'Windows') {
            return $command;
        }

        $timeoutBinary = self::resolveTimeoutBinary();

        if ($timeoutBinary === null) {
            return $command;
        }

        return escapeshellarg($timeoutBinary).' '.(int) $seconds.' '.$command;
    }

    public static function resolveTimeoutBinary(): ?string
    {
        static $resolved = null;

        if ($resolved !== null) {
            return $resolved === '' ? null : $resolved;
        }

        foreach (['timeout', 'gtimeout'] as $binary) {
            $path = trim((string) shell_exec('command -v '.escapeshellarg($binary).' 2>/dev/null'));

            if ($path !== '' && is_executable($path)) {
                $resolved = $path;

                return $path;
            }
        }

        $resolved = '';

        return null;
    }

    /**
     * @return array{exit_code: int, output: string}
     */
    public static function run(string $command, ?int $timeoutSeconds = null): array
    {
        $shellCommand = $timeoutSeconds !== null
            ? self::withTimeout($timeoutSeconds, $command)
            : $command;

        $outputLines = [];
        $exitCode = 0;

        exec($shellCommand, $outputLines, $exitCode);

        return [
            'exit_code' => $exitCode,
            'output'    => implode(PHP_EOL, $outputLines),
        ];
    }
}
