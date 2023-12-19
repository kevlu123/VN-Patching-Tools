<?php
namespace Ws2\Opcodes;

/**
 * 42 [name=string][NULL]
 * [byte * 2]
 */
class Unk42 extends AbstractOpcode
{
    public const OPCODE = '42';
    public const FUNC = 'Unk42';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $this->compiledSize = 1 + $channelLen + 2;

        $this->content = static::FUNC . " ({$channel}, {$config[0]}, {$config[1]})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('cc', (int)$params[1], (int)$params[2]);
        return $this;
    }
}