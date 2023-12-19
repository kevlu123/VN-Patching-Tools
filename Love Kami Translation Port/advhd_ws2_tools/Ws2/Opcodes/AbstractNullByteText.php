<?php
namespace Ws2\Opcodes;

abstract class AbstractNullByteText extends AbstractOpcode
{
    public function decompile(array &$dataSource): self
    {
        [$string, $len] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $len;

        $this->content = static::FUNC . " ({$string})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]);
        $this->compiledSize = strlen($this->content);
        return $this;
    }
}