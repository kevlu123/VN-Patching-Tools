<?php
namespace Ws2\Opcodes;

/**
 * 3D
 * [byte * 6][float][byte * 6]
 */
class Unk3D extends AbstractOpcode
{
    public const OPCODE = '3D';
    public const FUNC = 'Unk3D';

    public function decompile(array &$dataSource): self
    {
        $config = $this->reader->readData($dataSource, 6);
        $float1 = $this->reader->readFloat($dataSource);
        $config2 = $this->reader->readData($dataSource, 6);
        $this->compiledSize += 1 + 6 + 4 + 6;

        $this->content = static::FUNC . " (".
            "".implode(', ', $config).", ".
            "{$float1}, ".
            "".implode(', ', $config2).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c6', (int)$params[0], (int)$params[1], (int)$params[2], (int)$params[3], (int)$params[4], (int)$params[5]) .
            pack('f', (float)$params[6]) .
            pack('c6', (int)$params[7], (int)$params[8], (int)$params[9], (int)$params[10], (int)$params[11], (int)$params[12]);
        return $this;
    }
}