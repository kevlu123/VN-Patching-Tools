<?php
namespace Ws2\Opcodes;

/**
 * 40 [string=channel][NULL][string=name][NULL]
 */
class SetMask extends AbstractOpcode
{
    public const OPCODE = '40';
    public const FUNC = 'SetMask';

    protected ?int $validateKey = 1;

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$name, $nameLen] = $this->reader->readString($dataSource);
        $options = $this->reader->readData($dataSource, 1);
        $this->compiledSize = 1 + $channelLen + $nameLen + 1;

        $this->content = static::FUNC . " ({$channel}, {$name}, {$options[0]})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('c', $params[2]);
        return $this;
    }
}