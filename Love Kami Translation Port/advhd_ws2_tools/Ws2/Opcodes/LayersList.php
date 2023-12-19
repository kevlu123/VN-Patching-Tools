<?php
namespace Ws2\Opcodes;

/**
 */
class LayersList extends AbstractOpcode
{
    public const OPCODE = '3F';
    public const FUNC = 'LayersList';

    public function decompile(array &$dataSource): self
    {
        [$amount] = $this->reader->readData($dataSource, 1);
        $layers = [];
        $this->compiledSize = 1 + 1;
        for ($i = 0; $i < $amount; $i++) {
            [$string, $size] = $this->reader->readString($dataSource);
            $this->compiledSize += $size;
            $layers[] = $string;
        }

        $this->content = static::FUNC . " ({$amount}, ".implode(', ', $layers).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $amount = array_shift($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c', (int)$amount);
        foreach ($params as $string) {
            $code .= $this->reader->packString($string);
        }
        $this->content = $code;
        return $this;
    }
}