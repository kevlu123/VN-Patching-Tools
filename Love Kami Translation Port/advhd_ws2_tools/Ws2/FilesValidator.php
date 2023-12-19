<?php
namespace Ws2;

class FilesValidator
{
    private $filesByKey = [];

    public function __construct(
        private array $folders = []
    ) {
        $this->init();
    }

    public function init()
    {
        foreach ($this->folders as $folder) {
            $this->readFolder($folder);
        }
    }

    private function readFolder(string $folder)
    {
        $folder = rtrim($folder, DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR;
        $files = scandir($folder);
        foreach ($files as $file) {
            if ($file === '..' || $file === '.') {
                continue;
            }
            if (is_dir($folder . $file)) {
                $this->readFolder($folder . $file);
                continue;
            }
            $options = $this->getFileNamesOptions($file);
            foreach ($options as $option) {
                $this->filesByKey[$option] = 1;
            }
        }
    }

    public function isExist(string $file): bool
    {
        if (isset($this->filesByKey[$file])) {
            return true;
        }
        $options = $this->getFileNamesOptions($file);
        foreach ($options as $option) {
            if (isset($this->filesByKey[$option])) {
                return true;
            }
        }
        return false;
    }

    private function getFileNamesOptions(string $file): array
    {
        $utfName = mb_convert_encoding($file, 'UTF-8', "SJIS");
        return [
            $file,
            mb_strtoupper($file),
            $utfName,
            mb_strtoupper($utfName),
        ];
    }
}