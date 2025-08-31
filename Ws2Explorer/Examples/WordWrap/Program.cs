/*
 * Example to wrap text in a WS2/WSC file by pixel width.
 * The font is assumed to be size 20 and the wrapping is performed at 500px.
 * 
 * Usage: dotnet run -- path/to/archive
 */

using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

if (args.Length != 5)
{
    Console.WriteLine("Specify an WS2/WSC file, output path, font path, font size, and pixel wrap width.");
    return;
}
var scriptPath = args[0];
var outputPath = args[1];
var fontPath = args[2];
var fontSize = int.Parse(args[3]);
var pixelWrapWidth = int.Parse(args[4]);

// Read and decode the script file
using IFile _scriptFile = await FileTool.ReadFile(scriptPath).Decode();
if (_scriptFile is not ScriptFile scriptFile)
{
    Console.WriteLine("File is not a WS2/WSC file.");
    return;
}

// Read and decode the font file
using IFile _fontFile = await FileTool.ReadFile(fontPath).Decode();
if (_fontFile is not FontFile fontFile)
{
    Console.WriteLine("File is not a WS2/WSC file.");
    return;
}

// Wrap the text
var newText = scriptFile.Text
    .Select(text => WordWrap.WrapByPixelWidth(
        WordWrap.RemoveNewlines(text.Text),
        pixelWrapWidth,
        fontFile.FontMeasurer,
        fontSize,
        FontMeasurer.FontStyle.Regular,
        out _))
    .ToArray();
using ScriptFile newScriptFile = scriptFile.WithText(newText);

// Write to disk
await using FileStream outputFile = File.Create(outputPath);
await newScriptFile.Stream.CopyTo(outputFile);
