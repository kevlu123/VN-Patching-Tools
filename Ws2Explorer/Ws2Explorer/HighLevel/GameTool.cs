using Ws2Explorer.Compiler;

namespace Ws2Explorer.HighLevel;

public static class GameTool
{
    private static List<string> GetRioFilenames(Directory gameFolder)
    {
        return gameFolder.ListFiles()
            .Select(fi => fi.Filename)
            .Where(f => f.Contains("rio", StringComparison.OrdinalIgnoreCase)
                && f.EndsWith(".arc", StringComparison.OrdinalIgnoreCase))
            .ToList();
    }

    private static T Single<T>(
        this IEnumerable<T> source,
        Func<T, bool> predicate,
        string noneError,
        string multipleError)
        where T : notnull
    {
        var count = 0;
        T? result = default;
        foreach (var item in source)
        {
            if (predicate(item))
            {
                result = item;
                count++;
                if (count > 1)
                {
                    throw new InvalidDataException(multipleError);
                }
            }
        }

        if (count == 0)
        {
            throw new InvalidDataException(noneError);
        }

        return result!;
    }

    public static async Task SetEntryPoint(
        Directory gameFolder,
        Func<string, string[], string> setEntry,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var rioFiles = new DisposingList<NamedFolder>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            var arc = await gameFolder.OpenFile(rioFilename, progress, ct)
                .Decode<ArcFile>();
            rioFiles.Add(new() { Name = rioFilename, Folder = arc });
        }

        var entryRio = rioFiles.Single(
            rio => rio.Folder.ListFiles()
                .Any(fi => fi.Filename.Equals("start.ws2", StringComparison.CurrentCultureIgnoreCase)),
            "'start.ws2' not found.",
            "Multiple 'start.ws2' found.");
        using var entryWs2 = await entryRio.Folder.OpenFile("start.ws2", progress, ct)
            .Decode<Ws2File>();
        List<Op> ops = [.. entryWs2.Ops];
        var entryOp = ops.Single(
            op => op.Code == Opcode.JUMP_FILE_07,
            "JumpFile op not found.",
            "Multiple JumpFile ops found.");
        var currentEntry = entryOp.Arguments[0].String;

        var options = rioFiles
            .SelectMany(rio => rio.Folder.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".ws2")))
            .ToArray();

        var newEntry = setEntry(currentEntry, options);
        if (newEntry == currentEntry)
        {
            return;
        }

        ops[ops.FindIndex(op => op.Code == Opcode.JUMP_FILE_07)] = new Op
        {
            Code = Opcode.JUMP_FILE_07,
            Arguments = [Argument.NewString(newEntry)],
        };
        using var newWs2 = Ws2Compiler.Compile(ops);
        var hierarchy = new List<NamedFolder>
        {
            new() { Name = gameFolder.DirectoryName, Folder = gameFolder },
            entryRio,
        };
        await FileTool.Insert(
            hierarchy,
            new Dictionary<string, BinaryStream> { { "start.ws2", newWs2 } },
            OverwriteMode.Overwrite,
            progress,
            ct);
        await FileTool.PropagateModifications(
            hierarchy,
            progress,
            ct);
    }

    public static async Task ConvertLuacToText(
        Directory gameFolder,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var scriptFilename = gameFolder.ListFiles()
            .Single(fi => fi.Filename.Equals("script.arc", StringComparison.OrdinalIgnoreCase),
            "'script.arc' not found.",
            "Multiple 'script.arc' found.");
        using var scriptArc = await gameFolder.OpenFile(scriptFilename.Filename, progress, ct)
            .Decode<ArcFile>();
        using var contents = await ((IFolder)scriptArc).GetContents(progress, ct);
        foreach (var filename in contents.Keys.ToArray())
        {
            try
            {
                using var luac = await contents[filename].Decode<LuacFile>();
                var lua = string.Format("""
hex_source = "{0}"
function hex_to_array(str)
  return (str:gsub('..', function (cc)
    return string.char(tonumber(cc, 16))
  end))
end
{1}(hex_to_array(hex_source))()
""",
                    Convert.ToHexString(luac.Stream.Span),
                    luac.LuaVersion == 0x51 ? "loadstring" : "load"
                );
                contents[filename] = new BinaryStream(lua);
            }
            catch (DecodeException) { }
        }
        using var newScriptArc = ArcFile.Create(contents);
        await gameFolder.WriteFile("script.arc", newScriptArc.Stream, progress, ct);
    }

    public static async Task<List<ChoiceInfo>> GetChoices(
        Directory gameFolder,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var choices = new List<ChoiceInfo>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var arc = await gameFolder.OpenFile(rioFilename, progress, ct)
                .Decode<ArcFile>();
            var ws2Filenames = arc.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".ws2", StringComparison.OrdinalIgnoreCase));
            foreach (var ws2Filename in ws2Filenames)
            {
                using var ws2 = await arc.OpenFile(ws2Filename, progress, ct)
                    .Decode<Ws2File>();
                var choiceOps = ws2.Ops
                    .Where(op => op.Code == Opcode.SHOW_CHOICE_0F)
                    .Select(op => new ChoiceInfo
                    {
                        Filename = ws2Filename,
                        Choices = op.Arguments[0].ChoiceArray,
                    });
                choices.AddRange(choiceOps);
            }
        }
        return choices;
    }
}
