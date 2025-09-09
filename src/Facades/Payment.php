<?php

namespace Payment\Payment\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Payment\Payment\Payment
 */
class Payment extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return \Payment\Payment\Payment::class;
    }
}
