using System.Collections;
using System.Reflection;
using Ws2Explorer;
using Ws2Explorer.Compiler;
using Ws2Explorer.HighLevel;
using Ws2Explorer.FileTypes;
using Files = Ws2Explorer.DisposingDictionary<string, Ws2Explorer.IFile>;

/*
 * Add a suffix to a filename before the extension
 * assuming the extension is 3 characters long.
 */
static string AddSuffix(string name, string suffix)
{
    return name[..^4] + suffix + name[^4..];
}

/*
 * Get a map of CGs to their flags from a single WS2 file.
 */
static Dictionary<Cg, ushort> GetWs2CgFlags(Ws2File ws2)
{
    var flags = new Dictionary<Cg, ushort>();
    ushort lastFlag = 0;
    var lastPnaIndices = new List<ushort>();
    foreach (var op in ws2.Ops)
    {
        switch (op.Code)
        {
            case Opcode.CONDITIONAL_JUMP_01:
                lastFlag = op.Arguments[1].UInt16;
                break;
            case Opcode.CALL_LUA_1C:
                var fn = op.Arguments[0].String;
                if (fn == "InitPnaCgBrowser")
                {
                    var index = op.Arguments[2].UInt16;
                    if (index == 0xFFFF)
                    {
                        lastPnaIndices.Clear();
                    }
                    else
                    {
                        lastPnaIndices.Add(index);
                    }
                }
                else if (fn == "openCgBrowser")
                {
                    var cgName = op.Arguments[1].String;
                    var cg = new Cg(cgName, lastPnaIndices);
                    Console.WriteLine($"Found flag {lastFlag} for cg {cg}.");
                    flags[cg] = lastFlag;
                }
                break;
        }
    }
    return flags;
}

/*
 * Get a map of CGs to their flags from an archive of WS2 files.
 */
static Dictionary<Cg, ushort> GetRioCgFlags(Files rio)
{
    return rio
        .Where(kvp => kvp.Key.StartsWith("CG_PAGE"))
        .Select(kvp => (Ws2File)kvp.Value)
        .SelectMany(ws2 => GetWs2CgFlags(ws2))
        .ToDictionary();
}

/*
 * Update the flags of a single WS2 file given a mapping and return the new WS2 file.
 */
static Ws2File UpdateWs2CgFlags(Ws2File ws2, Dictionary<ushort, ushort> flagConversions)
{
    var ops = new List<Op>();
    foreach (var op in ws2.Ops)
    {
        ushort newFlag;
        switch (op.Code)
        {
            case Opcode.CONDITIONAL_JUMP_01:
                if (flagConversions.TryGetValue(op.Arguments[1].UInt16, out newFlag))
                {
                    ops.Add(op.WithArgument(1, Argument.NewUInt16(newFlag)));
                    continue;
                }
                break;
            case Opcode.SET_FLAG_0B:
                if (flagConversions.TryGetValue(op.Arguments[0].UInt16, out newFlag))
                {
                    ops.Add(op.WithArgument(0, Argument.NewUInt16(newFlag)));
                    continue;
                }
                break;
        }
        ops.Add(op);
    }
    return new Ws2File(ops);
}

/*
 * Get the flag mapping that needs to be applied to the EN WS2 files to match the JP WS2 files.
 * Also return the CG flag mapping for later reuse.
 */
static Dictionary<ushort, ushort> GetFlagConversions(Files enRio, Files jpRio, out Dictionary<Cg, ushort> cgFlags)
{
    Console.WriteLine("Getting EN CG flags...");
    var enFlags = GetRioCgFlags(enRio);
    Console.WriteLine("Getting JP CG flags...");
    var jpFlags = GetRioCgFlags(jpRio);
    var flagConversions = new Dictionary<ushort, ushort>();
    foreach (var (cg, enFlag) in enFlags)
    {
        if (IsSpecial(cg.PnaName))
        {
            continue;
        }
        if (jpFlags.TryGetValue(cg, out var jpFlag))
        {
            flagConversions[enFlag] = jpFlag;
        }
        else
        {
            // This CG is EN only (occurs for COM_04S.PNA, SAY_15S.PNA, and ORI_11S.PNA).
            // If this is ever encountered, give the effect of unlocking the first common route CG
            // which would have been unlocked long ago anyway. This creates an effective noop.
            flagConversions[enFlag] = 1250;
            Console.WriteLine($"Found EN only flag {cg}.");
        }
    }

    static bool IsSpecial(string pnaName)
    {
        return FileList.SPECIAL_PNA_FILES.Any(x => x.Equals(pnaName, StringComparison.InvariantCultureIgnoreCase));
    }

    // Hack for special CGs
    var specialCgs = enFlags.Where(kvp => IsSpecial(kvp.Key.PnaName));
    var jpFlagsList = jpFlags.ToList();
    int part1 = jpFlagsList.FindIndex(kvp => IsSpecial(kvp.Key.PnaName));
    int part2 = jpFlagsList.FindIndex(part1, kvp => !IsSpecial(kvp.Key.PnaName));
    var cgFlagsList = jpFlagsList[..part1];
    cgFlagsList.AddRange(specialCgs);
    cgFlagsList.AddRange(jpFlagsList[part2..]);
    cgFlags = cgFlagsList.ToDictionary();

    return flagConversions;
}

