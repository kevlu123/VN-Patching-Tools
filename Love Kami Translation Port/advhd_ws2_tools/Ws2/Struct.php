<?php
namespace Ws2;

use Exception;
use Helper\TextExtractor;
use Ws2\Opcodes\AbstractOpcode;

class Struct
{
    protected int $totalSize = 0;

    protected array $labels = [];

    public function __construct(
        protected Reader $reader,
        protected OpcodesList $opcodesList,
        protected array $data,
        private TextExtractor $textExtractor,
        protected int $offset = 0,
    ) {
    }

    public function generateScript(float $version, $isUpdateMode = false, int $offset = 0): array
    {
        $this->curPos = 0;
        $this->totalSize = count($this->data);
        $script = [];
        $isFileStart = true;
        // Only for title.ws2, as it has empty zero offset at the start which could not be read in normal ways
        while ($offset > 0) {
            $opcode = new \Ws2\ZeroOpcode($this->reader, $version, $isUpdateMode);
            $opcode->decompile($this->data);
            $script[] = $opcode;
            $offset --;
        }
        while($this->totalSize > 0) {
            $command = array_shift($this->data);
            $hex = $this->reader->getHex($command);
            if ($isFileStart && $hex === '00') {
                $a = 1;
                $isFileStart = false;
            }
            try {
                $class = $this->opcodesList->getByOpcode($hex);
                $class = 'Ws2\\Opcodes\\' . $class;
                /** @var AbstractOpcode $opcode */
                $opcode = new $class($this->reader, $version, $isUpdateMode, $this->textExtractor);
                $opcode->decompile($this->data);
                $this->registerLabels($opcode);
                $script[] = $opcode;
                $isFileStart = false;
            } catch (Exception $e) {
                $this->processOpcodeException($command, $script, $e->getMessage());
            }
            $this->totalSize -= $opcode->getCompiledSize();
            $this->curPos += $opcode->getCompiledSize();
        }
        $script = $this->processLabels($script);
        foreach ($script as $key => $opcode) {
            $script[$key] = is_object($opcode) ? $opcode->getContent() : $opcode;
        }
        return $script;
    }

    private function processOpcodeException(int $command, array $script, string $message)
    {
        $hex = $this->reader->getHex($command);
        $debugLine = $this->generateOutputLine(32);
        foreach ($script as $key => $opcode) {
            $script[$key] = is_object($opcode) ? $opcode->getContent() : $opcode;
        }

        file_put_contents('debug.log', implode("\n", $script));
        //echo "Script:\n" . implode("\n", $script) . "\n\n";
        throw new Exception($message . ". Debug: [".$hex."]\n" . $debugLine);
    }

    private function generateOutputLine(int $displayNumbers, int $perLine = 8): string
    {
        $lines = [];
        $result = [];
        for ($i=0; $i<$displayNumbers; $i++) {
            if ($i > 0 && $i % $perLine === 0) {
                $result[] = implode(' ', $lines);
                $lines = [];
            }
            $command = array_shift($this->data);
            $hex = $this->reader->getHex($command);
            $lines[] = $hex;
            if (empty($this->data)) {
                break;
            }
        }
        if (!empty($lines)) {
            $result[] = implode(' ', $lines);
        }

        return implode("\n", $result);
    }

    private function registerLabels(AbstractOpcode $opcode)
    {
        $pointers = $opcode->getPointers();
        if (empty($pointers)) {
            return;
        }
        // No need to register it second time again
        foreach ($pointers as $pointerId) {
            if (isset($this->labels[$pointerId])) {
                $opcode->setPointerLabel($pointerId, $this->labels[$pointerId]);
                return;
            }
            $this->labels[$pointerId] = '@LABEL_' . $pointerId;
            $opcode->setPointerLabel($pointerId, $this->labels[$pointerId]);
        }
    }

    /**
     * @param AbstractOpcode[] $script
     * @return AbstractOpcode[]
     * @throws Exception
     */
    private function processLabels(array $script): array
    {
        if (empty($this->labels)) {
            return $script;
        }
        $result = [];
        $position = 0;
        while($opcode = array_shift($script)) {
            $position += $opcode->getCompiledSize();
            $result[] = $opcode;
            if (isset($this->labels[$position])) {
                $result[] = $this->labels[$position];
                unset($this->labels[$position]);
            }
        }
        if (!empty($this->labels)) {
            print_r($this->labels);
            throw new Exception('Not all labels are cleared');
        }
        return $result;
    }
}