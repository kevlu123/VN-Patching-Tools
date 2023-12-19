<?php
namespace Ws2\Opcodes;

/**
 */
class FileEnd extends AbstractOpcode
{
    public const OPCODE = 'FF';
    public const FUNC = 'FileEnd';

    public function decompile(array &$dataSource): self
    {
        $someId = $this->reader->readDWord($dataSource);
        $configBytes = $this->reader->readData($dataSource, 4);
        array_unshift($configBytes, $someId);
        $this->compiledSize = 1 + 4 + 4;

        $this->content = static::FUNC . " (".implode(', ', $configBytes).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $params = array_map('intval', $params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            pack('Vc4', ...$params);
        $this->compiledSize = 1 + 4 + 4;
        return $this;
    }
}