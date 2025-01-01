# A Sky Full of Stars Patching Tools

This patch

- Restores the H scenes and changes the scripts adjacent to the them to the JP version. The H scenes **and the adjacent scripts are not translated**.
- Restores the CG gallery.
- Restores the Scene-Replay gallery.

Very little testing has been done. Alert me of any issues.

## Download

- <https://github.com/kevlu123/VN-Patching-Tools/releases/download/A-Sky-Full-of-Stars/A-Sky-Full-of-Stars-Part1.zip>
- <https://github.com/kevlu123/VN-Patching-Tools/releases/download/A-Sky-Full-of-Stars/A-Sky-Full-of-Stars-Part2.zip>
- <https://github.com/kevlu123/VN-Patching-Tools/releases/download/A-Sky-Full-of-Stars/A-Sky-Full-of-Stars-Part3.zip>

## Developers

### Creating The Patch

- Hardware requirements (sorry for the bad optimization).
  - 16GB RAM
  - SSD
- Install .NET **7** SDK.
- In a terminal (takes 7 minutes on my machine)
    ```
    cd Merge
    dotnet run -c Release -- full <path_to_CLEAN_en_game_folder>  <path_to_CLEAN_jp_game_folder> <output_path>
    ```
- If you want diffed Chip*.arc files instead of fully merged ones, replace `full` with `diff`. You can use the AdvHD engine's builtin patching method with these diffed archives and they are faster to generate.
- Replace the files in your to-be-patched EN game folder with the outputted files.
- Replace the lua files in your `Script.arc` with the corresponding files in `lua/custom`. These lua files **do not need to be compiled**.
- Replace your `SysGraphic.arc` with the one in this repo.

### Flag Map

#### EN

| Name         | Range        | Count |
|--------------|--------------|-------|
| CG Thumbnail | [1120, 1228] sparse, compatible with JP | 76 |
| CG View      | [1250, 1659] | 410   |
| Scene        | N/A          | N/A   |
| BGM          | [1050, 1081] | 32    |

#### JP

| Name         | Range        | Count |
|--------------|--------------|-------|
| CG Thumbnail | [1120, 1228] | 109   |
| CG View      | [1250, 2251] | 1002  |
| Scene        | [1090, 1106] | 17    |
| BGM          | [1050, 1081] | 32    |

#### Merged

| Name         | Range        | Count | Notes |
|--------------|--------------|-------|-------|
| CG Thumbnail | [1120, 1228] | 109   | From JP. No conversion from EN required. |
| CG View      | [1250, 2251] | 1002  | From JP. All EN ws2 files have flags converted to the JP version.  |
| Scene        | [1090, 1106] | 17    | From JP. |
| BGM          | [1050, 1081] | 32    | From EN (assume is same as JP anyway). |

### Notes

#### CG View Flags

After merging the `Chip*.arc`/`Voice*.arc`/`Rio.arc` files, changing `Script.arc` and `SysGraphic.arc` will restore the CG and Scene gallery menu. However, this alone doesn't make them unlock and view correctly. The flags for viewing the CGs aren't compatible between the EN and JP versions so the EN flags need to be converted to JP flag for the corresponding CG (since the EN CGs are a subset of the JP CGs). This is basically a find-and-replace in each EN `yozora*.ws2` file in `Rio.arc`.

#### Merging Graphics.arc

There is also an incompatibility in the EN and JP versions of `Graphic.arc` which makes it difficult to merge them in the usual way e.g. `B沙夜_02X.pna` index 5 is an image of Saya's face in the EN version while it is Saya's body in the JP version (the layout of the pna file is completely different). Changing the ws2 files to correct this is difficult because the game uses a different instruction to load the pna file and to load the indices from pna file so it isn't a simple find-and-replace.

My solution is to track whether the current ws2 script is from the EN or JP version. If it is the JP version, then the game should use `Graphic_JP.arc` instead which is the `Graphic.arc` from the JP version. This is implemented with an extra opcode inserted near the start of each `yozora*.ws2` file to call `SetIsJPWs2()` in Lua.

I am still unsure whether all this is needed at all because I haven't seen any strange things happen if I only use the JP `Graphic.arc`.
