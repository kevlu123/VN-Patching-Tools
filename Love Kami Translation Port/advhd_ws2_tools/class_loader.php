<?php
define('ROOT', __DIR__);

spl_autoload_register(function ($className)
{
    $fileName = sprintf(
        "%s%s%s.php",
        ROOT,
        DIRECTORY_SEPARATOR,
        str_replace("\\", "/", $className)
    );

    if (file_exists($fileName))
    {
        require ($fileName);
    }
    else
    {
        echo "file not found {$fileName}";
    }
});