<?php
namespace Ws2\Opcodes;

/**
 */
class RainStart extends AbstractOpcode
{
    public const OPCODE = '56';
    public const FUNC = 'RainStart';

    public function decompile(array &$dataSource): self
    {
        [$string, $strLen] = $this->reader->readString($dataSource);
        $config = $this->reader->readData($dataSource, 7);
        $floats = $this->reader->readFloats($dataSource, 10);
        $ints = $this->reader->readDWords($dataSource, 5);
        [$picture1, $pic1Len] = $this->reader->readString($dataSource);
        $pic1config = $this->reader->readData($dataSource, 2);
        [$picture2, $pic2Len] = $this->reader->readString($dataSource);
        [$picture3, $pic3Len] = $this->reader->readString($dataSource);
        $pic2config = $this->reader->readData($dataSource, 4);
        $this->compiledSize += 1 + $strLen + 7 + 10 * 4 + 5 * 4 + $pic1Len + 2 + $pic2Len + $pic3Len + 4;

        $this->content = static::FUNC . " ({$string}, {$picture1}, {$picture2}, {$picture3}, ".
            "".implode(', ', $config).", ".
            "".implode(', ', $floats).", ".
            "".implode(', ', $ints).", ".
            "".implode(', ', $pic1config).", ".
            "".implode(', ', $pic2config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]);
        $picture1 = $params[1];
        $picture2 = $params[2];
        $picture3 = $params[3];
        unset($params[0], $params[1], $params[2], $params[3]);
        $this->content = $code . $this->reader->packArray($params, 'c', 7, 'intval') .
            $this->reader->packArray($params, 'f', 10, 'floatval') .
            $this->reader->packArray($params, 'V', 5, 'intval') .
            $this->reader->packString($picture1) .
            $this->reader->packArray($params, 'c', 2, 'intval') .
            $this->reader->packString($picture2) .
            $this->reader->packString($picture3) .
            $this->reader->packArray($params, 'c', 4, 'intval');
        return $this;
    }
}