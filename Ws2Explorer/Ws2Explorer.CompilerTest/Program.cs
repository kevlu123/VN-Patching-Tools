using System.Reflection;
using Ws2Explorer;
using Ws2Explorer.Compiler;

Console.WriteLine("================= Start =================");
Console.WriteLine();
int tried = 0;
var failed = new List<(string filename, Exception exception)>();
var exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)!;
var dir = new Ws2Explorer.Directory(Path.Combine(exePath, "Data"));
using var arcFiles = await dir.LoadAllFilesOfType<ArcFile>();
foreach (var (arcName, arcFile) in arcFiles)
{
    Console.WriteLine(arcName);
    foreach (var fileInfo in arcFile.ListFiles())
    {
        if (!fileInfo.Filename.EndsWith(".ws2", StringComparison.InvariantCultureIgnoreCase))
        {
            continue;
        }

        Console.Write($"  {fileInfo.Filename}");
        tried++;
        try
        {
            using var stream = await arcFile.OpenFile(fileInfo.Filename);
            var ops = Ws2Compiler.Decompile(stream, out var version, mustResolveLabels: true);
            Console.Write($" ({version})");
            using var recompiled = Ws2Compiler.Compile(ops, mustResolveLabels: true);
            if (!BinaryStream.StreamEquals(stream, recompiled))
            {
                throw new Exception("Recompilation does not match original.");
            }
        }
        catch (Exception ex)
        {
            failed.Add(($"{arcName}/{fileInfo.Filename}", ex));
        }
        Console.WriteLine();
    }
}
Console.WriteLine();
Console.WriteLine("================ Results ================");
Console.WriteLine();
foreach (var (filename, ex) in failed)
{
    Console.WriteLine($"{filename} failed!");
    Console.WriteLine();
    Console.WriteLine(ex);
    Console.WriteLine();
}
Console.WriteLine($"{tried - failed.Count}/{tried} succeeded.");
Console.WriteLine();
Console.WriteLine("=========================================");
