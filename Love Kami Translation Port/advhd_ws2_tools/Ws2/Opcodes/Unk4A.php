<?php
namespace Ws2\Opcodes;

/**
 */
class Unk4A extends AbstractOpcode
{
    public const OPCODE = '4A';
    public const FUNC = 'Unk4A';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$name, $nameLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $channelLen + $nameLen;

        $this->content = static::FUNC . " ({$channel}, {$name})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]);
        return $this;
    }
}