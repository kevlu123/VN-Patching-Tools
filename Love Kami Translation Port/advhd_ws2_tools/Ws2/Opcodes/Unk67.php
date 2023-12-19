<?php
namespace Ws2\Opcodes;

/**
 * 67
 * [byte * 4][float][float][float][float]
 */
class Unk67 extends AbstractOpcode
{
    public const OPCODE = '67';
    public const FUNC = 'Unk67';

    public function decompile(array &$dataSource): self
    {
        $config = $this->reader->readData($dataSource, 4);
        $float1 = $this->reader->readFloat($dataSource);
        $float2 = $this->reader->readFloat($dataSource);
        $float3 = $this->reader->readFloat($dataSource);
        $float4 = $this->reader->readFloat($dataSource);
        $float5 = $this->reader->readFloat($dataSource);
        $config2 = $this->reader->readData($dataSource, 1);
        $this->compiledSize += 1 + 4 + 4 * 5 + 1;

        $this->content = static::FUNC . " (".
            "".implode(', ', $config).", ".
            "{$float1}, {$float2}, {$float3}, {$float4}, {$float5}, ".
            "".implode(', ', $config2).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c4', (int)$params[0], (int)$params[1], (int)$params[2], (int)$params[3]) .
            pack('f5', (float)$params[4], (float)$params[5], (float)$params[6], (float)$params[7], (float)$params[8]) .
            pack('c', (int)$params[9]);
        $this->compiledSize = 1  + 4 + 4 * 5 + 1;
        return $this;
    }
}