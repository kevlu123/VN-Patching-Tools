<?php
namespace Ws2\Opcodes;

class Unk19 extends AbstractOpcode
{
    public const OPCODE = '19';
    public const FUNC = 'Unk19';

    public function decompile(&$dataSource): self
    {
        $size = 0;
        if ($this->version > 1.4) {
            $size = 3;
        }
        $content = $this->reader->readData($dataSource, $size);
        $this->compiledSize = 1 + $size;
        if (empty($content)) {
            $content = [0,0,0];// Fill out
        }
        $this->content = static::FUNC . ($size > 0 ? ' ('.implode(', ', $content).')' : '');
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packArray($params, 'c', 3, 'intval');
        $this->compiledSize = 1 + 3;
        return $this;
    }
}