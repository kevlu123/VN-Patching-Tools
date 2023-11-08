# Text Patching Tools for If My Heart Had Wings Gift Edition Kotori

## English Translation Patch

I have created an English translation patch which you can find in the ./en_tl_patch folder in this repository. All feedback is welcome.

I have not patched any menus because the game is so short that they are unlikely to be used much if at all. Most menus already have English text or are intuitive enough.

If you would like to create your own translation patch, you can follow the instructions below. If your language does not render well in the Yu Gothic (original) or Consolas (patched) fonts, you can submit an issue.

## Extracting the original text (optional)

You can find the extracted text in the ./text folder in this repository. If you want to extract the text yourself, you can follow the instructions below.

Use [GARbro](https://github.com/morkt/GARbro) to extract the following files from script.arc.
- SC01_00.SCRIPT
- SC01_01.SCRIPT
- SC01_02.SCRIPT
- SC01_03.SCRIPT

Run `python extract_text.py <input.script> <output.json>` to extract the text from each script file. This will generate a JSON file containing the extracted text along with patching information.

Note: This script is only intended to extract the text from the original game. It may not work with already-patched files.

## Patching text

In the JSON files containing the extracted text, edit the "text" field for each entry. This will be the new text that will be inserted in the game. You may wish to use [this online tool](https://sodeve.net/sencha/json-table-editor/) for this. There are 4 of these files in total.

Character names are patched separately with another JSON file so you do not need to edit the names in the files just mentioned. You can use the example in the ./text folder.

Run `python patch_text.py <original.arc> <output.arc> <names.json> [patch1.json] [patch2.json] ...`

The parameters are:
- original.arc: The original script.arc file.
- output.arc: The name of the output file.
- names.json: The file containing character names.
- patchN.json: A list of files containing text patches.

Replace the old script.arc file with the newly generated one and the game should now display the new text.

Note: This newly generated file is not a properly encoded .arc file and cannot be opened with GARbro. However, the game can still read it.

## Fix font spacing issues

The original game uses the Yu Gothic font drawn with the GDI API. However, this monospace font cuts off wide characters such as "M" and makes the text hard to read.

To fix this, change the font to Consolas by running `python patch_font.py <original.exe> <output.exe>`.

Note: The game does not require Locale Emulator.