# If My Heart Had Wings Gift Edition Kotori and Ageha Patching Tools

## English Translation Patch

| Version | Download |
|---------|----------|
| Kotori  | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/IMHHWGiftEdition/IMHHW.Gift.Edition.Kotori.zip> |
| Ageha   | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/IMHHWGiftEdition/IMHHW.Gift.Edition.Ageha.zip>  |

Download and unzip the patch for your version and replace the original `script.arc` file with the new one. Place `OozoraGE_fontfixed.exe` in the same folder and use this executable to run the game.

I have not patched any menus because the game is so short that they are unlikely to be used much. Most menus already have English text or are intuitive enough.

I am happy to apply any suggested changes to the script. Just submit an issue.

If you would like to create your own translation patch, you can follow the instructions below. If your language does not render well in the Yu Gothic (original) or Consolas (patched) fonts, you can submit an issue.

## Extracting the Original Text (Optional)

You can find the extracted text in the `./original_text` folder in this repository. If you want to extract the text yourself, you can follow the instructions below.

Use [GARbro](https://github.com/morkt/GARbro) to extract the script files from `script.arc`. For example, the scripts in the Kotori version are called:

- SC01_00.SCRIPT
- SC01_01.SCRIPT
- SC01_02.SCRIPT
- SC01_03.SCRIPT

Scripts 0 and 2 are identical for the Kotori and Ageha versions.

Run `python extract_text.py <input.script> <output.json>` to extract the text from each script file. This will generate a JSON file containing the extracted text along with patching information.

_Note: This script is only intended to extract the text from the original game. It may not work with already-patched files._

## Patching the Text

In the JSON files containing the extracted text, edit the "text" field for each entry. This will be the new text that will be inserted in the game. You may wish to use [this online tool](https://sodeve.net/sencha/json-table-editor/) for this. There are 4 of these files in total.

Character names are patched separately with another JSON file so you do not need to edit the names in these files. You can use the example in the `./translated_text/names_kotori.json` folder for the name patching file format.

Run `python patch_text.py <original.arc> <output.arc> <names.json> [patch1.json] [patch2.json] ...`

The parameters are:
- `original.arc`: The original script.arc file.
- `output.arc`: The name of the output file.
- `names.json`: The file containing character names.
- `patchN.json`: A list of files containing text patches.

Replace the old script.arc file with the newly generated one and the game should now display the new text.

_Note: This newly generated file is not a properly encoded .arc file and cannot be opened with GARbro. However, the game can still read it._

## Fixing the Font Spacing

The original game uses the Yu Gothic font drawn with the GDI API. However, this monospace font cuts off wide characters such as "M" and makes the text hard to read.

To fix this, change the font to Consolas by running `python patch_font.py <original.exe> <output.exe>`.

_Note: The game does not require Locale Emulator._
