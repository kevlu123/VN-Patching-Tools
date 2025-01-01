using System.Collections;
using Ws2Explorer;
using Ws2Explorer.Compiler;
using Ws2Explorer.Compiler.Opcodes;

const byte COND_JUMP_OP = 0x01;
const byte JUMP_OP = 0x06;
const byte NEXT_FILE_OP = 0x07;
const byte SET_FLAG_OP = 0x0B;
const byte EXEC_LUA_OP = 0x1C;

static T GetArg<T>(IOpcode op, int index) {
    return (T)((GenericOpcode)op).Arguments[index];
}

/*
 * Get a map of CGs to their flags from a single WS2 file.
 */
static Dictionary<Cg, ushort> GetWs2CgFlags(Ws2File ws2, string logLabel) {
    var flags = new Dictionary<Cg, ushort>();
    ushort lastFlag = 0;
    List<ushort> lastPnaIndices = new();
    foreach (var op in ws2.Opcodes) {
        byte opcodeNumber;
        try {
            opcodeNumber = op.OpcodeNumber;
        } catch (InvalidOperationException) {
            continue;
        }

        if (opcodeNumber == COND_JUMP_OP) {
            lastFlag = GetArg<ushort>(op, 1);
        } else if (opcodeNumber == EXEC_LUA_OP) {
            if (GetArg<string>(op, 0) == "InitPnaCgBrowser") {
                var index = GetArg<ushort>(op, 2);
                if (index == 0xFFFF) {
                    lastPnaIndices.Clear();
                } else {
                    lastPnaIndices.Add(index);
                }
            } else if (GetArg<string>(op, 0) == "openCgBrowser") {
                var cgName = GetArg<string>(op, 1);
                var cg = new Cg(cgName, lastPnaIndices);
                Console.WriteLine($"Found {logLabel} flag {lastFlag} for cg {cg}");
                flags[cg] = lastFlag;
            }
        }
    }
    return flags;
}

/*
 * Get a map of CGs to their flags from an archive of WS2 files.
 */
