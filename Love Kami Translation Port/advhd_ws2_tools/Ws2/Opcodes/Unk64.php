<?php
namespace Ws2\Opcodes;


class Unk64 extends AbstractUndefined
{
    public const OPCODE = '64';
    public const FUNC = 'Unk64';
    
    public function getSize(): int
    {
        return 1;
    }
}