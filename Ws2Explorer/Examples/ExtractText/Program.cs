/*
 * Example to extract the text from the WS2/WSC files inside an archive (usually Rio.arc)
 * and print it to the console. Note that Windows terminal, powershell, etc. may not
 * display Japanese characters correctly.
 * 
 * Usage: dotnet run -- path/to/Rio.arc
 */
using Ws2Explorer;
using Ws2Explorer.FileTypes;
using Ws2Explorer.HighLevel;

if (args.Length != 1)
{
    Console.WriteLine("Specify an archive.");
    return;
}
var archivePath = args[0];

// Read and decode the archive.
using IFile file = await FileTool.ReadFile(archivePath).Decode();
if (file is not IArchive archive)
{
    Console.WriteLine("File is not an archive.");
    return;
}

foreach (Ws2Explorer.FileInfo fileInfo in archive.ListFiles())
{
    using IFile subFile = await archive.OpenFile(fileInfo.Filename).Decode();
    if (subFile is not ScriptFile scriptFile)
    {
        // Is not a WS2 or WSC file, skip it.
        continue;
    }

    // Print out the text
    foreach (ScriptText text in scriptFile.Text)
    {
        if (text.IsChoice)
        {
            // Text belongs to a choice.
            Console.WriteLine($"Choice: {text.Text}");
        }
        else if (text.Name.Length > 0)
        {
            // Text has an associated speaker.
            Console.WriteLine($"{text.Name}: {text.Text}");
        }
        else
        {
            // Text is not associated with a speaker.
            Console.WriteLine(text.Text);
        }
    }
}
