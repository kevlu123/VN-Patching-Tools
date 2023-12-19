<?php
namespace Ws2\Opcodes;

/**
 */
class Unk0E extends AbstractUndefined
{
    public const OPCODE = '0E';
    public const FUNC = 'Unk0E';

    public function getSize(): int
    {
        return 5;
    }
}
