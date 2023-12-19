<?php
$inFile = $argv[1] ?? null;
$outFile = $argv[2] ?? null;
$options = array_splice($argv, 3);
print_r($options);
if (!$inFile || !$outFile) {
    echo "Usage: php pna_merge.php file_from.pna file_to.pna 36-26 37-27 40-28 41-29";
    exit();
}
//include_once "class_loader.php";
ini_set('memory_limit', '4G');
/**
 * Structure
 * 4b - header
 * 4b * 3 - unk data, last 4 bytes fixed
 * 4b  - total number of files
 * Files info (x total number of files)
 * * 4b - zero
 * * 4b - file id (count down to zero)
 * * 8b - unk info - size options
 * * 4b - image width
 * * 4b - image height
 * * 12b - fixed data for PNG (data for other files?)
 * * 4b - file size
 * Content - just content of files one by one
 */
$fileIn = readPnaFile($inFile);
$fileOut = readPnaFile($outFile);

foreach ($options as $movement) {
    $movement = trim($movement);
    $movement = explode('-', $movement);
    if (!isset($movement[1])) {
        continue;
    }
    $fromId = (int)$movement[0];
    if (!isset($fileIn['files'][$fromId])) {
        continue;
    }
    $toId = (int)$movement[1];
    $fileOut['files'][$toId] = $fileIn['files'][$fromId];
}
writePnaFile($fileOut, $outFile);


function writePnaFile(array $data, string $file)
{
    $f = fopen($file, 'w+');
    fwrite($f, pack('a4V3', $data['head']['head'], $data['head']['unk1'], $data['head']['unk2'], $data['head']['unk3']));
    $totalFiles = count($data['files']);
    fwrite($f, pack('V', $totalFiles));
    $content = '';
    foreach ($data['files'] as $fdata) {
        $totalFiles--;
        $content .= $fdata['content'] ?? '';
        $id = $fdata['id'];
        if ($id > 0) $id = $totalFiles;
        unset($fdata['content'], $fdata['mode'], $fdata['id']);
        fwrite($f, pack('VlV6fV', 0, $id, ...array_values($fdata)));
    }
    fwrite($f, $content);
    fclose($f);
}

function readPnaFile(string $file): array
{
    echo "Reading file: {$file}\n";
    $result = [];
    $f = fopen($file, 'r+');
    // Read header
    $result['head'] = unpack('a4head/V3unk', fread($f, 16));
    $totalFiles = readDWord($f);
    $result['head']['files'] = $totalFiles;
    $result['files'] = [];
    while($totalFiles > 0) {
        $totalFiles --;
        $result['files'][] = unpack('Vmode/lid/V2unk/Vwidth/Vheight/Vzero/Vzero2/ffloat/Vsize', fread($f, 40));
    }
    foreach ($result['files'] as $key => $fileData) {
        if ($fileData['size'] > 0) {
            $result['files'][$key]['content'] = fread($f, $fileData['size']);
        }
    }
    fclose($f);
    return $result;
}

function readDWord(&$f)
{
    $data = unpack('V', fread($f, 4));
    return array_shift($data);
}

/* Processed scripts:
# Graphics update
php pna_merge.php ..\JpOrig\Graphic\佳奈子ST02_L.pna ..\EnDlc\Sources\Graphic~.arc\佳奈子ST02_L.pna  36-26 37-27 40-28 41-29
php pna_merge.php ..\JpOrig\Graphic\佳奈子ST02_M.pna ..\EnDlc\Sources\Graphic~.arc\佳奈子ST02_M.pna  36-26 37-27 40-28 41-29
php pna_merge.php ..\JpOrig\Graphic\佳奈子ST02_S.pna ..\EnDlc\Sources\Graphic~.arc\佳奈子ST02_S.pna  36-26 37-27 40-28 41-29
php pna_merge.php ..\JpOrig\Graphic\佳奈子ST02_W.pna ..\EnDlc\Sources\Graphic~.arc\佳奈子ST02_W.pna  36-26 37-27 40-28 41-29

php pna_merge.php ..\JpOrig\Graphic\ほたるST02_L.pna ..\EnDlc\Sources\Graphic~.arc\ほたるST02_L.pna 38-30 39-31
php pna_merge.php ..\JpOrig\Graphic\ほたるST02_M.pna ..\EnDlc\Sources\Graphic~.arc\ほたるST02_M.pna 38-30 39-31
php pna_merge.php ..\JpOrig\Graphic\ほたるST02_S.pna ..\EnDlc\Sources\Graphic~.arc\ほたるST02_S.pna 38-30 39-31
php pna_merge.php ..\JpOrig\Graphic\ほたるST02_W.pna ..\EnDlc\Sources\Graphic~.arc\ほたるST02_W.pna 38-30 39-31


php arc_pack.php ..\EnDlc\Sources\Graphic~.arc\ "f:\SteamLib\steamapps\common\IF MY HEART HAD WINGS FLIGHT DIARY\Graphic.arc"
sky:
php pna_merge.php ..\JpOrig\Graphic\佳奈子ST02_L.pna ..\EnDlc\Sources\Graphic~.arc\佳奈子ST02_L.pna  36-26 37-27 40-28 41-29


php pna_merge.php ..\sky\JpOrig\Graphic\ ..\sky\EnOrig\Graphic\
php pna_merge.php ..\sky\JpOrig\Graphic\Aひかり_01X.pna ..\sky\EnOrig\Graphic\Aひかり_01X.pna 33-64 34-65 35-66
php pna_merge.php ..\sky\JpOrig\Graphic\Aひかり_02X.pna ..\sky\EnOrig\Graphic\Aひかり_02X.pna 28-75 29-76
php pna_merge.php ..\sky\JpOrig\Graphic\Aひかり_03X.pna ..\sky\EnOrig\Graphic\Aひかり_03X.pna 30-63 31-64 32-65
php pna_merge.php ..\sky\JpOrig\Graphic\B沙夜_01X.pna ..\sky\EnOrig\Graphic\B沙夜_01X.pna 40-99 41-100 42-101
php pna_merge.php ..\sky\JpOrig\Graphic\B沙夜_02X.pna ..\sky\EnOrig\Graphic\B沙夜_02X.pna 40-73 41-74 42-75
php pna_merge.php ..\sky\JpOrig\Graphic\C織姫_01X.pna ..\sky\EnOrig\Graphic\C織姫_01X.pna 29-65 30-66
php pna_merge.php ..\sky\JpOrig\Graphic\C織姫_03X.pna ..\sky\EnOrig\Graphic\C織姫_03X.pna 35-81 36-82 37-83
php pna_merge.php ..\sky\JpOrig\Graphic\Dころな_01X.pna ..\sky\EnOrig\Graphic\Dころな_01X.pna 47-95 48-96 49-97 50-98
php pna_merge.php ..\sky\JpOrig\Graphic\Dころな_02X.pna ..\sky\EnOrig\Graphic\Dころな_02X.pna 33-59 34-60
php pna_merge.php ..\sky\JpOrig\Graphic\Dころな_03X.pna ..\sky\EnOrig\Graphic\Dころな_03X.pna 33-58 34-59

*/