<?php
namespace Ws2\Opcodes;

/**
 * 09 00 0A 00 00 00 80 3F
 * [id] [?] [layer?] [?] [4b float]
 */
class LayerConfig extends AbstractOpcode
{
    public const OPCODE = '09';
    public const FUNC = 'LayerConfig';

    public function decompile(array &$dataSource): self
    {
        $config = $this->reader->readData($dataSource, 3);
        $float = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + 3 + 4;

        $this->content = static::FUNC . " (".implode(', ', $config).", {$float})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
             pack('c3f' , (int)$params[0], (int)$params[1], (int)$params[2], (float)$params[3]);
        $this->compiledSize = 1 + 3 + 4;
        return $this;
    }
}