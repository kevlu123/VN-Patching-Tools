using Ws2Explorer.Compiler;
using static Ws2Explorer.FileHelper;

namespace Ws2Explorer;

public static class GameHelper
{
    public static async Task SetEntryPoint(
        Directory gameFolder,
        Func<string, string[], string> setEntry,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var rioFilenames = gameFolder.ListFiles()
            .Select(fi => fi.Filename)
            .Where(f => f.Contains("rio", StringComparison.OrdinalIgnoreCase));
        using var rioFiles = new DisposingList<Named<IFolder>>();
        foreach (var rioFilename in rioFilenames)
        {
            var arc = await gameFolder.OpenFile(rioFilename, progress, ct)
                .ToDataFile<ArcFile>(progress);
            rioFiles.Add(new() { Name = rioFilename, Value = arc });
        }

        var entryRio = rioFiles.FirstOrDefault(
            rio => rio.Value.ListFiles().Any(fi => fi.Filename == "start.ws2"))
            ?? throw new FileNotFoundException("start.ws2 not found.");
        using var entryWs2 = await entryRio.Value.OpenFile("start.ws2", progress, ct)
            .ToDataFile<Ws2File>(progress);
        List<Op> ops = [.. entryWs2.Ops];
        var entryOp = ops.Single(op => op.Code == 0x07);
        var currentEntry = entryOp.Arguments[0].String;

        var options = rioFiles
            .SelectMany(rio => rio.Value.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".ws2")))
            .ToArray();

        var newEntry = setEntry(currentEntry, options);
        if (newEntry == currentEntry)
        {
            return;
        }

        ops[ops.FindIndex(op => op.Code == 0x07)] = new Op
        {
            Code = 0x07,
            Arguments = [Argument.NewString(newEntry)],
        };
        using var newWs2 = Ws2Compiler.Compile(ops);
        var hierarchy = new List<Named<IFolder>>
        {
            new() { Name = gameFolder.DirectoryName, Value = gameFolder },
            entryRio,
        };
        await FileHelper.Insert(
            hierarchy,
            new Dictionary<string, BinaryStream> { { "start.ws2", newWs2 } },
            OverwriteMode.Overwrite,
            progress,
            ct);
        await FileHelper.PropagateModifications(
            hierarchy,
            progress,
            ct);
    }
}
