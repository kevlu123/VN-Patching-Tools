<?php
namespace Ws2\Opcodes;

/**
 */
class VariableUnk51 extends AbstractOpcode
{
    public const OPCODE = '51';
    public const FUNC = 'VariableUnk51';

    public function decompile(array &$dataSource): self
    {
        [$variable, $varLen] = $this->reader->readString($dataSource);
        [$variable2, $var2Len] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 7);
        $this->compiledSize = 1 + $varLen + $var2Len + 7;

        $this->content = static::FUNC . " ({$variable}, {$variable2}, ".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $var1 = array_shift($params);
        $var2 = array_shift($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($var1) . $this->reader->packString($var2) .
            $this->reader->packArray($params, 'c', 7, 'intval');
        return $this;
    }
}