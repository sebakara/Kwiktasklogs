<?php

namespace Webkul\Documentation\Filament\Pages\Concerns;

use Filament\Notifications\Notification;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Validation\ValidationException;
use Throwable;

trait InteractsWithDocumentationHubActions
{
    /**
     * @param  callable(): mixed  $callback
     */
    protected function runHubAction(callable $callback, ?string $successTitle = null): mixed
    {
        try {
            $result = $callback();

            if (is_string($result) && $result !== '') {
                $this->notifyHubSuccess($result);
            } elseif ($successTitle !== null) {
                $this->notifyHubSuccess($successTitle);
            }

            return $result;
        } catch (ValidationException $exception) {
            throw $exception;
        } catch (AuthorizationException) {
            $this->notifyHubError(__('documentation::filament/hub.ui.error_forbidden'));

            return null;
        } catch (ModelNotFoundException) {
            $this->notifyHubError(__('documentation::filament/hub.ui.error_not_found'));

            return null;
        } catch (QueryException $exception) {
            report($exception);

            $this->notifyHubError(__('documentation::filament/hub.ui.error_save_failed'));

            return null;
        } catch (Throwable $exception) {
            report($exception);

            $this->notifyHubError(__('documentation::filament/hub.ui.error_generic'));

            return null;
        }
    }

    protected function notifyHubSuccess(string $title, ?string $body = null): void
    {
        Notification::make()
            ->title($title)
            ->body($body)
            ->success()
            ->send();
    }

    protected function notifyHubError(string $title, ?string $body = null): void
    {
        Notification::make()
            ->title($title)
            ->body($body)
            ->danger()
            ->send();
    }
}
