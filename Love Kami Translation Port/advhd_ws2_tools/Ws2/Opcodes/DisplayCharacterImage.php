<?php
namespace Ws2\Opcodes;

/**
 * Dynamic length
 */
class DisplayCharacterImage extends AbstractOpcode
{
    public const OPCODE = '39';
    public const FUNC = 'DisplayCharacterImage';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 3);
        $imageIds = [];
        $this->compiledSize += 1 + $channelLen + 3;
        for ($i=0;$i<$config[2];$i++) {
            $imageIds[] = $this->reader->readWord($dataSource);
            $this->compiledSize += 2;
        }

        $this->content = static::FUNC . " ({$channel}, ".
            "".implode(', ', $config).", ".implode(', ', $imageIds).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('c3', (int)$params[1], (int)$params[2], (int)$params[3]);

        $size = $params[3];
        $params = array_splice($params, 4);
        $params = array_map('intval', $params);
        $code .= pack('v'.$size, ...$params);
        $this->content = $code;
        return $this;
    }
}