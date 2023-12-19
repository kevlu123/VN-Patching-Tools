<?php
namespace Ws2\Opcodes;

/**
 */
class Unk16 extends AbstractOpcode
{
    public const OPCODE = '16';
    public const FUNC = 'Unk16';

    public function decompile(array &$dataSource): self
    {
        $size = 1;
        if ($this->version > 1.0) {
            $size ++;
        }
        $options = $this->reader->readData($dataSource, $size);
        if ($this->isUpdateMode && $this->version == 1.0) {
            $options[] = 0;
        }
        $this->compiledSize = 1 + $size;

        $this->content = static::FUNC . " (".implode(', ', $options).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $size = count($params);
        $params = array_map('intval', $params);
        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c' . $size, ...$params);
        $this->compiledSize = 1 + $size;
        return $this;
    }
}