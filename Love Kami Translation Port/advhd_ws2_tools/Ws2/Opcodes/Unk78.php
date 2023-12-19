<?php
namespace Ws2\Opcodes;

/**
 *
 */
class Unk78 extends AbstractOpcode
{
    public const OPCODE = '78';
    public const FUNC = 'Unk78';

    public function decompile(array &$dataSource): self
    {
        [$layer, $layerLen] = $this->reader->readString($dataSource);
        [$filename, $nameLen] = $this->reader->readString($dataSource); // ?
        $config = $this->reader->readData($dataSource, 3);
        $this->compiledSize = 1 + $layerLen + $nameLen + 3;

        $this->content = static::FUNC . " ({$layer}, {$filename}, ".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('c3', (int)$params[2], (int)$params[3], (int)$params[4]);
        $this->content = $code;
        return $this;
    }
}