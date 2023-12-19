<?php
namespace Ws2\Opcodes;

/**
 * Any opcode that we don't know what it does, but we have a specific length to it.
 */
abstract class AbstractUndefined extends AbstractOpcode
{
    abstract public function getSize(): int;

    public function getCompiledSize(): int
    {
        return $this->getSize() + 1;
    }

    public function decompile(&$dataSource): self
    {
        $size = $this->getSize();
        $content = $this->reader->readData($dataSource, $size);
        $this->compiledSize = 1 + $size;
        $this->content = static::FUNC . ($size > 0 ? ' ('.implode(', ', $content).')' : '');
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $params = array_map('intval', $params);
        $code = $this->reader->convertHexToChar(static::OPCODE);
        if ($this->getSize() > 0) {
            $code .= pack('c' . $this->getSize(), ...$params);
        }
        $this->content = $code;
        return $this;
    }
}