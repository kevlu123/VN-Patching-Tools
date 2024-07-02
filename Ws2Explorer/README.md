# Ws2Explorer

GUI and command line tools for editing AdvHD engine assets.

The GUI tool is capable of editing assets in-place for quick
testing. No need to extract, edit, and repack.

Ws2Explorer can decompile script files into readable code represented
in JSON to allow simple mass processing in any language. Decompiled
scripts can be recompiled into functioning ws2 files.

## Ws2Explorer GUI Download

<https://github.com/kevlu123/VN-Patching-Tools/releases/download/Ws2Explorer-v1.4.0/Ws2Explorer.zip>

The GUI tool has a terminal built in but if you want a cross-platform
command line only tool, run `dotnet build` in the
Ws2Explorer/Ws2Explorer project folder with the .NET 7 SDK installed.
The same project can also be used as a C# library.

## Supported File Types

| File Type | Description |
|-----------|-------------|
| *.arc | Generic archive for storing game data. |
| *.pna | Image archive containing PNG files and corresponding metadata. |
| *.ws2 | Compiled game scripts (contains code and text). |
| *.ptf | Compressed/encrypted OTF or TTF font files. |
| Pan.dat | Unknown metadata. |
