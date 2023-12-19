<?php
namespace Ws2\Opcodes;

/**
 */
class VariableUnk4 extends AbstractOpcode
{
    public const OPCODE = '53';
    public const FUNC = 'VariableUnk4';

    public function decompile(array &$dataSource): self
    {
        [$variable, $varLen] = $this->reader->readString($dataSource);
        [$variable2, $varLen2] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $varLen + $varLen2;

        $this->content = static::FUNC . " ({$variable}, {$variable2})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) . $this->reader->packString($params[1]);
        return $this;
    }
}