<?php
namespace Ws2\Opcodes;

class Unk32 extends AbstractUndefined
{
    public const OPCODE = '32';
    public const FUNC = 'Unk32';

    public function getSize(): int
    {
        return 5;
    }
}