<?php
namespace Ws2\Opcodes;

/**
 */
class Jump2 extends AbstractOpcodeWithPointer
{
    public const OPCODE = '02';
    public const FUNC = 'Jump2';

    public function decompile(array &$dataSource): self
    {
        $pointer = $this->reader->readDWord($dataSource);
        $this->compiledSize = 1 + 4;

        $this->pointers[] = $pointer;
        $this->content = static::FUNC . " (@pointer_{$pointer})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE);
        $this->pointers[] = $params[0];
        $this->content = $code;
        $this->compiledSize = 5;
        return $this;
    }
}