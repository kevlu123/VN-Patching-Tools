<?php
namespace Ws2;

class ZeroOpcode extends Opcodes\AbstractUndefined
{
    public const OPCODE = '00';
    public const FUNC = 'ZeroOffset';
    
    public function getSize(): int
    {
        return 0;
    }
}