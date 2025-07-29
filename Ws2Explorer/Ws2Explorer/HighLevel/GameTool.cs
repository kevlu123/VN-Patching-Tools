using System.Collections.Immutable;
using System.Linq;
using System.Text.RegularExpressions;
using Ws2Explorer.Compiler;
using Ws2Explorer.FileTypes;
using Directory = Ws2Explorer.FileTypes.Directory;

namespace Ws2Explorer.HighLevel;

/// <summary>
/// Utilities for game operations.
/// </summary>
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

    /// <summary>
    /// Finds the game folder given a hierarchy which is
    /// descended from the game folder.
    /// The game folder is found by looking for a file ending in ".exe"
    /// and another file ending in ".arc".
    /// The game folder must be a real directory.
    /// </summary>
    /// <param name="hierarchy"></param>
    /// <returns>The game folder or null if it is not found.</returns>
    public static Directory? FindGameFolder(IList<NamedFolder> hierarchy)
    {
        for (int i = hierarchy.Count - 1; i >= 0; i--)
        {
            if (hierarchy[i].Folder is Directory dir
                && dir.ListFiles().Any(f => f.Filename.EndsWith(".exe", StringComparison.InvariantCultureIgnoreCase))
                && dir.ListFiles().Any(f => f.Filename.EndsWith(".arc", StringComparison.InvariantCultureIgnoreCase)))
            {
                return dir;
            }
        }
        return null;
    }

    /// <summary>
    /// Finds all references to a string in the game's WS2/WSC scripts
    /// Only string arguments of instructions are searched.
    /// Only archives containing "rio" and ending with ".arc" are considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="str"></param>
    /// <param name="comparisonType"></param>
    /// <param name="matchWholeString"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>
    /// The script filenames that contain the string and
    /// the number of occurrences in that script.
    /// </returns>
    public static Task<Dictionary<string, int>> FindReferences(
        Directory gameFolder,
        string str,
        StringComparison comparisonType = StringComparison.InvariantCultureIgnoreCase,
        bool matchWholeString = false,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        return FindReferences(
            gameFolder,
            matchWholeString
                ? (s => s.Equals(str, comparisonType))
                : (s => s.Contains(str, comparisonType)),
            progress,
            ct);
    }

    /// <summary>
    /// Finds all references to a string in the game's WS2/WSC scripts
    /// Only string arguments of instructions are searched.
    /// Only archives containing "rio" and ending with ".arc" are considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="match"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>
    /// The script filenames that contain the string and
    /// the number of occurrences in that script.
    /// </returns>
    public static async Task<Dictionary<string, int>> FindReferences(
        Directory gameFolder,
        Func<string, bool> match,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var refs = new Dictionary<string, int>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var rio = await gameFolder.OpenFile(rioFilename, progress, ct)
                .DecodeWithHint(rioFilename);
            if (rio is not IArchive arc)
            {
                continue;
            }

            using var files = await arc.LoadAllFiles(progress, ct);
            foreach (var (name, file) in files)
            {
                ImmutableArray<Op> ops;
                if (file is Ws2File ws2)
                {
                    ops = ws2.Ops;
                }
                else if (file is WscFile wsc)
                {
                    ops = wsc.Ops;
                }
                else
                {
                    continue;
                }

                foreach (var op in ops)
                {
                    foreach (var arg in op.Arguments)
                    {
                        if ((arg.Value is string s && match(s)) ||
                            (arg.Value is AffixedString t && match(t.String)) ||
                            (arg.Value is ImmutableArray<WscChoice> cs && cs.Select(c => c.Text).Any(match)) ||
                            (arg.Value is ImmutableArray<Ws2Choice> ds && ds.Select(c => c.Text).Any(match)))
                        {
                            refs[name] = refs.GetValueOrDefault(name, 0) + 1;
                        }
                    }
                }
            }
        }
        return refs;
    }

    /// <summary>
    /// Sets the WS2 script entry point of the game.
    /// The first script loaded is always start.ws2.
    /// This operation will set the next file that start.ws2 jumps to.
    /// Only archives containing "rio" and ending with ".arc" are considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="setEntryPrompt">
    /// A function to get the new entry point to be set.
    /// This first parameter of this function is the current entry point.
    /// The second parameter is the list of available entry points.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task SetEntryPoint(
        Directory gameFolder,
        Func<string, IEnumerable<string>, string> setEntryPrompt,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var rioFiles = new DisposingList<NamedFolder>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var file = await gameFolder.OpenFile(rioFilename, progress, ct)
                .DecodeWithHint(rioFilename);
            if (file is not IArchive arc)
            {
                continue;
            }
            arc.Stream.IncRef();
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
            op => op.Code == Opcode.WS2_JUMP_FILE_07,
            "JumpFile op not found.",
            "Multiple JumpFile ops found.");
        var currentEntry = entryOp.Arguments[0].String;

        var options = rioFiles
            .SelectMany(rio => rio.Folder.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".ws2")))
            .Select(f => f[..^4].ToUpperInvariant())
            .ToArray();

        var newEntry = setEntryPrompt(currentEntry, options);
        if (newEntry == currentEntry)
        {
            return;
        }

        ops[ops.FindIndex(op => op.Code == Opcode.WS2_JUMP_FILE_07)] = new Op
        {
            Code = Opcode.WS2_JUMP_FILE_07,
            Arguments = [Argument.NewString(newEntry)],
        };
        using var newWs2 = ScriptCompiler.Compile(ops);
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

    /// <summary>
    /// Converts all compiled lua scripts to text form.
    /// This is done by storing the file as a byte array in lua
    /// and calling load on it. This does not decompile the script.
    /// Only the archive called "script.arc" is considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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
        using var contents = await scriptArc.LoadAllStreams(progress, ct);
        foreach (var filename in contents.Keys.ToArray())
        {
            try
            {
                using var luac = await contents[filename].Decode<LuacFile>(decRef: false);
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

    /// <summary>
    /// Gets all choices in the game from the WS2/WSC scripts.
    /// Only archives containing "rio" and ending with ".arc" are considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>A list of choice group information.</returns>
    public static async Task<List<ChoiceInfo>> GetChoices(
        Directory gameFolder,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var choices = new List<ChoiceInfo>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var file = await gameFolder.OpenFile(rioFilename, progress, ct)
                .DecodeWithHint(rioFilename);
            if (file is not IArchive arc)
            {
                continue;
            }

            var ws2Filenames = arc.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".ws2", StringComparison.OrdinalIgnoreCase));
            foreach (var ws2Filename in ws2Filenames)
            {
                try
                {
                    using var ws2 = await arc.OpenFile(ws2Filename, progress, ct)
                        .Decode<Ws2File>();
                    var choiceOps = ws2.Ops
                        .Where(op => op.Code == Opcode.WS2_SHOW_CHOICE_0F)
                        .Select(op => new ChoiceInfo {
                            Filename = ws2Filename,
                            Ws2Choices = op.Arguments[0].Ws2ChoiceArray,
                            WscChoices = [],
                        });
                    choices.AddRange(choiceOps);
                }
                catch (DecodeException) { }
            }

            var wscFilenames = arc.ListFiles()
                .Select(fi => fi.Filename)
                .Where(f => f.EndsWith(".wsc", StringComparison.OrdinalIgnoreCase));
            foreach (var wscFilename in wscFilenames)
            {
                try
                {
                    using var wsc = await arc.OpenFile(wscFilename, progress, ct)
                        .Decode<WscFile>();
                    var choiceOps = wsc.Ops
                        .Where(op => op.Code == Opcode.WSC_SHOW_CHOICE_02)
                        .Select(op => new ChoiceInfo
                        {
                            Filename = wscFilename,
                            Ws2Choices = [],
                            WscChoices = op.Arguments[0].WscChoiceArray,
                        });
                    choices.AddRange(choiceOps);
                }
                catch (DecodeException) { }
            }
        }
        return choices;
    }

    /// <summary>
    /// Gets the flow of the game's WS2/WSC scripts.
    /// Not necessarily all the paths will be reachable and
    /// sometimes the scripts will reference non-existent scripts.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>
    /// A map of where a script leads.
    /// The dictionary value is the list of scripts that the script leads to
    /// in order of appearance and may contain duplicates.
    /// </returns>
    public static async Task<Dictionary<string, List<string>>> GetFlowchart(
        Directory gameFolder,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var graph = new Dictionary<string, List<string>>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var file = await gameFolder.OpenFile(rioFilename, progress, ct)
                .DecodeWithHint(rioFilename);
            if (file is not IArchive arc)
            {
                continue;
            }
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

    /// <summary>
    /// Gets the flow of the WS2/WSC scripts in an <see cref="ArcFile"/>/<see cref="LegacyArc8File"/>/<see cref="LegacyArc12File"/>.
    /// Not necessarily all the paths will be reachable and
    /// sometimes the scripts will reference non-existent scripts.
    /// </summary>
    /// <param name="arc"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>
    /// A map of where a script leads.
    /// The dictionary value is the list of scripts that the script leads to
    /// in order of appearance and may contain duplicates.
    /// </returns>
    public static async Task<Dictionary<string, List<string>>> GetFlowchart(
        IArchive arc,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var graph = new Dictionary<string, List<string>>(StringComparer.InvariantCultureIgnoreCase);

        var ws2Filenames = arc.ListFiles()
            .Select(fi => fi.Filename)
            .Where(f => f.EndsWith(".ws2", StringComparison.OrdinalIgnoreCase));
        foreach (var ws2Filename in ws2Filenames)
        {
            var nameNoExt = ws2Filename[..^4].ToLowerInvariant();
            if (!graph.TryGetValue(nameNoExt, out var value))
            {
                value = [];
                graph[nameNoExt] = value;
            }

            try
            {
                using var ws2 = await arc.OpenFile(ws2Filename, progress, ct)
                    .Decode<Ws2File>();
                var jumpOps = ws2.Ops
                    .Where(op => op.Code == Opcode.WS2_JUMP_FILE_07)
                    .Select(op => op.Arguments[0].String.ToLowerInvariant());
                var choiceOps = ws2.Ops
                    .Where(op => op.Code == Opcode.WS2_SHOW_CHOICE_0F)
                    .SelectMany(op => op.Arguments[0].Ws2ChoiceArray
                        .Where(j => j.JumpOp.Code == Opcode.WS2_JUMP_FILE_07)
                        .Select(j => j.JumpOp.Arguments[0].String.ToLowerInvariant()));
                value.AddRange(jumpOps);
                value.AddRange(choiceOps);
            }
            catch (DecodeException) { }
        }

        var wscFilenames = arc.ListFiles()
            .Select(fi => fi.Filename)
            .Where(f => f.EndsWith(".wsc", StringComparison.OrdinalIgnoreCase));
        foreach (var wscFilename in wscFilenames)
        {
            var nameNoExt = wscFilename[..^4].ToLowerInvariant();
            if (!graph.TryGetValue(nameNoExt, out var value))
            {
                value = [];
                graph[nameNoExt] = value;
            }

            try
            {
                using var wsc = await arc.OpenFile(wscFilename, progress, ct)
                    .Decode<WscFile>();
                var jumpOps = wsc.Ops
                    .Where(op => op.Code == Opcode.WSC_JUMP_FILE_07)
                    .Select(op => op.Arguments[0].String.ToLowerInvariant());
                var choiceOps = wsc.Ops
                    .Where(op => op.Code == Opcode.WSC_SHOW_CHOICE_02)
                    .SelectMany(op => op.Arguments[0].WscChoiceArray
                        .Where(j => j.JumpOp.Code == Opcode.WSC_JUMP_FILE_07)
                        .Select(j => j.JumpOp.Arguments[0].String.ToLowerInvariant()));
                value.AddRange(jumpOps);
                value.AddRange(choiceOps);
            }
            catch (DecodeException) { }
        }
        return graph;
    }

    /// <summary>
    /// Modifies the character names in the game's WS2/WSC files.
    /// Only archives containing "rio" and ending with ".arc" are considered.
    /// </summary>
    /// <param name="gameFolder"></param>
    /// <param name="modifyNamesPrompt">
    /// A function to get the name change mapping. Names that do not appear
    /// in the mapping will not be changed.
    /// The parameter is the list of names that currently exist in the game.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task ModifyNames(
        Directory gameFolder,
        Func<IEnumerable<string>, Dictionary<string, string>> modifyNamesPrompt,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var rioArcs = new DisposingDictionary<string, IFolder>();
        foreach (var rioFilename in GetRioFilenames(gameFolder))
        {
            using var file = await gameFolder.OpenFile(rioFilename, progress, ct)
                .DecodeWithHint(rioFilename);
            if (file is not IArchive arc)
            {
                continue;
            }
            arc.Stream.IncRef();
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
                        .Where(op => op.Code == Opcode.WS2_DISPLAY_NAME_15)
                        .Select(op => op.Arguments[0].AffixedString.String));
                }
                else if (child is WscFile wsc)
                {
                    names.UnionWith(wsc.Ops
                        .Where(op => op.Code == Opcode.WSC_DISPLAY_TEXT_AND_NAME_42)
                        .Select(op => op.Arguments[3].AffixedString.String));
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

        foreach (var (rioArc, (arcName, children)) in rioArcs.Zip(arcChildren))
        {
            using var streams = new DisposingDictionary<string, BinaryStream>();
            foreach (var (childName, child) in children)
            {
                if (child is Ws2File ws2)
                {
                    var newOps = new List<Op>();
                    foreach (var op in ws2.Ops)
                    {
                        if (op.Code == Opcode.WS2_DISPLAY_NAME_15)
                        {
                            var oldNameString = op.Arguments[0].AffixedString;
                            var oldName = oldNameString.String;
                            var newName = nameMapping.GetValueOrDefault(oldName, oldName);
                            var newOp = op.WithArgument(
                                0,
                                Argument.NewAffixedString(oldNameString.WithString(newName)));
                            newOps.Add(newOp);
                        }
                        else
                        {
                            newOps.Add(op);
                        }
                    }
                    streams.Add(childName, ScriptCompiler.Compile(newOps));
                }
                else if (child is WscFile wsc)
                {
                    var newOps = new List<Op>();
                    foreach (var op in wsc.Ops)
                    {
                        if (op.Code == Opcode.WSC_DISPLAY_TEXT_AND_NAME_42)
                        {
                            var oldNameString = op.Arguments[3].AffixedString;
                            var oldName = oldNameString.String;
                            var newName = nameMapping.GetValueOrDefault(oldName, oldName);
                            var newOp = op.WithArgument(
                                3,
                                Argument.NewAffixedString(oldNameString.WithString(newName)));
                            newOps.Add(newOp);
                        }
                        else
                        {
                            newOps.Add(op);
                        }
                    }
                    streams.Add(childName, ScriptCompiler.Compile(newOps));
                }
                else
                {
                    streams.Add(childName, child.Stream);
                }

            }
            using var newArc = ((IArchive)rioArc.Value).Create(streams);
            await gameFolder.WriteFile(arcName, newArc.Stream, progress, ct);
        }
    }
}
