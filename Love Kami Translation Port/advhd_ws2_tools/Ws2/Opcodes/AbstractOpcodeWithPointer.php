<?php
namespace Ws2\Opcodes;

use Exception;

abstract class AbstractOpcodeWithPointer extends AbstractOpcode
{
    protected ?string $contentEnd = null;

    /**
     * @throws Exception
     */
    public function compile(array $pointers): string
    {
        if (empty($this->pointers)) {
            return $this->content;
        }
        $code = '';
        foreach ($this->pointers as $label) {
            $pointer = null;
            if ($label === 0) {
                $pointer = 0;
            }
            if (array_key_exists($label, $pointers)) {
                $pointer = $pointers[$label];
            }
            if ($pointer === null) {
                throw new \Exception('Unable to find pointer for ' . static::OPCODE . ' and label ' . $label);
            }
            $code .= pack('V', $pointer);
        }
        return $this->content . $code . ($this->contentEnd ?: '');
    }
}