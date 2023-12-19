<?php
namespace Ws2;

use Exception;
use Ws2\Opcodes\AbstractOpcode;

class Compiler
{
    private $labels = [];

    public function __construct(
        protected Reader $reader,
        protected OpcodesList $opcodesList,
        protected array $scriptLines = []
    ) {
    }

    public function run(string $file, float $version, bool $isUpdateMode = false): void
    {
        $isComment = false;
        $code = [];
        $messageId = 0;
        while (($line = array_shift($this->scriptLines)) || $line !== null) {
            try {
                // Skip empty lines and comments
                if (trim($line) === '' || $line[0] === '#') {
                    continue;
                }
                if ($line === '/*') {
                    $isComment = true;
                    continue;
                }
                if ($line === '*/') {
                    $isComment = false;
                    continue;
                }
                if ($isComment) {
                    continue;
                }
                if ($line[0] === '@') {
                    $this->registerLabel($line);
                    $code[] = $line;
                    continue;
                }
                if ($line === 'ZeroOffset') {
                    $opcode = new \Ws2\ZeroOpcode($this->reader, $version, $isUpdateMode);
                    $opcode->preCompile($params, $this->scriptLines, $messageId);
                    $code[] = $opcode;
                    continue;
                }
                $lineData = explode(' ', $line, 2);
                $function = $lineData[0];
                $params = $lineData[1] ?? '';
                $className = $this->opcodesList->getByFunctions($function);
                $class = 'Ws2\\Opcodes\\' . $className;
                /** @var AbstractOpcode $opcode */
                $opcode = new $class($this->reader, $version, $isUpdateMode);
                $opcode->preCompile($params, $this->scriptLines, $messageId);
                $code[] = $opcode;
            } catch (Exception $e) {
                $this->processException($line, $e->getMessage());
            }
        }
        $this->recalculateLabels($code);
        $f = fopen($file, 'wb+');
        foreach ($code as $opcode) {
            if (is_object($opcode)) {
                fwrite($f, $opcode->compile($this->labels));
            }
        }

        fclose($f);
    }

    protected function processException(string $line, string $message)
    {
        $debugLine = array_splice($this->scriptLines, 0, 5);
        $debugLine = implode("\n", $debugLine);
        throw new Exception($message . ". Exception line: [".$line."]\n" . $debugLine);
    }

    private function registerLabel(string $line)
    {
        $this->labels[$line] = null;
    }

    /**
     * @param AbstractOpcode|string[] $code
     * @throws Exception
     */
    private function recalculateLabels(array $code)
    {
        $position = 0;
        foreach ($code as $opcode) {
            if (is_object($opcode)) {
                $size = $opcode->getCompiledSize();
                if ($size === 0) {
                    throw new \Exception('Incorrect compilation size for the opcode: '.$opcode::OPCODE);
                }
                $position += $size;
                continue;
            }
            $this->labels[$opcode] = $position;
        }
        foreach ($this->labels as $label => $position) {
            if ($position === null) {
                throw new Exception('Unable to find position for label: '. $label);
            }
        }
    }

}