<?php
namespace Ws2\Opcodes;

use Ws2\FilesValidator;

class ShowGraphic extends AbstractNullByteText
{
    public const OPCODE = '66';
    public const FUNC = 'ShowGraphic';

    protected ?int $validateKey = 0;
}