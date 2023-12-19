<?php
namespace Ws2\Opcodes;


class Unk08 extends AbstractUndefined
{
    public const OPCODE = '08';
    public const FUNC = 'Unk08';

    public function getSize(): int
    {
        return 1;
    }
}