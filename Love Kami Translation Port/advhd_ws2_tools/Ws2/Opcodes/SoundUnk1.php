<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 29 [string=channel][NULL]
 * [float][byte x 4][float]
 */
class SoundUnk1 extends AbstractOpcode
{
    public const OPCODE = '29';
    public const FUNC = 'SoundUnk1';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $float1 = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + $channelLen + 4;

        $this->content = static::FUNC . " ({$channel}, {$float1})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('f', (float)$params[1]);
        return $this;
    }
}