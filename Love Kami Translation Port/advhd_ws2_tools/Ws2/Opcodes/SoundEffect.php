<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 28 [string=channel][NULL][string=name][NULL]
 * [float][float][bytes x 14 config]
 */
class SoundEffect extends AbstractOpcode
{
    public const OPCODE = '28';
    public const FUNC = 'SoundEffect';

    protected ?int $validateKey = 1;

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$name, $nameLen] = $this->reader->readString($dataSource);
        $float1 = $this->reader->readFloat($dataSource);
        $float2 = $this->reader->readFloat($dataSource);
        $size = 10;
        if ($this->version > 1.0) {
            $size += 4;
        }
        $configBytes = $this->reader->readData($dataSource, $size);
        if ($this->isUpdateMode && $this->version == 1.0) {
            $configBytes[] = 0;
            $configBytes[] = 0;
            $configBytes[] = 0;
            $configBytes[] = 0;
        }
        $this->compiledSize = 1 + $channelLen + $nameLen + 2 * 4 + $size;

        $this->content = static::FUNC . " ({$channel}, {$name}, {$float1}, {$float2}, ".implode(', ', $configBytes).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('ff', (float)$params[2], (float)$params[3]);
        $params = array_splice($params, 4);
        $size = count($params);
        $params = array_map('intval', $params);
        $code .= pack('c'. $size, ...$params);
        $this->content = $code;
        return $this;
    }
}