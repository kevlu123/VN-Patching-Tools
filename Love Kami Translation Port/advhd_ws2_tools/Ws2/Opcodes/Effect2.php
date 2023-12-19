<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 48 [string=channel][NULL][string=effect_name][NULL]
 * [byte * 5]
 */
class Effect2 extends AbstractOpcode
{
    // ?Stop effect?
    public const OPCODE = '48';
    public const FUNC = 'Effect2';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$effectName, $nameLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 5);
        $this->compiledSize = 1 + $channelLen + $nameLen + 5;

        $this->content = static::FUNC . " ({$channel}, {$effectName}, ".
            "".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('c5', (int)$params[2], (int)$params[3], (int)$params[4], (int)$params[5], (int)$params[6]);
        return $this;
    }
}