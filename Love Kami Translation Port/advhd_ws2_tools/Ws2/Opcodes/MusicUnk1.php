<?php
namespace Ws2\Opcodes;

/**
 */
class MusicUnk1 extends AbstractOpcode
{
    public const OPCODE = '20';
    public const FUNC = 'MusicUnk1'; // Fade out?

    public function decompile(array &$dataSource): self
    {
        [$nameId, $idLen] = $this->reader->readString($dataSource);
        $seconds = $this->reader->readFloat($dataSource);
        $unk = $this->reader->readWord($dataSource);
        $this->compiledSize = 1 + $idLen + 4 + 2;

        $this->content = static::FUNC . " ({$nameId}, {$seconds}, {$unk})";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            pack('fv', (float)$params[1], (int)$params[2]);
        return $this;
    }
}