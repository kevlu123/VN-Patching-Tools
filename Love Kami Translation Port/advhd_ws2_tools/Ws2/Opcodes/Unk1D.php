<?php
namespace Ws2\Opcodes;

class Unk1D extends AbstractUndefined
{
    public const OPCODE = '1D';
    public const FUNC = 'Unk1D';
    
    public function getSize(): int
    {
        return 2;
    }
}