/*
 * Update the flags of the EN Rio.arc to match the JP Rio.arc.
 * Also return the CG flag mapping for later reuse.
 */
static void UpdateRioFlags(Files rio, Files jpRio, out Dictionary<Cg, ushort> cgFlags)
{
    var flagConversions = GetFlagConversions(rio, jpRio, out cgFlags);
    foreach (var (name, file) in rio.ToList())
    {
        if (file is Ws2File ws2)
        {
            rio[name] = UpdateWs2CgFlags(ws2, flagConversions);
        }
    }
}

/*
 * Add the JP WS2 files to the EN Rio.arc and patch
 * them to use different PNA files where necessary.
 */
static void UpdateWithJpScripts(Files rio, Files jpRio)
{
    foreach (var (name, file) in jpRio)
    {
        if (FileList.JP_WS2_FILES.Contains(name.ToLowerInvariant()))
        {
            var ops = new List<Op>();
            foreach (var op in ((Ws2File)file).Ops)
            {
                if (op.Code == Opcode.LOAD_PNA_34)
                {
                    var pnaName = op.Arguments[1].String;
                    if (FileList.JP_INCOMPATIBLE_PNA_FILES.Contains(pnaName.ToLowerInvariant()))
                    {
                        var newPnaName = AddSuffix(pnaName, "_JP");
                        ops.Add(op.WithArgument(1, Argument.NewString(newPnaName)));
                        continue;
                    }
                }
                ops.Add(op);
            }
            rio[AddSuffix(name, "_E")] = new Ws2File(ops);
        }
    }
}

/*
 * Update the flow of the EN Rio.arc to match the JP Rio.arc.
 */
static void UpdateGraph(Files rio, Files jpRio)
{
    using var jpRioArc = ArcFile.Create(jpRio.ToDictionary(
        kvp => kvp.Key,
        kvp => kvp.Value.Stream));
    var graph = GameTool.GetFlowchart(jpRioArc, Progress.I).Result
        .ToDictionary(
            kvp => kvp.Key + "_E",
            kvp => kvp.Value.ConvertAll(v => v.StartsWith("yozora") ? v + "_E" : v));

    foreach (var (name, file) in rio.ToList())
    {
        if (!name.StartsWith("yozora") || file is not Ws2File ws2)
        {
            rio[name] = file;
            continue;
        }

        var nextFiles = graph[name[..^4]];
        int i = 0;
        var ops = new List<Op>();
        foreach (var op in ws2.Ops)
        {
            if (op.Code == Opcode.JUMP_FILE_07)
            {
                var oldNextFile = op.Arguments[0].String;
                var newNextFile = nextFiles[i++];
                if (oldNextFile.StartsWith("YOZORA") && oldNextFile != newNextFile)
                {
                    ops.Add(op.WithArgument(0, Argument.NewString(newNextFile)));
                    continue;
                }
            }
            ops.Add(op);
        }
        rio[name] = new Ws2File(ops);
    }
}

/*
 * Generate a new CG_PAGE.ws2 to show the CGs given by the flags parameter.
 * Also update the jump targets of REPLAY_EXE.ws2 to end in '_E'.
 * e.g. YOZORA_HIKA_103D_H -> YOZORA_HIKA_103D_H_E.
 */
