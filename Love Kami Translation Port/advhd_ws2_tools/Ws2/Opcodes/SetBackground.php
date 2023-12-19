<?php
namespace Ws2\Opcodes;

use Ws2\FilesValidator;

/**
 * 33 [string=channel][NULL][string=name][NULL]
 */
class SetBackground extends AbstractOpcode
{
    public const OPCODE = '33';
    public const FUNC = 'SetBackground';

    protected ?int $validateKey = 1;

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