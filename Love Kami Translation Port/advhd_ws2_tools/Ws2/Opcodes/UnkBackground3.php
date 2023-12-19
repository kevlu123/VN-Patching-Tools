<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 41 [string=channel][NULL]
 * [byte][int32][float][byte x 7]
 */
class UnkBackground3 extends AbstractOpcode
{
    public const OPCODE = '41';
    public const FUNC = 'UnkBackground3';

    public function decompile(array &$dataSource): self
    {
        // @todo test KAN_2002.ws2
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $configBytes = $this->reader->readData($dataSource, 1);
        /*$id = $this->reader->readDWord($dataSource);
        $float = $this->reader->readFloat($dataSource);
        $config2Bytes = $this->reader->readData($dataSource, 7);*/
        $this->compiledSize += 1 + $channelLen + 1/* + 4 + 4 + 7*/;

        //$this->content = static::FUNC . " ({$channel}, {$configBytes[0]}, {$id}, {$float}, ".implode(', ', $config2Bytes).")";
        $this->content = static::FUNC . " ({$channel}, {$configBytes[0]})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $channel = array_shift($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($channel) .
            $this->reader->packArray($params, 'c', 1, 'intval');
            //$this->reader->packArray($params, 'V', 1, 'intval') .
            //$this->reader->packArray($params, 'f', 1, 'floatval') .
            //$this->reader->packArray($params, 'c', 7, 'intval');
        return $this;
    }
}