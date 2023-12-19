<?php
$folder = $argv[1] ?? null;
$version = $argv[2] ?? '1.9';

if (!$folder || !is_dir($folder)) {
    echo "Usage: php ws2_decompile.php DIR_TO_UNPACK 1.0|1.4|1.9";
    exit();
}
include_once "class_loader.php";

$extractor = new Helper\ParamsExtractor();
$options = $extractor->extractParams($argv, [
    new Helper\OptionParam('decrypt', '0', ['d', 'dec']), // 0 / 1
    new Helper\OptionParam('mode', 'default', ['m']), // default / update
    new Helper\OptionParam('text_file', null, ['text', 'file', 't']),
]);

$version = (float)$version;
$isUpdateMode = $options['mode'] === 'update';
$isRequireDecrypt = (bool)$options['decrypt'];

$folder = rtrim($folder, '/');
$folder = rtrim($folder, '\\');
$files = glob($folder . DIRECTORY_SEPARATOR . '*.ws2');

$opcodesList = new Ws2\OpcodesList();
$opcodesList->loadList();
$reader = new Ws2\Reader();
$textExtractor = new Helper\TextExtractor($options['text_file']);

// If you want to skip some files, ex: ['title.ws2' => 1]
$ignoreFiles = [];

$specificFiles = [/*'title.ws2' => 1*/];

// To skip first N files if you don't want to unpack them on any run
$skip = 0;
foreach ($files as $id => $file) {
    if ($skip > 0) {
        $skip--;
        continue;
    }
    $fileName = explode(DIRECTORY_SEPARATOR, $file);
    $fileName = end($fileName);
    $fileName = str_replace('.src', '', $fileName);
    if (array_key_exists($fileName, $ignoreFiles)) {
        continue;
    }

    $fileContent = file_get_contents($file);

    $data = unpack('C*', $fileContent);
    $size = count($data);
    echo $id . " - File {$file} size: {$size}. ";
    $time = microtime(true);

    if ($isRequireDecrypt) {
        for ($i = 1; $i <= $size; $i++) {
            $data[$i] = ws2_decrypt($data[$i]);
        }
    }
    $offset = 0;
    if (array_key_exists($fileName, $specificFiles)) {
        array_shift($data);
        $offset = $specificFiles[$fileName];
    }
    $struct = new Ws2\Struct($reader, $opcodesList, $data, $textExtractor, $offset);
    $script = $struct->generateScript($version, $isUpdateMode, $offset);
    file_put_contents($file . '.src', implode("\n", $script));
    echo "Parsed time: " . round(microtime(true) - $time, 2) . "\n";
}
$textExtractor->dump();

function ws2_decrypt($int) {
    $left = ($int << 6) & 255;
    return ($int >> 2) | $left;
}