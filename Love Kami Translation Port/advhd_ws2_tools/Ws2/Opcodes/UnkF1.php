<?php
namespace Ws2\Opcodes;

/**
 */
class UnkF1 extends AbstractOpcode
{
    public const OPCODE = 'F1';
    public const FUNC = 'UnkF1';

    public function decompile(array &$dataSource): self
    {
        exit('Is it even used?');
        $config = $this->reader->readData($dataSource, 1);
        $float = $this->reader->readFloat($dataSource);
        $F0id1 = $this->reader->readDWord($dataSource);
        $F0id2 = $this->reader->readDWord($dataSource);
        $this->compiledSize = 1 + 1 + 4*3;

        return static::FUNC . " ({$config[0]}, {$float}, {$F0id1}, {$F0id2})";
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('cfVV', (int)$params[0], (float)$params[1], (int)$params[2], (int)$params[3]);
        return $code;
    }
}