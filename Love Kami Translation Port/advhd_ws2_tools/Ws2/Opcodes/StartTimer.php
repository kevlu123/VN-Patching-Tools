<?php
namespace Ws2\Opcodes;

/**
 */
class StartTimer extends AbstractOpcode
{
    public const OPCODE = '12';
    public const FUNC = 'StartTimer';

    public function decompile(array &$dataSource): self
    {
        [$name, $len] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $this->compiledSize = 1 + $len + 2;

        $this->content = static::FUNC . " ({$name}, {$config[0]}, {$config[1]})";
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