<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 58 [string=channel][NULL][string=effect_name][NULL]
 * [byte * 8]
 */
class Effect3 extends AbstractOpcode
{
    public const OPCODE = '58';
    public const FUNC = 'Effect3';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$effectName, $nameLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 8);
        $this->compiledSize = 1 + $channelLen + $nameLen + 8;

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
            pack('c8', (int)$params[2], (int)$params[3], (int)$params[4], (int)$params[5], (int)$params[6],
                (int)$params[7], (int)$params[8], (int)$params[9]);
        return $this;
    }
}