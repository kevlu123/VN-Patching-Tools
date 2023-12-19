<?php
namespace Ws2\Opcodes;

/**
 */
class UnkFD extends AbstractOpcode
{
    public const OPCODE = 'FD';
    public const FUNC = 'UnkFD';

    public function decompile(array &$dataSource): self
    {
        // Repeats 01 (something) and goes after 01 (01) which mostly doesn't have addition
        $config = $this->reader->readData($dataSource, 2);
        $config[] = $this->reader->readFloat($dataSource);
        $config[] = $this->reader->readDWord($dataSource);
        $config[] = $this->reader->readDWord($dataSource);
        $this->compiledSize = 1 + 2 + 3*4;
        $this->content = static::FUNC . " (".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c2fVV', (int)$params[0], (int)$params[1], (float)$params[2], (int)$params[3], (int)$params[4]);
        $this->compiledSize = 1 + 2 + 3*4;
        return $this;
    }
}