static void UpdateCGAndSceneScript(Files rio, Dictionary<Cg, ushort> flags)
{
    static Op CreateLabelOp(int label)
    {
        return new Op
        {
            Code = Opcode.LABEL,
            Arguments = [
                Argument.NewLabel(label),
            ],
        };
    }

    static Op CreateJumpOp(int label)
    {
        return new Op
        {
            Code = Opcode.JUMP_06,
            Arguments = [
                Argument.NewLabel(label),
            ],
        };
    }

    static Op CreateCondJumpOp(byte mode, ushort flag, float value, int label)
    {
        return new Op
        {
            Code = Opcode.CONDITIONAL_JUMP_01,
            Arguments = [
                Argument.NewUInt8(mode),
                Argument.NewUInt16(flag),
                Argument.NewFloat32(value),
                Argument.NewLabel(0),
                Argument.NewLabel(label),
            ],
        };
    }

    static Op CreateExecLuaOp(string func, string a, ushort b, byte n)
    {
        return new Op
        {
            Code = Opcode.CALL_LUA_1C,
            Arguments = [
                Argument.NewString(func),
                Argument.NewString(a),
                Argument.NewUInt16(b),
                Argument.NewUInt8(n),
            ],
        };
    }

    // Update the REPLAY_EXE.ws2 file
    {
        var scene = (Ws2File)rio["REPLAY_EXE.ws2"];
        var ops = new List<Op>();
        foreach (var op in scene.Ops)
        {
            if (op.Code == Opcode.JUMP_FILE_07)
            {
                var nextFile = op.Arguments[0].String;
                if (nextFile.EndsWith("_H"))
                {
                    ops.Add(op.WithArgument(0, Argument.NewString(nextFile + "_E")));
                    continue;
                }
            }
            ops.Add(op);
        }
        rio["REPLAY_EXE.ws2"] = new Ws2File(ops);
    }
    Console.WriteLine("Updated REPLAY_EXE.ws2.");

    // Generate the CG_PAGE.ws2 file
    {
        var cgPage = rio["CG_PAGE.ws2"];
        var ops = new List<Op>
        {
            new() {
                Code = Opcode.VERSION,
                Arguments = [
                    Argument.NewString("V3"),
                ],
            }
        };
        int label = 1;
        int cgIndex = 1;
        const int END = 9999999;
        foreach (var variant in flags.GroupBy(f => f.Key.PnaName)) // TODO: currently assumes Dictionary order
        {
            foreach (var (cg, flag) in variant)
            {
                // Check CG index
                ops.Add(CreateCondJumpOp(130, 105, cgIndex, label));

                // Check CG variant
                ops.Add(CreateCondJumpOp(2, flag, 1, label));

                // Prepare PNA indices
                ops.Add(CreateExecLuaOp("InitPnaCgBrowser", "", 0xFFFF, 1));
                foreach (var pnaIndex in cg.PnaIndices)
                {
                    ops.Add(CreateExecLuaOp("InitPnaCgBrowser", "", pnaIndex, 1));
                }

                // Show CG
                ops.Add(CreateExecLuaOp("openCgBrowser", cg.PnaName, 0, 0));

                // Check right clicked
                ops.Add(CreateCondJumpOp(130, 99, -1, label));
                ops.Add(CreateJumpOp(END));

                // Add end of section
                ops.Add(CreateLabelOp(label++));
            }
            cgIndex++;
        }
        // Add end of script
        ops.Add(CreateLabelOp(END));
        ops.Add(new Op { Code = 0x05 });
        ops.Add(new Op { Code = Opcode.FILE_END_FF });
        ops.Add(new Op {
            Code = Opcode.EPILOGUE,
            Arguments = [
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
                Argument.NewUInt8(0),
            ],
        });
        rio["CG_PAGE.ws2"] = new Ws2File(ops);
    }
    Console.WriteLine("Generated CG_PAGE.ws2.");
}

/*
 * Construct Script.arc. The requirements are different depending on DiffMode.
 */
static ArcFile BuildLua(string exePath, DiffMode mode)
{
    using var streams = new DisposingDictionary<string, BinaryStream>();
    var baseLuaFile = mode == DiffMode.Full ? "GameInfo.lua" : "VariableSize.lua";
    streams[baseLuaFile] = FileTool.ReadFile(Path.Combine(exePath, "Assets", "Base.lua")).Result;
    streams["ArcFileName.lua"] = FileTool.ReadFile(Path.Combine(exePath, "Assets", "Patch.lua")).Result;
    foreach (var name in FileList.LUA_FILES)
    {
        if (name.EndsWith(".inc"))
        {
            streams[name] = new BinaryStream("""
                include "ArcFileName"
                include "LegacyGame_utf8"
                include "menu_base"
                include "menu_config"
                include "menu_gallery"
                include "ui_button"
                include "ui_button"
                include "ui_GaugeBar"
                include "ui_language"
                include "ui_scrollbar"
                """);
        }
        else if (!streams.ContainsKey(name))
        {
            streams[name] = new BinaryStream($"-- This code has been moved to {baseLuaFile}.");
        }
    }
    return ArcFile.Create(streams);
}

