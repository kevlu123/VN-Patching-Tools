<?php
namespace Ws2\Opcodes;

/**
 *
 */
class Unk84 extends AbstractOpcode
{
    public const OPCODE = '84';
    public const FUNC = 'Unk84';

    public function decompile(array &$dataSource): self
    {
        [$s1, $s1Len] = $this->reader->readString($dataSource);
        [$s2, $s2Len] = $this->reader->readString($dataSource);
        [$s3, $s3Len] = $this->reader->readString($dataSource);
        $f1 = $this->reader->readFloat($dataSource);
        $config = $this->reader->readData($dataSource, 2);
        $f2 = $this->reader->readFloat($dataSource);
        $this->compiledSize = 1 + $s1Len + $s2Len + $s3Len + 4 + 2 + 4;

        $this->content = static::FUNC . " ({$s1}, {$s2}, {$s3}, {$f1}, ".implode(', ', $config).", {$f2})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            $this->reader->packString($params[2]) .
            pack('fc2f',
                (float)$params[3],
                (int)$params[4],
                (int)$params[5],
                (float)$params[6],
            );
        $this->content = $code;
        return $this;
    }
}