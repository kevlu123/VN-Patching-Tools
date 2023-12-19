<?php
namespace Ws2\Opcodes;

use Ws2\FilesValidator;

/**
 *
 */
class DisplayMessage extends AbstractOpcode
{
    public const OPCODE = '14';
    public const FUNC = 'DisplayMessage';

    public function decompile(array &$dataSource): self
    {
        $messageId = $this->reader->readDWord($dataSource);
        [$layer, $length] = $this->reader->readString($dataSource);
        [$message, $messageLen] = $this->reader->readString($dataSource);
        $this->compiledSize = 1 + 4 + $length + $messageLen;
        if ($this->version > 1.0) {
            [$type] = $this->reader->readData($dataSource, 1);
            $this->compiledSize += 1;
        } else {
            $type = 0;
        }
        if ($type > 0) {
            throw new \Exception('SetMessageId id type changes: '. $messageId . ' / ' . $type);
        }

        $this->textExtractor?->setMessage($message);
        // @todo validate size for compilation!
        $return = static::FUNC . " ($messageId, $layer, $type\n{$message}\n);";
        if ($this->isUpdateMode && $this->version == 1.0) {
            array_unshift($dataSource, 0x15, 0);
            $this->compiledSize -= 2;
        }
        $this->content = $return;
        return $this;
    }

    public function preCompile(?string $params = null, ?array &$scriptLines = [], int &$messageIdOverride = 0): self
    {
        $message = '';
        $textLine = array_shift($scriptLines);
        while($textLine !== ');') {
            $message .= $textLine;
            $textLine = array_shift($scriptLines);
        }
        [$messageId, $layer, $type] = $this->reader->unpackParams($params . ')');
        if ($this->isUpdateMode) {
            $messageId = $messageIdOverride;
            //$message = $messageId . ' - ' . $message;
            $messageIdOverride++;
        }
        $code = $this->reader->convertHexToChar(static::OPCODE) .
            pack('V', (int)$messageId) .
            $this->reader->packString($layer) .
            $this->reader->packString($message) .
            pack ('c', (int)$type);
        $this->content = $code;
        return $this;
    }

    public function validate(?string $params, array &$dataSource, FilesValidator $filesValidator): ?string
    {
        // Skip some lines
        $textLine = array_shift($dataSource);
        while($textLine !== ');') {
            $textLine = array_shift($dataSource);
        }
        return null;
    }
}