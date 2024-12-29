# Ws2Explorer

GUI and command line tools for editing AdvHD engine assets.

The GUI tool is capable of editing assets in-place for quick
testing. No need to extract, edit, and repack.

Ws2Explorer can decompile script files into readable code represented
in JSON to allow simple mass processing in any language. Decompiled
scripts can be recompiled into functioning ws2 files.

## Ws2Explorer GUI Download

<https://github.com/kevlu123/VN-Patching-Tools/releases/download/Ws2Explorer-v1.5.0/Ws2Explorer-v1.5.0.zip>

The GUI tool has a terminal built in but if you want a cross-platform
command line only tool, run `dotnet build` in the
Ws2Explorer/Ws2Explorer project folder with the .NET 7 SDK installed.
The same project can also be used as a C# library.

## Supported File Types

| File Type | Description                                                    |
|-----------|----------------------------------------------------------------|
| *.arc     | Generic archive for storing game data.                         |
| *.pna     | Image archive containing PNG files and corresponding metadata. |
| *.ws2     | Compiled game scripts (contains code and text).                |
| *.ptf     | Compressed/encrypted OTF or TTF font file.                     |
| Pan.dat   | Unknown metadata.                                              |

## Tips

- Extract files with `File > Export...`
- Edit files inline with `Edit > Edit In Application...`
- Change the text/image/hex editor with `File > Set External Editor Paths...`
- Show hex preview with `View > Show Hex Viewer`
- Rearrange images in PNA files with `Edit > Swap`
- Copy files in Windows File Explorer and paste directly into Ws2Explorer. Copying between multiple instances of Ws2Explorer also works.
- Press tab while selecting the current directory textbox to autocomplete the path.
- Compile with `IncludeVideoPlayer` set to `true` in `Ws2Explorer.Gui.csproj` to enable the video player. This will significantly increase the program size and first startup time.

## Changelog

### 1.6.0 (2024/12/29)

- Create new image entries in PNA files.
- Fix deleting entries in PNA files.
- Recognise compiled lua files.
- Allow extra arguments for external editors (e.g. -multiInst -nosession for Notepad++).

### 1.5.0 (2024/12/25)

- Fix window not showing after closing with the window minimised.
