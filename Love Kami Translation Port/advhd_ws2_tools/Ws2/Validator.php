<?php
namespace Ws2;

class Validator
{
    public function __construct(
        protected Reader $reader,
        protected OpcodesList $opcodesList,
        protected FilesValidator $filesValidator
    ) {
    }

    public function run(array $lines): void
    {
        $foundMissing = [];
        while (($line = array_shift($lines)) || $line !== null) {
            try {
                // Skip empty lines and comments
                if (trim($line) === '' || $line[0] === '#') {
                    continue;
                }
                // Skip pointers
                if ($line[0] === '@') {
                    continue;
                }
                $lineData = explode(' ', $line, 2);
                $function = $lineData[0];
                $params = $lineData[1] ?? '';
                $className = $this->opcodesList->getByFunctions($function);
                $class = 'Ws2\\Opcodes\\' . $className;
                /** @var \Ws2\Opcodes\AbstractOpcode $opcode */
                $opcode = new $class($this->reader, 1.9);
                $result = $opcode->validate($params, $lines, $this->filesValidator);
                if ($result !== null && !isset($foundMissing[$result])) {
                    $foundMissing[$result] = 1;
                    echo 'Missing file: ' . $result . "\n";
                }
            } catch (\Exception $e) {
                $this->processException($line, $e->getMessage(), $lines);
            }
        }
    }

    protected function processException(string $line, string $message, array $lines)
    {
        $debugLine = array_splice($lines, 0, 5);
        $debugLine = implode("\n", $debugLine);
        throw new \Exception($message . ". Exception line: [".$line."]\n" . $debugLine);
    }
}