<?php
namespace Ws2\Opcodes;

/**
 * Dynamic LENGTH
 */
class Condition extends AbstractOpcodeWithPointer
{
    public const OPCODE = '01';
    public const FUNC = 'Condition';

    public function decompile(array &$dataSource): self
    {
        [$configValue] = $this->reader->readData($dataSource, 1);
        $this->compiledSize = 2;
        $this->content = static::FUNC . " ({$configValue}";
        // The "$configValue === 3" part is validation for mainmenu vs HOT_001 - one has IF, another doesn't.
        if (in_array($configValue, [2,128,129,130], true) || ($configValue === 3 && in_array($dataSource[0],[50,51,127,128], true))) {
            $globalId = $this->reader->readWord($dataSource);
            $float = $this->reader->readFloat($dataSource); // Block id for CG_PAGES
            $pointer1 = $this->reader->readDWord($dataSource);
            $pointer2 = $this->reader->readDWord($dataSource);
            $this->content .= ", {$globalId}, {$float}";
            if ($pointer1 !== 0) {
                $this->pointers[] = $pointer1;
                $this->content .= ', @pointer_'.$pointer1;
            } else {
                $this->content .= ', 0';
            }
            if ($pointer2 !== 0) {
                $this->pointers[] = $pointer2;
                $this->content .= ', @pointer_'.$pointer2;
            } else {
                $this->content .= ', 0';
            }
            $this->compiledSize += 2 + 3*4;
        }
        $this->content.= ")";
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $params = $this->reader->unpackParams($params);
        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('c', $params[0]);
        $this->compiledSize = 2;
        if (in_array($params[0], [2,128,129,130]) || ($params[0] === "3" && count($params)>3)) {
            $code .= pack('vf', (int)$params[1], (float)$params[2]);
            if ($params[3] > 0) {
                $this->pointers[] = $params[3];
            } else {
                $code .= pack('V', $params[3]);
            }
            if ($params[4] > 0) {
                $this->pointers[] = $params[4];
            } else {
                $code .= pack('V', $params[4]);
            }
            $this->compiledSize += 2 + 4 * 3;
        }
        $this->content = $code;

        return $this;
    }
}