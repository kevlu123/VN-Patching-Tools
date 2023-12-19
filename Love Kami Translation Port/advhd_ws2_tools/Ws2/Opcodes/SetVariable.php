<?php
namespace Ws2\Opcodes;

/**
 * 6E [string=variable][NULL][string=value][NULL]
 */
class SetVariable extends AbstractOpcode
{
    public const OPCODE = '6E';
    public const FUNC = 'SetVariable';

    public function decompile(array &$dataSource): self
    {
        [$variable, $len] = $this->reader->readString($dataSource);
        [$value, $valueLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $len + $valueLen;

        $this->content = static::FUNC . " ({$variable}, {$value})";
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