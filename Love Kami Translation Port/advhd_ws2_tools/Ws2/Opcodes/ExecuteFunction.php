<?php
namespace Ws2\Opcodes;

use Exception;

/**
 */
class ExecuteFunction extends AbstractOpcode
{
    public const OPCODE = '1C';
    public const FUNC = 'ExecuteFunction';

    public function decompile(array &$dataSource): self
    {
        [$function, $len] = $this->reader->readString($dataSource);
        [$string, $strLen] = $this->reader->readString($dataSource);
        $size = 2;
        if ($this->version > 1.0) {
            $size += 1;
        }
        $config = $this->reader->readData($dataSource, $size);
        $this->compiledSize = 1 + $len + $strLen + $size;
        if ($this->isUpdateMode && $this->version == 1.0) {
            $config[] = 0;
        }
        $this->content = static::FUNC . " ({$function}, {$string}, ".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $size = 2;
        if ($this->version > 1.0) {
            $size += 1;
        }

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]);

        unset($params[0], $params[1]);
        $params = array_map('intval', $params);
        $code .= pack('c' . $size, ...$params);
        $this->content = $code;
        return $this;
    }
}