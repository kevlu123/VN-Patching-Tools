<?php
namespace Ws2\Opcodes;

/**
 */
class PlayMovie extends AbstractOpcode
{
    public const OPCODE = '35';
    public const FUNC = 'PlayMovie';

    public function decompile(array &$dataSource): self
    {
        [$name, $len] = $this->reader->readString($dataSource);
        [$file, $filenameLen] = $this->reader->readString($dataSource);
        $configBytes = $this->reader->readData($dataSource, 3);
        $this->compiledSize += 1 + $len + $filenameLen + 3;

        $this->content = static::FUNC . " ({$name}, {$file}, ".implode(', ', $configBytes).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $this->content = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]) .
            pack('c3', (int)$params[2], (int)$params[3], (int)$params[4]);
        return $this;
    }
}