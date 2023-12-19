<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 15 [string=channel][NULL]
 * [byte]
 */
class SetDisplayName extends AbstractOpcode
{
    public const OPCODE = '15';
    public const FUNC = 'SetDisplayName';

    public function decompile(array &$dataSource): self
    {
        [$charName, $nameLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $nameLen;
        if ($this->version > 1.0) {
            $config = $this->reader->readData($dataSource, 1);
            $this->compiledSize += 1;
            if ($config[0] > 0) {
                throw new Exception('SetDisplayName config updated');
            }
        } else {
            $config = [0];
        }

        $this->textExtractor?->setCharName($charName);
        $this->content = static::FUNC . " ({$config[0]}, '{$charName}')";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = substr($params, 1, -1);
        $params = explode(', ', $params, 2);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString(trim($params[1], "'"));

        if ($this->version > 1.0) {
            $code .= pack('c', (int)$params[0]);
        }
        $this->content = $code;
        return $this;
    }
}