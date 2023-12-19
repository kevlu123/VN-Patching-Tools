<?php
namespace Ws2\Opcodes;

class UnkFC extends AbstractUndefined
{
    public const OPCODE = 'FC';
    public const FUNC = 'UnkFC';
    
    public function getSize(): int
    {
        return 2;
    }
}