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
        Func<string, IEnumerable<string>, string> setEntryPrompt,
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

        var newEntry = setEntryPrompt(currentEntry, options);
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
        using var contents = await ((IFolder)scriptArc).LoadAllStreams(progress, ct);
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

    public static async Task<Dictionary<string, List<string>>> GetFlowchart(
        Directory gameFolder,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var graph = new Dictionary<string, List<string>>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var arc = await gameFolder.OpenFile(rioFilename, progress, ct)
                .Decode<ArcFile>();
            foreach (var (src, dsts) in await GetFlowchart(arc, progress, ct))
            {
                if (!graph.TryGetValue(src, out var value))
                {
                    value = [];
                    graph[src] = value;
                }
                value.AddRange(dsts);
            }
        }
        return graph;
    }

    public static async Task<Dictionary<string, List<string>>> GetFlowchart(
        ArcFile arc,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var graph = new Dictionary<string, List<string>>(StringComparer.InvariantCultureIgnoreCase);
        var ws2Filenames = arc.ListFiles()
            .Select(fi => fi.Filename)
            .Where(f => f.EndsWith(".ws2", StringComparison.OrdinalIgnoreCase));
        foreach (var ws2Filename in ws2Filenames)
        {
            var nameNoExt = ws2Filename[..^4];
            if (!graph.TryGetValue(nameNoExt, out var value))
            {
                value = [];
                graph[nameNoExt] = value;
            }

            using var ws2 = await arc.OpenFile(ws2Filename, progress, ct)
                .Decode<Ws2File>();
            var jumpOps = ws2.Ops
                .Where(op => op.Code == Opcode.JUMP_FILE_07)
                .Select(op => op.Arguments[0].String.ToLowerInvariant());
            var choiceOps = ws2.Ops
                .Where(op => op.Code == Opcode.SHOW_CHOICE_0F)
                .SelectMany(op => op.Arguments[0].ChoiceArray
                    .Where(j => j.JumpOp.Code == Opcode.JUMP_FILE_07)
                    .Select(j => j.JumpOp.Arguments[0].String.ToLowerInvariant()));
            value.AddRange(jumpOps);
            value.AddRange(choiceOps);
        }
        return graph;
    }

    public static async Task ModifyNames(
        Directory gameFolder,
        Func<IEnumerable<string>, Dictionary<string, string>> modifyNamesPrompt,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var rioArcs = new DisposingDictionary<string, IFolder>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            var arc = await gameFolder.OpenFile(rioFilename, progress, ct)
                .Decode<ArcFile>();
            rioArcs.Add(rioFilename, arc);
        }

        using var arcChildren = new DisposingDictionary<string, DisposingDictionary<string, IFile>>();
        foreach (var (name, rioArc) in rioArcs)
        {
            arcChildren.Add(name, await rioArc.LoadAllFiles(progress, ct));
        }

        var names = new HashSet<string>();
        foreach (var children in arcChildren.Values)
        {
            foreach (var child in children.Values)
            {
                if (child is Ws2File ws2)
                {
                    names.UnionWith(ws2.Ops
                        .Where(op => op.Code == Opcode.DISPLAY_NAME_15)
                        .Select(op => op.Arguments[0].NameString.String));
                }
            }
        }
        names.Remove(string.Empty);

        var nameMapping = modifyNamesPrompt(names)
            .Where(kv => kv.Key != kv.Value)
            .ToDictionary(kv => kv.Key, kv => kv.Value);
        if (nameMapping.Count == 0)
        {
            return;
        }
        else if (nameMapping.ContainsValue(string.Empty))
        {
            throw new Exception("Cannot map names to empty strings.");
        }

        foreach (var (arcName, children) in arcChildren)
        {
            using var streams = new DisposingDictionary<string, BinaryStream>();
            foreach (var (childName, child) in children)
            {
                if (child is not Ws2File ws2)
                {
                    streams.Add(childName, child.Stream);
                    continue;
                }

                var newOps = new List<Op>();
                foreach (var op in ws2.Ops)
                {
                    if (op.Code == Opcode.DISPLAY_NAME_15)
                    {
                        var oldNameString = op.Arguments[0].NameString;
                        var oldName = oldNameString.String;
                        var newName = nameMapping.GetValueOrDefault(oldName, oldName);
                        var newOp = op.WithArgument(
                            0,
                            Argument.NewNameString(oldNameString.WithString(newName)));
                        newOps.Add(newOp);
                    }
                    else
                    {
                        newOps.Add(op);
                    }
                }
                streams.Add(childName, Ws2Compiler.Compile(newOps));
            }
            using var newArc = ArcFile.Create(streams);
            await gameFolder.WriteFile(arcName, newArc.Stream, progress, ct);
        }
    }
}
