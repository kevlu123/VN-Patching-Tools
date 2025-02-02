# A Sky Full of Stars Patching Tools

This patch

- Restores the H scenes and changes the scripts adjacent to the them to the JP version. The H scenes **and the adjacent scripts are not translated**.
- Restores the CG gallery.
- Restores the Scene-Replay gallery.

Very little testing has been done. Alert me of any issues.

## Download

TODO

## Developers

### Creating an *Overwrite Files* Style Patch

- Install .NET 8 SDK.
- In a terminal
    ```
    dotnet run -c Release -- <path_to_CLEAN_en_game_folder>  <path_to_CLEAN_jp_game_folder> <output_path> full
    ```
- Replace the files in your to-be-patched EN game folder with the outputted files.

This takes about 2 minutes on my machine and outputs 6.5GB of files.

### Creating a *Language Pack* Style Patch

- Install .NET 8 SDK.
- In a terminal
    ```
    dotnet run -c Release -- <path_to_CLEAN_en_game_folder>  <path_to_CLEAN_jp_game_folder> <output_path> diff
    ```
- Place the outputted files in a new folder in the game directory. The name of the folder does not matter (the game searches for subfolders containing `AdvHDLang.dll`).

This takes about a minute on my machine and outputs 2.5GB of files.

This gives you the option to specify this patch as a language pack in the dialog that appears when you first start the game. You can cleanly switch between unpatched and patched versions with this. 

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
