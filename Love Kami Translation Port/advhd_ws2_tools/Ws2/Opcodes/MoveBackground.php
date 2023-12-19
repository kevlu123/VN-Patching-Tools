<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 46 [string=channel][NULL]
 * [byte * 3][float][float][float][float]
 */
class MoveBackground extends AbstractOpcode
{
    public const OPCODE = '46';
    public const FUNC = 'MoveBackground';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 3);
        $float1 = $this->reader->readFloat($dataSource);
        $float2 = $this->reader->readFloat($dataSource);
        $float3 = $this->reader->readFloat($dataSource);
        $float4 = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + $channelLen + 3 + 4 * 4;
        if ($this->isUpdateMode && $this->version == 1.0) {
            if ($config[2] === 128) {
                $config[2] = 240;
            }
        }

        $this->content = static::FUNC . " ({$channel}, ".implode(', ', $config).", {$float1}, {$float2}, {$float3}, {$float4})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('c3', (int)$params[1], (int)$params[2], (int)$params[3]) .
            pack('f4', (float)$params[4], (float)$params[5], (float)$params[6], (float)$params[7]);
        return $this;
    }
}