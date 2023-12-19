<?php
namespace Ws2\Opcodes;

class Unk1B extends AbstractUndefined
{
    public const OPCODE = '1B';
    public const FUNC = 'Unk1B';
    
    public function getSize(): int
    {
        return 1;
    }
}