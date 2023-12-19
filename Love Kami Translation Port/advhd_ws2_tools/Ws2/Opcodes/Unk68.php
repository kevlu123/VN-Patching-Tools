<?php
namespace Ws2\Opcodes;


class Unk68 extends AbstractUndefined
{
    public const OPCODE = '68';
    public const FUNC = 'Unk68';
    
    public function getSize(): int
    {
        return 1;
    }
}