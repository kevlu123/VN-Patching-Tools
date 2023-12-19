<?php
namespace Ws2\Opcodes;

/**
 */
class PlayMusic extends AbstractOpcode
{
    public const OPCODE = '1E';
    public const FUNC = 'PlayMusic';

    protected ?int $validateKey = 1;

    public function decompile(array &$dataSource): self
    {
        [$nameId, $idLen] = $this->reader->readString($dataSource);
        [$filename, $nameLen] = $this->reader->readString($dataSource);
        $size = 13;
        if ($this->version > 1.0) {
            $size += 4;
        }
        $config = $this->reader->readData($dataSource, $size);
        if ($this->isUpdateMode && $this->version == 1.0) {
            $config[] = 0;
            $config[] = 0;
            $config[] = 0;
            $config[] = 0;
        }
        $this->compiledSize = 1 + $idLen + $nameLen + $size;

        $this->content = static::FUNC . " ({$nameId}, {$filename}, ". implode(', ', $config). ")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]);

        unset($params[0], $params[1]);
        $size = count($params);

        $params = array_map('intval', $params);
        $code .= pack('c' . $size, ...$params);
        $this->content = $code;
        return $this;
    }
}