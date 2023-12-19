<?php
$folder = $argv[1] ?? null;
$version = $argv[2] ?? '1.9';
$mode = $argv[3] ?? 'update';
$compileFiles = array_splice($argv, 4);
$compileFiles = array_flip($compileFiles);

if (!$folder || !is_dir($folder)) {
    echo "Usage: php ws2_compile.php DIR_TO_COMPILE 1.0|1.9 [update|default] [...files]";
    exit();
}
include_once "class_loader.php";

$version = (float)$version;
$isUpdateMode = $mode === 'update';

$ignoreFiles = [/*'CG_Achievement.ws2' => 1*/];

$folder = rtrim($folder, '/');
$folder = rtrim($folder, '\\');
$files = glob($folder . DIRECTORY_SEPARATOR . '*.src');

$opcodesList = new Ws2\OpcodesList();
$opcodesList->loadList();
$reader = new Ws2\Reader();

foreach ($files as $file) {
    $fileName = explode(DIRECTORY_SEPARATOR, $file);
    $fileName = end($fileName);
    $fileName = str_replace('.src', '', $fileName);
    $fileNameNoWs = str_replace('.ws2', '', $fileName);
    /*if (array_key_exists($fileName, $ignoreFiles)) {
        continue;
    }*/
    if (!empty($compileFiles) && !array_key_exists($fileName, $compileFiles) && !array_key_exists($fileNameNoWs, $compileFiles)) {
        continue;
    }
    $fileContent = file_get_contents($file);
    $lines = explode("\n", $fileContent);
    unset($fileContent);
    echo "File {$file}\n";

    $file = str_replace('.src', '.cmp', $file);
    $compiler = new Ws2\Compiler($reader, $opcodesList, $lines);
    $compiler->run($file, $version, $isUpdateMode);

    $fileContent = file_get_contents($file);

    $data = unpack('C*', $fileContent);
    $size = count($data);
    echo "File {$file} size:  . $size . \n";

    for ($i = 1; $i <= $size; $i++) {
        $data[$i] = ws2_encrypt($data[$i]);
    }
    $file = str_replace('.ws2.cmp', '.ws2u', $file);
    file_put_contents($file, pack('c*', ...$data));
}

function ws2_encrypt($int) {
    $left = ($int << 2) & 255;
    return ($int >> 6) | $left;
}