<?php
namespace Ws2\Opcodes;

class Unk3E extends AbstractUndefined
{
    public const OPCODE = '3E';
    public const FUNC = 'Unk3E';
    
    public function getSize(): int
    {
        return 0;
    }
}