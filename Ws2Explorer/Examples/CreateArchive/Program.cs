/*
 * Example to pack a ARC archive from all the files in a directory.
 * 
 * Usage: dotnet run -- path/to/folder/of/files/ path/to/output.arc
 */
using Ws2Explorer;
using Ws2Explorer.FileTypes;

if (args.Length != 2)
{
    Console.WriteLine("Specify a folder and output path.");
    return;
}
var folderPath = args[0];
var outputPath = args[1];

// Read all files in the folder
var dir = new Ws2Explorer.FileTypes.Directory(folderPath);
using var files = new DisposingDictionary<string, BinaryStream>();
foreach (Ws2Explorer.FileInfo fileInfo in dir.ListFiles())
{
    if (!fileInfo.IsDirectory)
    {
        files.Add(fileInfo.Filename, await dir.OpenFile(fileInfo.Filename));
    }
}

// Create the archive and write it to disk
using ArcFile archive = ArcFile.Create(files);
await using FileStream outputFile = File.Create(outputPath);
await archive.Stream.CopyTo(outputFile);
