<?php
namespace Ws2\Opcodes;

/**
 * Dynamic LENGTH
 */
class UnkScreen extends AbstractOpcode
{
    public const OPCODE = 'F0';
    public const FUNC = 'UnkScreen';

    public function decompile(array &$dataSource): self
    {
        $config = $this->reader->readData($dataSource, 1);
        $this->compiledSize = 2;
        if ($config[0] === 3) {
            if ($dataSource[0] === 0 && $dataSource[1] === 0) {
                exit('If you dont see this message - remove this if');
                $config[] = $this->reader->readFloat($dataSource);
                $config[] = $this->reader->readDWord($dataSource);
                $config[] = $this->reader->readDWord($dataSource);
                $this->compiledSize += 12;
            }
        }

        $this->content = static::FUNC . " (".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $params[0] = (int)$params[0];
        $code = $this->reader->convertHexToChar(static::OPCODE) . pack('c', $params[0]);
        if (count($params) > 2) {
            $code .= pack('fVV', (float)$params[1], (int)$params[2], (int)$params[3]);
        }
        $this->content = $code;
        $this->compiledSize = 2;
        return $this;
    }
}