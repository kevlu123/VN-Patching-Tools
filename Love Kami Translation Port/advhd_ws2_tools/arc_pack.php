<?php
$folder = $argv[1] ?? null;
$outFile = $argv[2] ?? null;

if (!$outFile || !$folder || !is_dir($folder)) {
    echo "Usage: php arc_pack.php DIR_TO_PACK archieve.arc";
    exit();
}
include_once "class_loader.php";
ini_set('memory_limit', '4G');
/**
 * Structure
 * 4b - total file count
 * 4b - file names block size
 * File names block
 * * 4b - filesize
 * * 4b - offset after block start
 * * null-byte string 2b per character - filename
 */

$folder = rtrim($folder, DIRECTORY_SEPARATOR);
$files = glob($folder . DIRECTORY_SEPARATOR . '*.*');
print_r($files);

// Pack PNA folders
foreach ($files as $file) {
    if (is_dir($file)) {
        // Check if PNA file already exists
        if (file_exists($file . '.packed')) {
            continue;
        }
        $pna = new Pna\Struct();
        $pna->compressFolder($file);
    }
}

$filesContainer = '';
$headerSize = 0;
$offset = 0;
$filesHeader = '';
$nullByte = pack('x');
foreach ($files as $file) {
    $content = file_get_contents($file);
    $fileSize = strlen($content);
    $fileName = explode(DIRECTORY_SEPARATOR, $file);
    $fileName = end($fileName);
    $nullByteString = '';
    $nameLen = mb_strlen($fileName);
    for ($i=0;$i<$nameLen;$i++) {
        $value = mb_substr($fileName, $i, 1);
        if (strlen($value) === 1) {
            $nullByteString .= $value . $nullByte;
        } else {
            $c = unicode_decode($value);
            $nullByteString .= pack('H4', $c);
        }
    }
    $filesHeader .= pack('VV', $fileSize, $offset) . $nullByteString . $nullByte . $nullByte;
    $headerSize += 8 + $nameLen * 2 + 2;
    $filesContainer .= $content;
    $offset += $fileSize;
}
$header = pack('VV', count($files), strlen($filesHeader));
file_put_contents($outFile, $header . $filesHeader . $filesContainer);


function unicode_decode($str) {
    return preg_replace_callback("/((?:[^\x09\x0A\x0D\x20-\x7E]{3})+)/", "decode_callback", $str);
}

function decode_callback($matches) {
    $char = mb_convert_encoding($matches[1], "UTF-16", "UTF-8");
    $escaped = "";
    for ($i = 0, $l = strlen($char); $i < $l; $i += 2) {
        $escaped .=  sprintf("%02x%02x", ord($char[$i+1]), ord($char[$i]));
    }
    return $escaped;
}