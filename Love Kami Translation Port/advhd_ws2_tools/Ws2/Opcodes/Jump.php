<?php
namespace Ws2\Opcodes;

class Jump extends AbstractOpcodeWithPointer
{
    public const OPCODE = '06';
    public const FUNC = 'Jump';

    public function decompile(array &$dataSource): self
    {
        $pointerId = $this->reader->readDWord($dataSource);
        $this->compiledSize = 1 + 4;
        $this->pointers[] = $pointerId;
        $this->content = static::FUNC . " (@pointer_{$pointerId})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        [$pointer] = $this->reader->unpackParams($params);
        $code = $this->reader->convertHexToChar(static::OPCODE);
        if ($pointer > 0) {
            $this->pointers[] = $pointer;
        } else {
            $code .= pack('V', $pointer);
        }
        $this->compiledSize = 5;
        $this->content = $code;
        return $this;
    }
}