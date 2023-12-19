# If My Heart Had Wings Script Tools
These tools can be used to extract formatted scripts from ARC files and from the compiled WS2 (WillPlus) code, to modify them and to pack them back again. Used for visual novels running AdvHD.exe.

The main goal of the scripts is to be able to unpack game files, convert scripts to readable and editable text format, and pack everything back so that the game can read it correctly.

Tested games:
* If My Heart Had Wings: Flight Diary JP/EN
* LoveKami - Healing Harem- EN
* A Sky Full of Stars JP/EN

Affected games (may require some code adjustments):
* If My Heart Had Wings
* LoveKami (other 2 games)
* Adventure of a Lifetime
* Other MoeNovel games

The scripts will be tested on "*If My Heart Had Wings: Flight Diary*" new (1.9.* EN) and old (1.3.* JP) versions, "*LoveKami -Healing Harem-*", "*A Sky Full of Stars*" (1.4 JP and 1.9 EN).
All of the files can be extracted from arc, ws2 files can be unpacked into pseudo code, and the pseudo code can be recompiled to produce files that are exactly the same as they were before. Other games should be ok to extract, but it's possible that compiled scripts may contain some unsupported opcodes. In this case code update is required.

## Useful tools

[GARbro](https://github.com/morkt/GARbro) - powerful tool for various VN packages. It can be used to quickly validate the contents of an arc file and check through various files within it, including the PNA ones used in AdvHD. Very useful if you don't need all the content and for all non-game-specific media content (images, audio).

[arc_unpacker](https://github.com/vn-tools/arc_unpacker) - used to extract everything from ARC files, including unpacking PNA packages inside packages. Has some problems with repacking these PNA files. May be able to fix some console parameter issues.

[WillPlusManager](https://github.com/marcussacana/WillPlusManager) - Allows you to edit lines of text within WS2 script files. Not very handy, it doesn't work with internal pointers. But it has been used as a base for reverse engineering scripts.

## Requirements
You will need to use **arc_unpacker** or **GARbro** to extract files. I might write something to replace this step, but not right now.

As all scripts are in PHP and are open for editing, validating. You will need to download the interpritator to run them.
Short steps that may be required for Windows:
1. Go to [download](https://windows.php.net/download/) page and get something like "VS16 x64 Thread Safe" zip file.
2. Extract it to some separate folder (`"C:\php8\"`)
3. Rename `php.ini-development` to `php.ini`
4. Edit it and uncomment line `;extension=mbstring` -> `extension=mbstring`. Uncomment line with `extension_dir = ` under "On windows". Save.
5. You should be ok to use it from the command line `C:\php8\php.exe D:\wings\ws2_decompile.php`
6. You can register a program in the Windows PATH config, so it could be run via `php` only.
    * See [here](https://www.php.net/manual/en/install.windows.commandline.php) or [here](https://www.forevolve.com/en/articles/2016/10/27/how-to-add-your-php-runtime-directory-to-your-windows-10-path-environment-variable/).
    * If done correctly and if you are located inside `D:\wings\` folder with scripts you should be good to run just `php ws2_decompile.php`.

## Usage

### Unpack arc files
Use GARbro to extract data from the Rio.arc file.
If arc_unpacker is used, you will need to add param to the scripts to remove "protection".

### Convert ws2 scripts
```
php ws2_decompile.php DIR_TO_UNPACK 1.0|1.4|1.9
```
Decompile all ws2 scripts inside the folder and create new files `AFT_001.ws2`>`AFT_001.ws2.src`. All modified and existing files are overwritten.
Options:
* `DIR_TO_UNPACK`  - **required**, folder where ws2 files will be extracted (ex: `D:\wings\jp\Rio~.arc\`)
* `version` - `1.0|1.4|1.9`, defaults to `1.9`. Depending on the game you are unpacking, the version can be validated on the AdvHD.exe file. New ones (Wings English from Steam) use `1.9`. `1.0` is used by the old JP version.
  
Optional params:
* `decrypt` - `1|0` - `-d=1`, defaults to `0` (assuming you are using GARbro). Compiled scripts are "protected", so they can't be read via text files. GARbro reverts this protection for ws2 files, arc_unpacker does not. So there is the an additional step of "decrypting" for arc_unpacker - you should provide `1` as an option. In case you forget - you will see an error like: `Fatal error: Uncaught Exception: Opcode 00 is not found. Debug: [00]...`. Or some other opcode.
* `mode` - `update|default` - `-m=update`, defaults to `default`. Old scripts (`1.0`, `1.4`) have some differences from `1.9` ones - some functions have more params, some params are different. The `update` mode will translate all known changes from old version to the latest one `1.9`. Used to copy-paste old JP scripts into new ones version and they will not produce errors on the compilation step. See the [wings.txt](wings.txt) file for examples.
* `text_file` - `-t=C:\scripts\text_log.txt`. Will generate a text file with all dialogs and character names. Simple output. Could be used to paste this data somewhere as a bunch.
```
暁斗: 「ふわぁ……。 　……はい、もしもし、宙見です」

ひかり: 『暁斗！　外見て、外！』

暁斗: 「……」

眠い目を擦りながら、結露して曇った窓を開けると、流れ込んできた冷たい空気に頬を撫でられ、背筋がゾクゾクと震える。
```

#### Examples:

1. `php ws2_decompile.php ..\jp\Rio~.arc\ 1.0` - decompiles jp rio files extracted by GARbro.
2. `php ws2_decompile.php ..\jp\Rio~.arc\ 1.0 -d=1 -m=update` - decompiles jp rio files extracted by arc_unpacker and translates it to the modern format.
3. `php ws2_decompile.php ..\en\Rio~.arc\` - decompiles latest English files (version 1.9 and no decryption).

### Edit
At this point you can open any text editor that supports the JP locale and edit `ws2.src` files.  
See [Scripts Edit](SCRIPTS.md) doc for more.

### Validator
Runs through decompiled `*.ws2.src` files and checks if all known links to sound effects, background images or other resources are present in the provided scripts. Useful when parts of JP scripts are copied to the EN base in case EN files have been censored.
Options:
* Folder with ws2 files - required.
* Any number of folders for other unpacked arc files.
  `php ws2_validator.php ..\en_compiled\Rio~.arc\ ..\en_compiled\Chip1~.arc\  ..\en_compiled\Chip2~.arc\ ..\en_compiled\Graphic~.arc\`

### PNA Merge
PNA files have a list of images that are combined one after another. They are character faces, models and expressions. They don't have a name, just an iterable number with some additional parameters (width, height, etc). So it is possible to validate/extract images from a PNA file, but repacking them is harder because 2 parameters are unknown. For example, I can extract width and height from the image itself, but I could not fogure out what the last 2 parameters meant, so I just called them as "size options".

You may need this if the character nude model has been removed from the PNA file in the English version. For "Flight Diary", they conveniently replaced the files inside the PNA files with non-nude images, so it's easy to replace while keeping all the content correctly placed.

As we don't know 2 parameters from the images, this means that we have to use the original JP data and place it in the updated file.

One more note - the JP version of FD has a problem with PNA files. Some of the images inside are empty. The English version has this fixed and there are no empty values. But in JP those "empty" lines still have "ID number" and some images have higher counters than others in EN. So you can't just copy a full PNA file from the JP version, you have to copy part of it.

Options:
* Pna file from (usually JP version).
* Pna file to (English version).
* A set of parameters indicating which image from file 1 should be placed in file 2 and where.
```
php pna_merge.php ..\jp\Graphic\佳奈子ST02_L.pna ..\en_compiles\Graphic~.arc\佳奈子ST02_L.pna  36-26 37-27 40-28 41-29
```

### Compiling

```
php ws2_compile.php ..\en\Rio~.arc\ 1.9 update KAN_3001_3_E.ws2 KAN_3001_4_E.ws2  KAN_3002_1_E.ws2 KAN_3002_2.ws2 BEF_003_E.ws2 BEF_004_E.ws2
```
Options:
* `DIR_TO_COMPILE`  - **required**, folder where `src` files are located.
* `version` - `1.0|1.9`, defaults to `1.9`. Same as decompiling.
* `mode` - `update|default`, defaults to `update`. Most updates are done during the decompilation step. This flag only updates message IDs from internal values inside scripts to numeric numbers from the beginning of the file. You can disable this by running "default" in case all files are solid.
* Optional. List of files to update (without `.src`). If no files are given, all found `src` files will be compiled. With the list, only some of them will be processed, without doing unnecessary work.

Generates additional files inside the folder: `AFT_003_E.ws2.src` -> `AFT_003_E.ws2.cmp` ->`AFT_003_E.ws2u`
`cmp` is the compiled version, `ws2u` - is the compiled version updated with "protection" that can be run by the game.

If there were no updates in the files `ws2u` will be identical to the `ws2` file extracted by arc_conv. `ws2.cmp` file will be identical to the `ws2` file extracted by GARbro.


### Pack everything back
```
php arc_pack.php ..\en_compiles\Rio~.arc\ "f:\SteamLib\steamapps\common\IF MY HEART HAD WINGS FLIGHT DIARY\Rio.arc"
```
Compiles all files in the folder into the given `arc` file. The file will be replaced.
You can check the [run.bat](run.bat) file to check how it can be configured to run just one file to compile everything and place it in the game folder.
