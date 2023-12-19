<?php
namespace Ws2\Opcodes;

class SetFlag extends AbstractOpcode
{
    public const OPCODE = '0B';
    public const FUNC = 'SetFlag';

    public function decompile(array &$dataSource): self
    {
        $globalId = $this->reader->readWord($dataSource);
        [$value] = $this->reader->readData($dataSource, 1);
        $this->compiledSize = 1 + 2 + 1;

        $this->content = static::FUNC . " ({$globalId}, {$value})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        [$globalId, $value] = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('vc', (int)$globalId, (int)$value);
        $this->content = $code;
        $this->compiledSize = 4;
        return $this;
    }
}