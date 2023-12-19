<?php
namespace Ws2\Opcodes;

class Unk13 extends AbstractUndefined
{
    public const OPCODE = '13';
    public const FUNC = 'Unk13';
    
    public function getSize(): int
    {
        return 9;
    }
}