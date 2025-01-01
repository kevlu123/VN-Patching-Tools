# A Sky Full of Stars Patching Tools

This patch

- restores the H scenes and changes the scripts adjacent to the them to the JP version. The H scenes **and the adjacent scripts are not translated**.
- Restores the CG gallery.
- Restores the Scene-Replay gallery.

Very little testing has been done. Alert me of any issues.

## Creating the patch (for developers)

- Install .NET **7** SDK.
- In a terminal
    ```
    cd Merge
    dotnet run -c Release -- full <path_to_CLEAN_en_game_folder>  <path_to_CLEAN_jp_game_folder> <output_path>
    ```
- If you only want to output diffed Chip*.arc files, replace `full` with `diff`.
- Replace the files in your to-be-patched EN game folder with the outputted files.
- Replace the lua files in your `Script.arc` with the corresponding files in `lua/custom`. These lua files **do not need to be compiled**.
- Replace your `SysGraphic.arc` with the one in this repo.

## Flag map

### EN

| Name         | Range        | Count |
|--------------|--------------|-------|
| CG Thumbnail | [1120, 1228] sparse, compatible with JP | 76 |
| CG View      | [1250, 1659] | 410   |
| Scene        | N/A          | N/A   |
| BGM          | [1050, 1081] | 32    |

### JP

| Name         | Range        | Count |
|--------------|--------------|-------|
| CG Thumbnail | [1120, 1228] | 109   |
| CG View      | [1250, 2251] | 1002  |
| Scene        | [1090, 1106] | 17    |
| BGM          | [1050, 1081] | 32    |

### Merged

| Name         | Range        | Count | Notes |
|--------------|--------------|-------|-------|
| CG Thumbnail | [1120, 1228] | 109   | From JP. No conversion from EN required. |
| CG View      | [1250, 2251] | 1002  | From JP. All EN ws2 files have flags converted to the JP version.  |
| Scene        | [1090, 1106] | 17    | From JP. |
| BGM          | [1050, 1081] | 32    | From EN (assume is same as JP anyway). |
