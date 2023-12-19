<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 47 [string=channel][NULL][string=effect_name][NULL]
 * [byte * 4][float * 6][byte * 2]
 */
class Effect1 extends AbstractOpcode
{
    // ?Start effect?
    public const OPCODE = '47';
    public const FUNC = 'Effect1';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$effectName, $nameLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 4);
        $floats = $this->reader->readFloats($dataSource, 6);
        $config2 = $this->reader->readData($dataSource, 2);
        $this->compiledSize = 1 + $channelLen + $nameLen + 4 + 6 * 4 + 2;
        if ($this->isUpdateMode && $this->version == 1.0) {
            if ($config[3] === 128) {
                $config[3] = 192;
            }
        }

        $this->content = static::FUNC . " ({$channel}, {$effectName}, ".
            "".implode(', ', $config).", ".
            "".implode(', ', $floats).", ".
            "".implode(', ', $config2).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('c4', (int)$params[2], (int)$params[3], (int)$params[4], (int)$params[5]) .
            pack('f4', (float)$params[6], (float)$params[7], (float)$params[8], (float)$params[9]) .
            pack('f2', (float)$params[10], (float)$params[11]) .
            pack('c2', (int)$params[12], (int)$params[13]);
        $this->content = $code;
        return $this;
    }
}