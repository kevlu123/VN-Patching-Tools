<?php
namespace Ws2\Opcodes;

/**
 *
 */
class Unk65 extends AbstractOpcode
{
    public const OPCODE = '65';
    public const FUNC = 'C65';

    public function decompile(array &$dataSource): self
    {
        $config = $this->reader->readData($dataSource, 3);
        $float = $this->reader->readFloat($dataSource);
        $float2 = $this->reader->readFloat($dataSource);
        $configEnd = $this->reader->readData($dataSource, 2);
        $this->compiledSize += 1 + 3 + 2*4 + 2;

        $this->content = static::FUNC . " (".implode(', ', $config).", {$float}, {$float2}, {$configEnd[0]}, {$configEnd[1]})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c3', (int)$params[0], (int)$params[1], (int)$params[2]) .
            pack('f2', (float)$params[3], (float)$params[4]) .
            pack('c2', (int)$params[5], (int)$params[6]);
        $this->compiledSize = 1 + 3 + 8 + 2;
        $this->content = $code;
        return $this;
    }
}