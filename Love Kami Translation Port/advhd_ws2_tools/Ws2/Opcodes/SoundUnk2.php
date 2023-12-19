<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 2A [string=channel][NULL]
 * [float][byte x 2]
 */
class SoundUnk2 extends AbstractOpcode
{
    public const OPCODE = '2A';
    public const FUNC = 'SoundUnk2';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $float1 = $this->reader->readFloat($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $this->compiledSize = 1 + $channelLen + 4 + 2;

        $this->content = static::FUNC . " ({$channel}, {$float1}, {$config[0]}, {$config[1]})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('fc2', (float)$params[1], (int)$params[2], (int)$params[3]);
        return $this;
    }
}