<?php
namespace Ws2\Opcodes;

class Unk05 extends AbstractUndefined
{
    public const OPCODE = '05';
    public const FUNC = 'Unk05';
    
    public function getSize(): int
    {
        return 9;
    }
}