<?php
namespace Ws2;

class OpcodesList
{
    protected array $opcodes = [];
    protected array $functions = [];

    public function loadList(): void
    {
        $files = scandir(__DIR__ . DIRECTORY_SEPARATOR . 'Opcodes');
        foreach ($files as $file) {
            if ($file === '.' || $file === '..') {
                continue;
            }
            if (str_contains($file, 'Abstract')) {
                continue;
            }
            $file = str_replace('.php', '', $file);
            $class = 'Ws2\\Opcodes\\' . $file;
            if (class_exists($class)) {
                if (isset($this->opcodes[$class::OPCODE])) {
                    throw new \Exception('Duplicate Opcode: ' . $class::OPCODE . ' in file ' . $file . ' and ' . $this->opcodes[$class::OPCODE]);
                }
                if (isset($this->functions[$class::OPCODE])) {
                    throw new \Exception('Duplicate function: ' . $class::FUNC . ' in file ' . $file . ' and ' . $this->functions[$class::FUNC]);
                }
                $this->opcodes[$class::OPCODE] = $file;
                $this->functions[$class::FUNC] = $file;
            }
        }
    }

    public function getByOpcode(string $hex): string
    {
        if (!isset($this->opcodes[$hex])) {
            throw new \Exception('Opcode '. $hex . ' is not found');
        }
        return $this->opcodes[$hex];
    }

    public function getByFunctions(string $func): string
    {
        if (!isset($this->functions[$func])) {
            throw new \Exception('Function '. $func . ' is not found');
        }
        return $this->functions[$func];
    }
}