/*
 * If mode is DiffMode.Diff, create an archive containing files that are
 * new or (have changed and the JP version is preferred) in the JP archive.
 * 
 * If mode is DiffMode.Full, create an archive as with DiffMode.Diff but
 * additionally include files that exist in the EN archive where the JP
 * version is not preferred.
 * 
 * Filenames are adjusted if there are incompatibilities between the EN and JP
 * version by appending "_JP" to the filename.
 * 
 * There are some special cases listed in FileList.SPECIAL_PNA_FILES.
 */
static ArcFile DiffAssets(ArcFile enArc, ArcFile jpArc, DiffMode mode)
{
    using var added = FileTool.Diff(enArc, jpArc, DiffPartitionMode.New, Progress.I).Result;
    using var changed = FileTool.Diff(enArc, jpArc, DiffPartitionMode.Changed, Progress.I).Result;
    var incompat = changed.Keys
        .Where(f => FileList.JP_INCOMPATIBLE_PNA_FILES.Contains(f.ToLowerInvariant()))
        .ToDictionary(f => f, f => changed[f]);
    var remove = changed.Keys
        .Where(f => !FileList.JP_PREFERRED_PNA_FILES.Contains(f.ToLowerInvariant()))
        .ToList();
    foreach (var f in remove)
    {
        changed.Remove(f);
    }

    var diff = added.Concat(changed).ToDictionary();
    foreach (var f in incompat)
    {
        diff[AddSuffix(f.Key, "_JP")] = f.Value;
    }

    if (mode == DiffMode.Full)
    {
        using var enFiles = enArc.LoadAllFiles(Progress.I).Result;
        foreach (var (name, file) in enFiles)
        {
            if (!FileList.JP_PREFERRED_PNA_FILES.Contains(name.ToLowerInvariant()))
            {
                file.Stream.IncRef();
                diff[name] = file.Stream;
            }
        }
    }

    // Special case where we patch the EN PNA file with an
    // image from the JP PNA file but we don't want to just
    // use the whole JP PNA file because it has an incompatible layout.
    foreach (var f in FileList.SPECIAL_PNA_FILES)
    {
        if (diff.TryGetValue(AddSuffix(f, "_JP"), out var stream))
        {
            var mappings = new List<(int jp, int en)>
            {
                (1, 13),
                (2, 14),
                (3, 15),
                (4, 16),
                (5, 17),
                (6, 18),
                (7, 19),
                (8, 20),
                (9, 21),
                (10, 22),
                (11, 23),
                (12, 24),
                (27, 40),
            };
            var jpPna = stream.Decode<PnaFile>(decRef: false).Result;
            var enPna = enArc.OpenFile(f, Progress.I).Result
                .Decode<PnaFile>().Result;
            using var files = enPna.LoadAllStreams().Result;
            foreach (var (jp, en) in mappings)
            {
                files[$"img{en}.png"] = jpPna.OpenFile($"img{jp}.png").Result;
            }
            using var newPna = PnaFile.Create(files);
            newPna.Stream.IncRef();
            diff[f] = newPna.Stream;
        }
    }

    return ArcFile.Create(diff);
}

