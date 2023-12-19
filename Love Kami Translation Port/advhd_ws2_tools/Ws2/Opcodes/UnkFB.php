<?php
namespace Ws2\Opcodes;

class UnkFB extends AbstractUndefined
{
    public const OPCODE = 'FB';
    public const FUNC = 'UnkFB';
    
    public function getSize(): int
    {
        return 1;
    }
}