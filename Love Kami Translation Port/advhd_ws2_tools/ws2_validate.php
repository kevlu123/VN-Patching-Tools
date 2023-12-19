<?php
$folder = $argv[1] ?? null;
$folders = array_splice($argv, 2);

if (!$folder || !is_dir($folder)) {
    echo "Usage: php ws2_validate.php DIR_WITH_WS2 [...folders]";
    exit();
}
include_once "class_loader.php";

$folder = rtrim($folder, '/');
$folder = rtrim($folder, '\\');
$files = glob($folder . DIRECTORY_SEPARATOR . '*.src');

$opcodesList = new Ws2\OpcodesList();
$opcodesList->loadList();
$reader = new Ws2\Reader();
$filesValidator = new Ws2\FilesValidator($folders);

foreach ($files as $file) {
    $fileName = explode(DIRECTORY_SEPARATOR, $file);
    $fileName = end($fileName);
    $fileName = str_replace('.src', '', $fileName);
    $fileContent = file_get_contents($file);
    $lines = explode("\n", $fileContent);
    unset($fileContent);
    echo "File {$file}\n";

    $validator = new Ws2\Validator($reader, $opcodesList, $filesValidator);
    $validator->run($lines);
}

function ws2_encrypt($int) {
    $left = ($int << 2) & 255;
    return ($int >> 6) | $left;
}