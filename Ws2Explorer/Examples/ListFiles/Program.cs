/*
 * Example to list the files inside an archive (ARC, PNA, PTF, etc.).
 * 
 * Usage: dotnet run -- path/to/archive
 */

using Ws2Explorer;
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

// Print the file listing
foreach (Ws2Explorer.FileInfo fileInfo in archive.ListFiles())
{
    string fileSize = fileInfo.FileSize?.ToString() ?? "N/A";
    Console.WriteLine($"{fileInfo.Filename} is {fileSize} bytes");
}
