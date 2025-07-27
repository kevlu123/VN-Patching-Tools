# Love Kami Restoration Patch

This patch restores the H-scenes removed from the English release of the Love Kami games.
There are also patches for converting the Japanese versions which already have the H-scenes to English.

The H-scenes are machine translated and the gallery for the English releases has not been patched.

## Downloads

Download, unzip, and replace the game files with the new ones.

| Game            | Applicable Version        | Patch Size | Download |
|-----------------|---------------------------|:----------:|----------|
| Divinity Stage  | <https://vndb.org/r49129> | 601MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKamiEn/Divinity.Stage.zip> |
| Sweet Stars     | <https://vndb.org/r52608> | 353MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKami/Sweet.Stars.zip> |
| Useless Goddess | <https://vndb.org/r51504> | 613MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKamiEn/Useless.Goddess.zip> |
| Trouble Goddess | <https://vndb.org/r52609> | 321MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKami/Trouble.Goddess.zip> |
| Healing Harem   | <https://vndb.org/r60067> | 658MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKamiEn/Healing.Harem.zip> |
| Pureness Harem  | <https://vndb.org/r60066> | 224MB      | <https://github.com/kevlu123/VN-Patching-Tools/releases/download/LoveKami/Pureness.Harem.zip> |

## Exe Patch Notes

For Trouble Goddess, the exe file has been patched to decrease the size of the text.

A byte at offset 0x39555 has been changed from 72 (0x48) to 80 (0x50) which is used as a divisor to compute the lfHeight field for [LOGFONT](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta).

## Developers

This patch was created when this repository was at git commit 2ea2b33f37a9a5c49b64fd705daa5fb8cfee2fdf.
