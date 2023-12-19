<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 45 [string=channel][NULL]
 * [byte * 2][float][float][float][float]
 */
class DragBackground extends AbstractOpcode
{
    public const OPCODE = '45';
    public const FUNC = 'DragBackground';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $float1 = $this->reader->readFloat($dataSource);
        $float2 = $this->reader->readFloat($dataSource);
        $float3 = $this->reader->readFloat($dataSource);
        $float4 = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + $channelLen + 2 + 4 * 4;

        $this->content = static::FUNC . " ({$channel}, ".implode(', ', $config).", {$float1}, {$float2}, {$float3}, {$float4})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('c2', (int)$params[1], (int)$params[2]) .
            pack('f4', (float)$params[3], (float)$params[4], (float)$params[5], (float)$params[6]);
        return $this;
    }
}