/*
 * Example to insert text into a WS2/WSC file in-place even inside an archive.
 * This example replaces every line of text to "Hello, World!".
 * 
 * Usage: dotnet run -- path/to/your/Rio.arc/script.ws2.or.wsc
 */
using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

if (args.Length != 1)
{
    Console.WriteLine("Specify a WS2/WSC script file.");
    return;
}
var scriptPath = args[0];

// Open all the archives on the way to the WS2/WSC script file.
// For this, we need a full path to the file.
using DisposingList<NamedFolder> folders = await FileTool.OpenFolderHierarchy(Path.GetFullPath(scriptPath));
if (folders[^1].Folder is not ScriptFile scriptFile)
{
    Console.WriteLine("File is not a WS2/WSC script file.");
    return;
}

// Construct a new WS2/WSC file with modified text.
ScriptText[] extractedText = scriptFile.Text;
string[] newText = Enumerable.Repeat("Hello, World!", extractedText.Length).ToArray();
using ScriptFile newScriptFile = scriptFile.WithText(newText);

// Write to disk.
// The last folder in the hierarchy has changed so update the
// last folder and propagate the changes up the hierarchy
// which may contain nested archives.
folders[^1] = folders[^1] with { Folder = newScriptFile };
await FileTool.PropagateModifications(folders);
