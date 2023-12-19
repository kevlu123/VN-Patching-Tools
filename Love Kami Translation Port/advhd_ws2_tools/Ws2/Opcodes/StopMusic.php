<?php
namespace Ws2\Opcodes;

/**
 */
class StopMusic extends AbstractOpcode
{
    public const OPCODE = '1F';
    public const FUNC = 'StopMusic';

    public function decompile(array &$dataSource): self
    {
        [$nameId, $idLen] = $this->reader->readString($dataSource);
        $seconds = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + $idLen + 4;

        $this->content = static::FUNC . " ({$nameId}, {$seconds})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('f', (float)$params[1]);
        return $this;
    }
}