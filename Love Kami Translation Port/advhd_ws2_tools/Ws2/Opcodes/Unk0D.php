<?php
namespace Ws2\Opcodes;

class Unk0D extends AbstractUndefined
{
    public const OPCODE = '0D';
    public const FUNC = 'Unk0D';
    
    public function getSize(): int
    {
        return 8;
    }
}