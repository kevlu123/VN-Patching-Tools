<?php
namespace Ws2;

use Exception;

class Reader
{
    public function getHex(int $code): string
    {
        $hex = strtoupper(dechex($code));
        return str_pad($hex, 2, '0', STR_PAD_LEFT);
    }

    public function convertHexToChar(string $hex): string
    {
        $int = hexdec($hex);
        return chr($int);
    }

    /**
     * @throws Exception
     */
    public function readData(array &$dataSource, int $size): ?array
    {
        if ($size < 1) {
            return null;
        }
        $result = [];
        while ($size > 0) {
            if (empty($dataSource)) {
                throw new Exception("Unable to read data - incorrect size {$size} for code.");
            }
            $result[] = array_shift($dataSource);
            $size --;
        }
        return $result;
    }

    public function readString(array &$dataSource): array
    {
        $stringLen = 0;
        $result = '';
        do {
            $opcode = array_shift($dataSource);
            if ($opcode > 0) {
                $result .= chr($opcode);
            }
            $stringLen ++;
        } while ($opcode > 0);
        return [$result, $stringLen];
    }

    public function get4Bytes(array &$dataSource): string
    {
        return chr(array_shift($dataSource)) . chr(array_shift($dataSource)) . chr(array_shift($dataSource)) . chr(array_shift($dataSource));
    }

    public function get2Bytes(array &$dataSource): string
    {
        return chr(array_shift($dataSource)) . chr(array_shift($dataSource));
    }

    public function readFloat(array &$dataSource): float
    {
        $result = unpack('f', $this->get4Bytes($dataSource));
        return $result[1];
    }

    public function readDWord(array &$dataSource): int
    {
        $result = unpack('V', $this->get4Bytes($dataSource));
        return $result[1];
    }

    public function readWord(array &$dataSource): int
    {
        $result = unpack('v', $this->get2Bytes($dataSource));
        return $result[1];
    }

    public function readFloats(array &$dataSource, int $max): array
    {
        $result = [];
        for ($i = 0; $i < $max; $i ++) {
            $result[] = $this->readFloat($dataSource);
        }
        return $result;
    }

    public function readDWords(array &$dataSource, int $max): array
    {
        $result = [];
        for ($i = 0; $i < $max; $i ++) {
            $result[] = $this->readDWord($dataSource);
        }
        return $result;
    }

    public function unpackParams(?string $params): array
    {
        if ($params === '') {
            return [];
        }
        // Remove brackets
        $params = substr($params, 1, -1);
        return explode(', ', $params);
    }

    public function packString(string $text): string
    {
        $len = strlen($text);
        return pack('a' . $len, $text) . chr(00);
    }

    public function packArray(array &$params, string $type, int $count, string $function): string
    {
        $data = array_splice($params, 0, $count);
        $data = array_map($function, $data);
        return pack($type . $count, ...$data);
    }
}