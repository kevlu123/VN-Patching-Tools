/*
 * Example to insert text into a WS2/WSC file.
 * This example replaces every line of text to "Hello, World!".
 * 
 * Usage: dotnet run -- path/to/your/Rio.arc/script.ws2.or.wsc path/to/output.ws2.or.wsc
 */
using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

if (args.Length != 2)
{
    Console.WriteLine("Specify a WS2/WSC script file and output path.");
    return;
}
var inputPath = args[0];
var outputPath = args[1];

// Read and decode the WS2/WSC script file.
using IFile file = await FileTool.ReadFile(inputPath).Decode();
if (file is not ScriptFile scriptFile)
{
    Console.WriteLine("File is not a WS2/WSC script file.");
    return;
}

// Construct a new WS2/WSC file with modified text.
ScriptText[] extractedText = scriptFile.Text;
string[] newText = Enumerable.Repeat("Hello, World!", extractedText.Length).ToArray();
using ScriptFile newScriptFile = scriptFile.WithText(newText);

// Write to disk
await using FileStream outputFile = File.Create(outputPath);
await newScriptFile.Stream.CopyTo(outputFile);