static Dictionary<Cg, ushort> GetArcCgFlags(ArcFile rio, string logLabel) {
    return rio.ListChildren()
        .AsParallel()
        .Where(m => m.Name.StartsWith("CG_PAGE"))
        .Select(m => rio.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .SelectMany(ws2 => GetWs2CgFlags(ws2, logLabel))
        .ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
}

/*
 * Update the flag of an opcode given a mapping and return whether the opcode was updated.
 */
static bool UpdateOpcodeFlag(IOpcode op, Dictionary<ushort, ushort> flagConversions) {
    ushort newFlag;
    try {
        switch (op.OpcodeNumber) {
            case COND_JUMP_OP:
                var condJumpOp = (GenericOpcode)op;
                if (flagConversions.TryGetValue((ushort)condJumpOp.Arguments[1], out newFlag)) {
                    condJumpOp.Arguments[1] = newFlag;
                    return true;
                }
                return false;
            case SET_FLAG_OP:
                var setFlagOp = (GenericOpcode)op;
                if (flagConversions.TryGetValue((ushort)setFlagOp.Arguments[0], out newFlag)) {
                    setFlagOp.Arguments[0] = newFlag;
                    return true;
                }
                return false;
            default:
                return false;
        }
    } catch (InvalidOperationException) {
        return false;
    }
}

/*
 * Update the flags of a single WS2 file given a mapping and return whether the file was updated.
 * The WS2 file is detached from its parent to prevent changes being propagated to the disk filesystem
 * i.e. changes are only made in memory.
 */
static bool UpdateWs2CgFlags(Ws2File ws2, Dictionary<ushort, ushort> flagConversions) {
    var ops = ws2.Opcodes;
    bool updated = false;
    foreach (var op in ops) {
        updated |= UpdateOpcodeFlag(op, flagConversions);
    }

    if (updated) {
        ws2.DetachParent();
        ws2.SetOpcodes(ops, CancellationToken.None, Progress.I).Wait();
        Console.WriteLine($"Updated flags for {ws2.Name}");
    }
    return updated;
}

/*
 * Get the flag mapping that needs to be applied to the EN WS2 files to match the JP WS2 files.
 * Also return the JP CG flag mapping for later reuse.
 */
static Dictionary<ushort, ushort> GetFlagConversions(ArcFile enRio, ArcFile jpRio, out Dictionary<Cg, ushort> jpFlags) {
    var enFlags = GetArcCgFlags(enRio, "EN");
    jpFlags = GetArcCgFlags(jpRio, "JP");
    Dictionary<ushort, ushort> flagConversions = new();
    foreach (var (cg, enFlag) in enFlags) {
        if (jpFlags.TryGetValue(cg, out var jpFlag)) {
            flagConversions[enFlag] = jpFlag;
        } else {
            // This CG is EN only (occurs for COM_04S.PNA, SAY_15S.PNA, and ORI_11S.PNA).
            // If this is ever encountered, give the effect of unlocking the first common route CG
            // which would have been unlocked long ago anyway. This creates an effective noop.
            Console.WriteLine($"Found EN only flag {enFlag}");
            flagConversions[enFlag] = 1250;
        }
    }
    return flagConversions;
}

/*
 * Update the flags of the EN Rio.arc to match the JP Rio.arc and return the updated archive.
 * Also return the JP CG flag mapping for later reuse.
 */
static ArcFile UpdateArcFlags(ArcFile enRio, ArcFile jpRio, out Dictionary<Cg, ushort> flags) {
    Console.WriteLine("Getting a list of flags to be converted");
    var flagConversions = GetFlagConversions(enRio, jpRio, out flags);

    var enStreams = enRio.ListChildren()
        .AsParallel()
        .Select(m => enRio.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .ToList();

    var changedENStreams = enStreams
        .Where(f => UpdateWs2CgFlags(f, flagConversions))
        .Select(f => (f.Name, f.Stream, 1 /* Low priority */))
        .ToList();

    var jpStreams = jpRio.ListChildren()
        .AsParallel()
        .Where(m => FileList.JP_WS2_FILES.Contains(m.Name))
        .Select(m => jpRio.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .Select(f => ($"{f.Name[..^4]}_E.ws2", f.Stream, 0 /* High priority */))
        .ToList();

    var otherStreams = enStreams
        .Where(f => !changedENStreams.Any(x => x.Name == f.Name) && !jpStreams.Any(x => x.Item1 /* Name */ == f.Name))
        .Select(f => (f.Name, f.Stream))
        .ToList();

    var mergedStreams = changedENStreams
        .Concat(jpStreams)
        .GroupBy(x => x.Item1 /* Name */)
        .Select(x => {
            // Get the highest priority stream (i.e. JP over EN)
            if (x.Count() > 1) {
                Console.WriteLine($"Preferring the JP version of {x.First().Item1 /* Name */}");
            }
            return x.OrderBy(y => y.Item3).First();
        })
        .Select(x => (x.Item1 /* Name*/, x.Stream))
        .Concat(otherStreams)
        .ToList();

    return new ArcFile("Rio.arc", mergedStreams);
}

/*
 * Get the flow graph of the yozora*.ws2 files in the JP Rio.arc.
 * A WS2 file may have multiple next files (e.g. for choices).
 * These are returned in the order they are encountered in the
 * file as a List<string>.
 */
static Dictionary<string, List<string>> GetWs2Graph(ArcFile jpRio) {
    static List<string> GetNextFiles(List<IOpcode> ops) {
        var nextFiles = new List<string>();
        foreach (var op in ops) {
            try {
                if (op.OpcodeNumber == NEXT_FILE_OP) {
                    var nextFileOp = (GenericOpcode)op;
                    var nextFile = (string)nextFileOp.Arguments[0];
                    if (nextFile.StartsWith("YOZORA")) {
                        nextFiles.Add(nextFile + "_E");
                    }
                }
            } catch (InvalidOperationException) { }
        }
        return nextFiles;
    }

    return jpRio.ListChildren()
        .AsParallel()
        .Where(m => m.Name.StartsWith("yozora"))
        .Select(m => jpRio.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .ToDictionary(f => f.Name[..^4] + "_E", f => GetNextFiles(f.Opcodes));
}

/*
 * Update the flow of the EN Rio.arc to match the JP Rio.arc and return the updated archive.
 */
static ArcFile UpdateWs2Graph(ArcFile enRio, ArcFile jpRio) {
    var graph = GetWs2Graph(jpRio);
    foreach (var (file, nextFiles) in graph) {
        Console.WriteLine($"Ws2 graph: {file} -> [{string.Join(", ", nextFiles)}]");
    }

    var enWs2 = enRio.ListChildren()
        .AsParallel()
        .Select(m => enRio.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .ToList();
    foreach (var ws2 in enWs2.Where(m => m.Name.StartsWith("yozora"))) {
        var nextFiles = graph[ws2.Name[..^4]];
        int i = 0;
        var ops = ws2.Opcodes;
        foreach (var op in ops) {
            try {
                if (op.OpcodeNumber == NEXT_FILE_OP) {
                    var nextFileOp = (GenericOpcode)op;
                    var oldNextFile = (string)nextFileOp.Arguments[0];
                    if (oldNextFile.StartsWith("YOZORA")) {
                        var newNextFile = nextFiles[i++];
                        if (oldNextFile != newNextFile) {
                            nextFileOp.Arguments[0] = newNextFile;
                            Console.WriteLine($"Updated next file for {ws2.Name}: {oldNextFile} -> {newNextFile}");
                        }
                    }
                }
            } catch (InvalidOperationException) { }
        }
        ws2.DetachParent();
        ws2.SetOpcodes(ops, CancellationToken.None, Progress.I).Wait();
    }

    return new ArcFile("Rio.arc", enWs2.Select(f => (f.Name, f.Stream)));
}

/*
 * Generate a new CG_PAGE.ws2 to show the CGs given by the flags parameter.
 * Also update the jump targets of REPLAY_EXE.ws2 to end in '_E'.
 * e.g. YOZORA_HIKA_103D_H -> YOZORA_HIKA_103D_H_E.
 * Return the updated archive.
 */
static ArcFile UpdateCGAndSceneScript(ArcFile arc, Dictionary<Cg, ushort> flags) {
    static GenericOpcode CreateJumpOp(int label) {
        var op = new GenericOpcode(JUMP_OP);
        op.Arguments.Add(label);
        return op;
    }

    static GenericOpcode CreateCondJumpOp(byte mode, ushort flag, float value, int label) {
        var op = new GenericOpcode(COND_JUMP_OP);
        op.Arguments.Add(mode);
        op.Arguments.Add(flag);
        op.Arguments.Add(value);
        op.Arguments.Add(0);
        op.Arguments.Add(label);
        return op;
    }

    static GenericOpcode CreateExecLuaOp(string func, string a, ushort b, byte n) {
        var op = new GenericOpcode(EXEC_LUA_OP);
        op.Arguments.Add(func);
        op.Arguments.Add(a);
        op.Arguments.Add(b);
        op.Arguments.Add(n);
        return op;
    }

    var files = arc.ListChildren()
        .AsParallel()
        .Select(m => arc.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .ToList();

    // Update the REPLAY_EXE.ws2 file
    {
        var scene = (Ws2File)files.Find(m => m.Name == "REPLAY_EXE.ws2")!;
        var ops = scene.Opcodes;
        foreach (var op in ops) {
            try {
                if (op.OpcodeNumber == NEXT_FILE_OP) {
                    var nextFileOp = (GenericOpcode)op;
                    var nextFile = (string)nextFileOp.Arguments[0];
                    if (nextFile.EndsWith("_H")) {
                        nextFileOp.Arguments[0] = nextFile + "_E";
                    }
                }
            } catch (InvalidOperationException) { }
        }
        scene.DetachParent();
        scene.SetOpcodes(ops, CancellationToken.None, Progress.I).Wait();
    }
    Console.WriteLine("Updated REPLAY_EXE.ws2");

    // Generate the CG_PAGE.ws2 file
    {
        var cgPage = (Ws2File)files.Find(m => m.Name == "CG_PAGE.ws2")!;
        var ops = new List<IOpcode>();
        int label = 1;
        int cgIndex = 1;
        const int END = 9999999;
        foreach (var variant in flags.GroupBy(f => f.Key.PnaName)) {
            foreach (var (cg, flag) in variant) {
                // Check CG index
                ops.Add(CreateCondJumpOp(130, 105, cgIndex, label));

                // Check CG variant
                ops.Add(CreateCondJumpOp(2, flag, 1, label));

                // Prepare PNA indices
                ops.Add(CreateExecLuaOp("InitPnaCgBrowser", "", 0xFFFF, 1));
                foreach (var pnaIndex in cg.PnaIndices) {
                    ops.Add(CreateExecLuaOp("InitPnaCgBrowser", "", pnaIndex, 1));
                }

                // Show CG
                ops.Add(CreateExecLuaOp("openCgBrowser", cg.PnaName, 0, 0));

                // Check right clicked
                ops.Add(CreateCondJumpOp(130, 99, -1, label));
                ops.Add(CreateJumpOp(END));

                // Add end of section
                ops.Add(new Label { Offset = label++ });
            }
            cgIndex++;
        }
        // Add end of script
        ops.Add(new Label { Offset = END });
        ops.Add(new GenericOpcode(0x05));
        ops.Add(new GenericOpcode(0xFF));
        ops.Add(new Epilogue());

        cgPage.DetachParent();
        cgPage.SetOpcodes(ops, CancellationToken.None, Progress.I).Wait();
    }
    Console.WriteLine("Generated CG_PAGE.ws2");

    var streams = files
        .OfType<BinaryFile>()
        .Select(f => (f.Name, f.Stream))
        .ToList();
    return new ArcFile("Rio.arc", streams);
}

/*
 * Insert a lua function call at the start of each yozora*.ws2 that tells
 * lua whether the ws2 file is a JP version or not. This is used to
 * know whether to load images from Graphics.arc or Graphics_JP.arc
 * as these archives are incompatible and cannot be merged easily.
 */
static ArcFile AddGraphicsCorrection(ArcFile arc) {
    var files = arc.ListChildren()
        .AsParallel()
        .Where(m => m.Name.StartsWith("yozora"))
        .Select(m => m.Name)
        .Order()
        .Select(f => arc.GetChild(f, CancellationToken.None, Progress.I).Result)
        .OfType<Ws2File>()
        .ToList();

    var jpWs2Files = FileList.JP_WS2_FILES
        .Select(f => f[..^4] + "_E.ws2")
        .ToHashSet();

    ushort i = 0;
    foreach (var file in files) {
        var ops = file.Opcodes;
        bool isJPWs2 = jpWs2Files.Contains(file.Name);
        var op = new GenericOpcode(EXEC_LUA_OP);
        op.Arguments.Add("SetIsJPWs2");
        op.Arguments.Add("");
        op.Arguments.Add((ushort)(isJPWs2 ? 1 : 0));
        op.Arguments.Add((byte)1);
        ops.Insert(1, op); // Don't insert at 0 as there might be a label there
        file.DetachParent();
        file.SetOpcodes(ops, CancellationToken.None, Progress.I).Wait();
        Console.WriteLine($"Added graphics correction to {file.Name}");
        i++;
    }
    var streams = files
        .Select(f => (f.Name, f.Stream))
        .ToList();

    var otherStreams = arc.ListChildren()
        .AsParallel()
        .Where(m => !m.Name.StartsWith("yozora"))
        .Select(m => arc.GetChild(m.Name, CancellationToken.None, Progress.I).Result)
        .OfType<BinaryFile>()
        .Select(f => (f.Name, f.Stream))
        .ToList();
    var mergedStreams = streams.Concat(otherStreams);
    return new ArcFile("Rio.arc", mergedStreams);
}

/*
 * Merge the assets from a EN and JP archive.
 * 
 * If mode is Full, an archive containing all assets from both archives is returned
 * with JP assets taking precedence.
 * 
 * If mode is Diff, an archive containing only the JP assets that are different
 * from the EN assets is returned.
 */
static ArcFile MergeAssets(ArcFile enArc, ArcFile jpArc, MergeMode mode) {
    var enAssetSizes = enArc.ListChildren()
        .ToDictionary(m => m.Name, m => m.Length);
    var jpAssetSizes = jpArc.ListChildren()
        .ToDictionary(m => m.Name, m => m.Length);

    var enOnly = enAssetSizes.Keys.Except(jpAssetSizes.Keys);
    var jpOnly = jpAssetSizes.Keys.Except(enAssetSizes.Keys);
    var common = jpAssetSizes.Keys.Intersect(enAssetSizes.Keys);

    foreach (var asset in enOnly) {
        Console.WriteLine($"Found EN only asset {asset}");
    }
    foreach (var asset in enOnly) {
        Console.WriteLine($"Found JP only asset {asset}");
    }

    if (mode == MergeMode.Full) {
        List<string> jpAssets = jpOnly.ToList();
        foreach (var asset in common) {
            if (enAssetSizes[asset] != jpAssetSizes[asset]) {
                Console.WriteLine($"Preferring the JP version of {asset}");
            }
            jpAssets.Add(asset);
        }

        var enStreams = enOnly
            .AsParallel()
            .Select(f => (
                f,
                ((BinaryFile)enArc.GetChild(f, CancellationToken.None, Progress.I).Result).Stream)
            );
        var jpStreams = jpAssets
            .AsParallel()
            .Select(f => (
                f,
                ((BinaryFile)jpArc.GetChild(f, CancellationToken.None, Progress.I).Result).Stream)
            );
        var mergedStreams = enStreams.Concat(jpStreams);
        return new ArcFile(enArc.Name, mergedStreams);
    } else {
        List<string> diff = jpOnly.ToList();
        foreach (var asset in common) {
            if (enAssetSizes[asset] != jpAssetSizes[asset]) {
                Console.WriteLine($"Preferring the JP version of {asset}");
                diff.Add(asset);
            }
        }

        var streams = diff
            .AsParallel()
            .Select(f => (
                f,
                ((BinaryFile)jpArc.GetChild(f, CancellationToken.None, Progress.I).Result).Stream)
            );
        return new ArcFile(enArc.Name, streams);
    }
}

/*
 * Write an ArcFile to disk.
 */
static void WriteArc(ArcFile arc, string outputPath) {
    arc.Stream.Reset();
    using var outputFile = File.Create(Path.Combine(outputPath, arc.Name));
    arc.Stream.MemoryStream.CopyTo(outputFile);
}

static void MyMain(string[] args) {
    MergeMode mode = args[0] switch {
        "full" => MergeMode.Full,
        "diff" => MergeMode.Diff,
        _ => throw new ArgumentException("Invalid merge mode")
    };
    var enGamePath = args[1];
    var jpGamePath = args[2];
    var outputPath = args[3];

    Directory.CreateDirectory(outputPath);
    Console.WriteLine($"Created directory {outputPath}");

    var enRioPath = Path.Combine(enGamePath, "Rio.arc");
    var jpRioPath = Path.Combine(jpGamePath, "Rio.arc");
    var enRio = (ArcFile)Folder.GetFolder(enRioPath, CancellationToken.None, Progress.I).Result;
    var jpRio = (ArcFile)Folder.GetFolder(jpRioPath, CancellationToken.None, Progress.I).Result;
    var newRio = UpdateArcFlags(enRio, jpRio, out var flags);
    newRio = UpdateWs2Graph(newRio, jpRio);
    newRio = UpdateCGAndSceneScript(newRio, flags);
    newRio = AddGraphicsCorrection(newRio);
    WriteArc(newRio, outputPath);

    foreach (var asset in FileList.CHIP_FILES) {
        var enAssetPath = Path.Combine(enGamePath, asset);
        var jpAssetPath = Path.Combine(jpGamePath, asset);
        var enAsset = (ArcFile)Folder.GetFolder(enAssetPath, CancellationToken.None, Progress.I).Result;
        var jpAsset = (ArcFile)Folder.GetFolder(jpAssetPath, CancellationToken.None, Progress.I).Result;
        var newAsset = MergeAssets(enAsset, jpAsset, mode);
        WriteArc(newAsset, outputPath);
    }

    foreach (var (src, dst) in FileList.COPY_FILES) {
        File.Copy(
            Path.Combine(jpGamePath, src),
            Path.Combine(outputPath, dst),
            true);
        Console.WriteLine($"Copied {src} as {dst}");
    }
}

try {
    MyMain(args);
} catch (Exception e) {
    Console.WriteLine(e.ToString());
}

enum MergeMode {
    Full,
    Diff,
}

class Cg {
    public string PnaName { get; init; }
    public ushort[] PnaIndices { get; init; }

    public Cg(string pnaName, IEnumerable<ushort> pnaIndices) {
        PnaName = pnaName;
        PnaIndices = pnaIndices.ToArray();
    }

    public static bool operator ==(Cg a, Cg b) {
        return a.PnaName == b.PnaName
            && a.PnaIndices.SequenceEqual(b.PnaIndices);
    }

    public static bool operator !=(Cg a, Cg b) {
        return !(a == b);
    }

    public override bool Equals(object? obj) {
        return obj is Cg cg && this == cg;
    }

    public override int GetHashCode() {
        return ((IStructuralEquatable)PnaIndices).GetHashCode(EqualityComparer<ushort>.Default)
            ^ PnaName.GetHashCode();
    }

    public override string ToString() {
        return $"{PnaName}({string.Join(",", PnaIndices)})";
    }
}

static class Progress {
    public static readonly Progress<(int, string, float)> I = new (x => {
        var (id, task, value) = x;
        Console.WriteLine($"{task}: {value:P0}");
    });
}