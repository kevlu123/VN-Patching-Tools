<?php
namespace Ws2\Opcodes;

/**
 *
 */
class Unk7B extends AbstractOpcode
{
    public const OPCODE = '7B';
    public const FUNC = 'Unk7B';

    public function decompile(array &$dataSource): self
    {
        [$layer, $layerLen] = $this->reader->readString($dataSource);
        [$filename, $nameLen] = $this->reader->readString($dataSource); // ?
        //$int = $this->reader->readDWord($dataSource);
        //$float = $this->reader->readFloat($dataSource);
        //$config = $this->reader->readData($dataSource, 6);
        $this->compiledSize = 1 + $layerLen + $nameLen/* + 4 + 4 + 6*/;

        $this->content = static::FUNC . " ({$layer}, {$filename})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]);
        $this->content = $code;
        return $this;
    }
}