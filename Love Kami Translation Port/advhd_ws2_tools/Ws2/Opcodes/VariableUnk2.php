<?php
namespace Ws2\Opcodes;

/**
 */
class VariableUnk2 extends AbstractOpcode
{
    public const OPCODE = '52';
    public const FUNC = 'VariableUnk2';

    public function decompile(array &$dataSource): self
    {
        [$channel, $channelLen] = $this->reader->readString($dataSource);
        [$variableName, $nameLen] = $this->reader->readString($dataSource);
        $float = $this->reader->readFloat($dataSource);
        $config = $this->reader->readData($dataSource, 7);
        [$action, $actionLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + $channelLen + $nameLen + 4 + 7 + $actionLen;

        $this->content = static::FUNC . " ({$channel}, {$variableName}, {$action}, {$float}, ".
            "".implode(', ', $config).")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);

        $code = $this->reader->convertHexToChar(static::OPCODE) .
            $this->reader->packString($params[0]) .
            $this->reader->packString($params[1]);
        unset($params[0], $params[1]);
        $action = array_shift($params);
        $float = (float)array_shift($params);
        $params = array_map('intval', $params);
        $code .= pack('fc7', $float, ...$params) . $this->reader->packString($action);
        $this->content = $code;
        return $this;
    }
}