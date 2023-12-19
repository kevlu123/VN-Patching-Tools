<?php
namespace Ws2\Opcodes;

/**
 *
 */
class Unk7A extends AbstractOpcode
{
    public const OPCODE = '7A';
    public const FUNC = 'Unk7A';

    public function decompile(array &$dataSource): self
    {
        [$layer, $layerLen] = $this->reader->readString($dataSource);
        [$filename, $nameLen] = $this->reader->readString($dataSource); // ?
        $float = $this->reader->readFloat($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        [$s, $sLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $layerLen + $nameLen + 4 + 2 + $sLen;

        $this->content = static::FUNC . " ({$layer}, {$filename}, {$float}, ".implode(', ', $config).", ".$s.")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('fc2', (float)$params[2], (int)$params[3], (int)$params[4]) .
            $this->reader->packString($params[5]);
        $this->content = $code;
        return $this;
    }
}