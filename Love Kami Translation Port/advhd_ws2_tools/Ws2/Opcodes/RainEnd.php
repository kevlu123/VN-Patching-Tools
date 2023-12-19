<?php
namespace Ws2\Opcodes;

/**
 * 5C [string=channel][NULL]
 */
class RainEnd extends AbstractNullByteText
{
    public const OPCODE = '5C';
    public const FUNC = 'RainEnd';
}