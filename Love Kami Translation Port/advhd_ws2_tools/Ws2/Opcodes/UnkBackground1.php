<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 57 [string=channel][NULL]
 * [byte][byte]
 */
class UnkBackground1 extends AbstractOpcode
{
    public const OPCODE = '57';
    public const FUNC = 'UnkBackground1';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $configBytes = $this->reader->readData($dataSource, 2);
        $this->compiledSize += 1 + $channelLen + 2;

        $this->content = static::FUNC . " ({$channel}, ".implode(', ', $configBytes).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('c2', (int)$params[1], (int)$params[2]);
        return $this;
    }
}