static void MyMain(string[] args)
{
    var exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)!;
    var enGamePath = args[0];
    var jpGamePath = args[1];
    var outputPath = args[2];
    var mode = DiffMode.Full;
    if (args.Length > 3)
    {
        mode = args[3] switch
        {
            "full" => DiffMode.Full,
            "diff" => DiffMode.Diff,
            _ => throw new ArgumentException("Invalid diff mode"),
        };
    }

    System.IO.Directory.CreateDirectory(outputPath);
    Console.WriteLine($"Created directory {outputPath}.");
    var gameDir = new Ws2Explorer.FileTypes.Directory(outputPath);

    void WriteArc(ArcFile arc, string name)
    {
        if (arc.Header.FileCount > 0)
        {
            FileTool.WriteFile(
                Path.Combine(outputPath, name),
                arc.Stream,
                OverwriteMode.Overwrite,
                Progress.I).Wait();
        }
    }

    void WriteStream(BinaryStream stream, string name)
    {
        FileTool.WriteFile(
            Path.Combine(outputPath, name),
            stream,
            OverwriteMode.Overwrite,
            Progress.I).Wait();
    }

    ArcFile OpenArc(string folder, string name)
    {
        return gameDir
            .OpenFile(Path.Combine(folder, name), Progress.I).Result
            .Decode<ArcFile>().Result;
    }

    Files OpenFiles(string folder, string name)
    {
        using var arc = OpenArc(folder, name);
        return arc.LoadAllFiles(Progress.I).Result;
    }

    Console.WriteLine("Processing Script.arc...");
    using (var luaArc = BuildLua(exePath, mode))
    {
        WriteArc(luaArc, "Script.arc");
    }

    Console.WriteLine("Copying SysGraphic...");
    var sysGraphicPath = Path.Combine(exePath, "Assets", "SysGraphic.arc");
    using (var sysGraphicArc = FileTool.ReadFile(sysGraphicPath, Progress.I).Result)
    {
        WriteStream(sysGraphicArc, "SysGraphic.arc");
    }

    if (mode == DiffMode.Diff)
    {
        Console.WriteLine("Copying AdvHDLang.dll...");
        var langPackDllPath = Path.Combine(enGamePath, "AdvHDLang.dll");
        using var langPackDll = FileTool.ReadFile(langPackDllPath, Progress.I).Result;
        WriteStream(langPackDll, "AdvHDLang.dll");
    }

    Console.WriteLine("Processing Rio.arc...");
    using (var rio = OpenFiles(enGamePath, "Rio.arc"))
    using (var jpRio = OpenFiles(jpGamePath, "Rio.arc"))
    {
        Console.WriteLine("Updating flags...");
        UpdateRioFlags(rio, jpRio, out var cgFlags);
        Console.WriteLine("Adding JP scripts...");
        UpdateWithJpScripts(rio, jpRio);
        Console.WriteLine("Updating graph...");
        UpdateGraph(rio, jpRio);
        Console.WriteLine("Regenerating CG and scene scripts...");
        UpdateCGAndSceneScript(rio, cgFlags);
        using var rioArc = ArcFile.Create(rio.ToDictionary(
            kvp => kvp.Key,
            kvp => kvp.Value.Stream));
        WriteArc(rioArc, "Rio.arc");
    }

    foreach (var name in FileList.ASSET_FILES)
    {
        Console.WriteLine($"Processing {name}...");
        using var enArc = OpenArc(enGamePath, name);
        using var jpArc = OpenArc(jpGamePath, name);
        using var diff = DiffAssets(enArc, jpArc, mode);
        WriteArc(diff, name);
    }
}

var watch = System.Diagnostics.Stopwatch.StartNew();
try
{
    MyMain(args);
}
catch (Exception e)
{
    Console.WriteLine(e.ToString());
}
finally
{
    watch.Stop();
    Console.WriteLine($"Completed in {watch.ElapsedMilliseconds / 1000}s.");
}

enum DiffMode
{
    Full,
    Diff,
}

class Cg
{
    public string PnaName { get; init; }
    public ushort[] PnaIndices { get; init; }

    public Cg(string pnaName, IEnumerable<ushort> pnaIndices)
    {
        PnaName = pnaName;
        PnaIndices = pnaIndices.ToArray();
    }

    public static bool operator ==(Cg a, Cg b)
    {
        return a.PnaName == b.PnaName && a.PnaIndices.SequenceEqual(b.PnaIndices);
    }

    public static bool operator !=(Cg a, Cg b)
    {
        return !(a == b);
    }

    public override bool Equals(object? obj)
    {
        return obj is Cg cg && this == cg;
    }

    public override int GetHashCode()
    {
        return ((IStructuralEquatable)PnaIndices).GetHashCode(EqualityComparer<ushort>.Default)
            ^ PnaName.GetHashCode();
    }

    public override string ToString()
    {
        return $"{PnaName}({string.Join(",", PnaIndices)})";
    }
}

static class Progress
{
    public static readonly Progress<TaskProgressInfo> I = new(PrintProgress);

    private static void PrintProgress(TaskProgressInfo ti)
    {
        Console.WriteLine($"{ti.Description}: {ti.Value:P0}");
    }
}
