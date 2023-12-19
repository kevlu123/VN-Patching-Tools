<?php
namespace Ws2\Opcodes;

use Exception;

/**
 * 2E
 * Points to the start of the message block
 */
class CharMessageStart extends AbstractOpcode
{
    public const OPCODE = '2E';
    public const FUNC = 'CharMessageStart';

    public function decompile(array &$dataSource): self
    {
        $this->compiledSize = 1;
        $this->content = static::FUNC;
        return $this;
    }

    public function preCompile(?string $params = null): self
    {
        $this->content = $this->reader->convertHexToChar(static::OPCODE);
        $this->compiledSize = 1;
        return $this;
    }
}