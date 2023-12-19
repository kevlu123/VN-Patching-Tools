<?php
namespace Ws2\Opcodes;

/**
 */
class UsePnaPackage extends AbstractOpcode
{
    public const OPCODE = '34';
    public const FUNC = 'UsePnaPackage';

    protected ?int $validateKey = 1;

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$effectName, $nameLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $this->compiledSize = 1 + $channelLen + $nameLen + 2;

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
            pack('c2', (int)$params[2], (int)$params[3]);
        return $this;
    }
}