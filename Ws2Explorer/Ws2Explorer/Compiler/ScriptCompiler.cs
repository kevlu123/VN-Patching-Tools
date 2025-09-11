using System.Collections.Immutable;
using System.Diagnostics;
using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

/// <summary>
/// WS2/WSC compiler and decompiler.
/// </summary>
public static class ScriptCompiler
{
    /// <summary>
    /// Enable to print debug information to stdout.
    /// </summary>
    public static bool Debug { get; set; } = false;

    /// <summary>
    /// Decompile a WS2 file to a list of ops.
    /// </summary>
    /// <param name="stream">The input data.</param>
    /// <param name="version">The version that the script sucessfully decompiled as.</param>
    /// <param name="hasUnresolvedLabels">
    /// Whether decompilation finished with labels that do
    /// not point to a valid location.
    /// </param>
    /// <returns></returns>
    public static List<Op> DecompileWs2(BinaryStream stream, out ScriptVersion version, out bool hasUnresolvedLabels)
    {
        var versions = new ScriptVersion[] {
            ScriptVersion.WS2_V3,
            ScriptVersion.WS2_V2,
            ScriptVersion.WS2_V1,
            ScriptVersion.WS2_V3_1, // Rare
        };
        return Decompile(stream, versions, false, out version, out hasUnresolvedLabels);
    }

    /// <summary>
    /// Decompile a WS2 file to a list of ops. Requiring that all labels point to valid locations.
    /// </summary>
    /// <param name="stream">The input data.</param>
    /// <param name="version">The version that the script successfully decompiled as.</param>
    /// <returns></returns>
    public static List<Op> DecompileWs2(BinaryStream stream, out ScriptVersion version)
    {
        var versions = new ScriptVersion[] {
            ScriptVersion.WS2_V3,
            ScriptVersion.WS2_V2,
            ScriptVersion.WS2_V1,
            ScriptVersion.WS2_V3_1, // Rare
        };
        return Decompile(stream, versions, true, out version, out _);
    }

    /// <summary>
    /// Decompile a WSC file to a list of ops.
    /// </summary>
    /// <param name="stream">The input data.</param>
    /// <param name="version">The version that the script sucessfully decompiled as.</param>
    /// <param name="hasUnresolvedLabels">
    /// Whether decompilation finished with labels that do
    /// not point to a valid location.
    /// </param>
    /// <returns></returns>
    public static List<Op> DecompileWsc(BinaryStream stream, out ScriptVersion version, out bool hasUnresolvedLabels)
    {
        var versions = new ScriptVersion[] {
            ScriptVersion.WSC_V1,
        };
        return Decompile(stream, versions, false, out version, out hasUnresolvedLabels);
    }

    /// <summary>
    /// Decompile a WSC file to a list of ops. Requiring that all labels point to valid locations.
    /// </summary>
    /// <param name="stream">The input data.</param>
    /// <param name="version">The version that the script successfully decompiled as.</param>
    /// <returns></returns>
    public static List<Op> DecompileWsc(BinaryStream stream, out ScriptVersion version)
    {
        var versions = new ScriptVersion[] {
            ScriptVersion.WSC_V1,
        };
        return Decompile(stream, versions, true, out version, out _);
    }

    private static List<Op> Decompile(BinaryStream stream, ScriptVersion[] versions, bool mustResolveLabels, out ScriptVersion version, out bool hasUnresolvedLabels)
    {
        var exceptions = new List<Exception>();
        (List<Op> ops, ScriptVersion version)? firstDecompiledWithUnresolvedLabels = null;
        foreach (var v in versions)
        {
            try
            {
                version = v;
                var ret = DecompileVersion(stream, v, out var unresolvedLabels);
                hasUnresolvedLabels = unresolvedLabels.Count > 0;
                if (hasUnresolvedLabels)
                {
                    var ex = new InvalidDataException($"Unresolved labels: {string.Join(", ", unresolvedLabels)}");
                    if (mustResolveLabels)
                    {
                        throw ex;
                    }
                    else
                    {
                        firstDecompiledWithUnresolvedLabels ??= (ret, v);
                        exceptions.Add(ex);
                        continue;
                    }
                }
                return ret;
            }
            catch (Exception ex)
            {
                exceptions.Add(ex);
            }
        }
        if (firstDecompiledWithUnresolvedLabels != null)
        {
            hasUnresolvedLabels = true;
            version = firstDecompiledWithUnresolvedLabels.Value.version;
            return firstDecompiledWithUnresolvedLabels.Value.ops;
        }
        throw new AggregateException("Failed to decompile script file for any version.", exceptions);
    }

    private static List<Op> DecompileVersion(BinaryStream stream, ScriptVersion version, out HashSet<int> unresolvedLabels)
    {
        // Rotate bits
        using var data = new BinaryStream(stream.Length);
        var writer = new BinaryWriter(data);
        for (int i = 0; i < stream.Length; i++)
        {
            byte b = stream.Span[i];
            writer.WriteUInt8At(i, (byte)((b << 6) | (b >> 2)));
        }
        data.Freeze();
        var reader = new BinaryReader(data);

        // Read ops
        var ops = new List<(Op op, int offset)>()
        {
            (new() { Code = Opcode.VERSION, Arguments = [Argument.NewString(version.ToString())] }, 0),
        };
        while (reader.Position < reader.Length)
        {
            var offset = reader.Position;
            var op = ReadOp(reader, version);
            if (op.Code == Opcode.WS2_FILE_END_FF /* or WSC_FILE_END_FF */ && reader.Position != reader.Length)
            {
                throw new InvalidDataException($"Unexpected FileEnd op at offset 0x{offset:X2}.");
            }
            if (Debug)
            {
                Console.WriteLine($"Op 0x{(int)op.Code:X2} ({op.GetDescription(version)}) at 0x{offset:X2}");
            }
            ops.Add((op, offset));
        }

        // Calculate absolute addresses from relative addresses.
        var labels = new HashSet<int>();
        for (int i = 0; i < ops.Count; i++)
        {
            var (op, offset) = ops[i];
            for (int j = 0; j < op.Arguments.Length; j++)
            {
                if (op.Arguments[j].Value is RelativeLabel label)
                {
                    ops[i] = (
                        ops[i].op.WithArgument(j, Argument.NewRelativeLabel(new(
                            label.RelativeAddress,
                            offset + op.Size + label.RelativeAddress))),
                        offset);
                }
            }
        }

        // List all labels.
        foreach (var (op, offset) in ops) {
            labels.UnionWith(op.Labels);
        }
        labels.Remove(0); // Jump to zero has special meaning of no-jump.

        // Insert labels into ops.
        var finalOps = new List<Op>();
        foreach (var (op, offset) in ops)
        {
            if (labels.Contains(offset))
            {
                finalOps.Add(new() { Code = Opcode.LABEL, Arguments = [Argument.NewLabel(new(offset))] });
                labels.Remove(offset);
            }
            finalOps.Add(op);
        }

        unresolvedLabels = labels;
        return finalOps;
    }

    private static Op ReadOp(BinaryReader reader, ScriptVersion version)
    {
        var code = reader.ReadUInt8();
        var format = OpFormat.Formats[(int)version][code]
            ?? throw new InvalidDataException($"Invalid opcode 0x{code:X2} for version {version} at offset 0x{reader.Position - 1:X2}.");
        var args = format.Format.Select(t => ReadArgument(reader, t));
        return new Op { Code = (Opcode)code, Arguments = [.. args] };
    }

    private static Argument ReadArgument(BinaryReader reader, char type)
    {
        switch (type)
        {
            case 'a':
                return Argument.NewLabel(new(reader.ReadInt32()));
            case 'r':
                return Argument.NewRelativeLabel(new(reader.ReadInt32(), 0 /* Placeholder */));
            case 'b':
                return Argument.NewUInt8(reader.ReadUInt8());
            case 'h':
                return Argument.NewUInt16(reader.ReadUInt16());
            case 'i':
                return Argument.NewUInt32(reader.ReadUInt32());
            case 'f':
                return Argument.NewFloat32(reader.ReadFloat32());
            case 's':
                return Argument.NewString(reader.ReadSjisString());
            case 't':
                return Argument.NewAffixedString(new(reader.ReadSjisString()));
            case 'H':
                {
                    var len = reader.ReadUInt8();
                    return Argument.NewUInt16Array(Enumerable.Range(0, len)
                        .Select(_ => reader.ReadUInt16()));
                }
            case 'S':
                {
                    var len = reader.ReadUInt8();
                    return Argument.NewStringArray(Enumerable.Range(0, len)
                        .Select(_ => reader.ReadSjisString()));
                }
            case 'C':
                {
                    int len = reader.ReadUInt8();
                    var arr = new Ws2Choice[len];
                    for (int i = 0; i < len; i++)
                    {
                        arr[i] = new Ws2Choice
                        {
                            Id = reader.ReadUInt16(),
                            Text = reader.ReadSjisString(),
                            Arg3 = reader.ReadUInt8(),
                            Arg4 = reader.ReadUInt8(),
                            Arg5 = reader.ReadUInt8(),
                            JumpOp = ReadOp(reader, ScriptVersion.WS2_V1 /* Consistent across WS2 versions */),
                        };
                    }
                    return Argument.NewWs2ChoiceArray(arr);
                }
            case 'D':
                {
                    int len = reader.ReadUInt16();
                    var arr = new WscChoice[len];
                    for (int i = 0; i < len; i++)
                    {
                        arr[i] = new WscChoice
                        {
                            Id = reader.ReadUInt16(),
                            Text = reader.ReadSjisString(),
                            Arg3 = reader.ReadUInt8(),
                            Arg4 = reader.ReadUInt8(),
                            Arg5 = reader.ReadUInt8(),
                            JumpOp = ReadOp(reader, ScriptVersion.WSC_V1 /* Consistent across WSC versions */),
                        };
                    }
                    return Argument.NewWscChoiceArray(arr);
                }
            default:
                throw new UnreachableException();
        }
    }

    /// <summary>
    /// Compile a list of ops to a binary stream.
    /// </summary>
    /// <param name="ops">The list of ops.</param>
    /// <param name="mustResolveLabels">
    /// Whether all labels must point to valid locations.
    /// </param>
    /// <returns></returns>
    public static BinaryStream Compile(IEnumerable<Op> ops, bool mustResolveLabels = true)
    {
        var ret = Compile(ops, out HashSet<int> unresolvedLabels);
        if (mustResolveLabels && unresolvedLabels.Count > 0)
        {
            ret.Dispose();
            throw new InvalidDataException($"Unresolved labels: {string.Join(", ", unresolvedLabels)}");
        }
        return ret;
    }

    /// <summary>
    /// Compile a list of ops to a binary stream.
    /// </summary>
    /// <param name="ops">The list of ops.</param>
    /// <param name="hasUnresolvedLabels">
    /// Whether compilation finished with labels that do
    /// not point to a valid location.
    /// </param>
    /// <returns></returns>
    public static BinaryStream Compile(IEnumerable<Op> ops, out bool hasUnresolvedLabels)
    {
        var ret = Compile(ops, out HashSet<int> unresolvedLabels);
        hasUnresolvedLabels = unresolvedLabels.Count > 0;
        return ret;
    }

    /// <summary>
    /// Gets the script version from the list of ops.
    /// The first op should be a VERSION op.
    /// </summary>
    /// <param name="ops"></param>
    /// <returns></returns>
    public static ScriptVersion GetScriptVersion(IEnumerable<Op> ops)
    {
        var versionOp = ops.First();
        if (versionOp.Code != Opcode.VERSION)
        {
            throw new InvalidDataException($"First op must be version, got 0x{(int)versionOp.Code}.");
        }
        return Enum.Parse<ScriptVersion>(versionOp.Arguments[0].String);
    }

    private static BinaryStream Compile(IEnumerable<Op> ops, out HashSet<int> unresolvedLabels)
    {
        // Calculate map of labels to offsets.
        var len = 0;
        var labelMap = new Dictionary<int, int>();
        foreach (var op in ops)
        {
            if (op.Code == Opcode.LABEL)
            {
                var label = op.Arguments[0].Label.Address;
                labelMap.Add(label, len);
            }
            else
            {
                len += op.Size;
            }
        }

        using var data = new BinaryStream(len);
        var writer = new BinaryWriter(data);
        var version = GetScriptVersion(ops);

        // Write ops
        unresolvedLabels = [];
        foreach (var op in ops.Skip(1))
        {
            switch ((int)op.Code)
            {
                case (int)Opcode.LABEL:
                    break;
                case (>= 0) and (<= 0xFF):
                    WriteOp(writer, op, labelMap, unresolvedLabels);
                    break;
                default:
                    throw new InvalidDataException($"Invalid op code 0x{op.Code:X2}.");
            }
        }

        // Rotate bits
        writer.Position = 0;
        for (var i = 0; i < data.Length; i++)
        {
            var b = data.Span[i];
            writer.WriteUInt8At(i, (byte)((b << 2) | (b >> 6)));
        }

        data.Freeze();
        data.IncRef();
        return data;
    }

    private static void WriteOp(BinaryWriter writer, Op op, Dictionary<int, int> labelMap, HashSet<int> unresolvedLabels)
    {
        writer.WriteUInt8((byte)op.Code);
        for (int i = 0; i < op.Arguments.Length; i++)
        {
            WriteArgument(writer, op, i, labelMap, unresolvedLabels);
        }
    }

    private static void WriteArgument(BinaryWriter writer, Op op, int argIndex, Dictionary<int, int> labelMap, HashSet<int> unresolvedLabels)
    {
        var arg = op.Arguments[argIndex];
        switch (arg.Value)
        {
            case Label a:
                if (a.Address == 0)
                {
                    writer.WriteInt32(0);
                }
                else if (labelMap.TryGetValue(a.Address, out var label))
                {
                    writer.WriteInt32(label);
                }
                else
                {
                    unresolvedLabels.Add(a.Address);
                    writer.WriteInt32(a.Address);
                }
                break;
            case RelativeLabel r:
                var opEndOffset = writer.Position + op.Arguments[argIndex..].Sum(arg => arg.Size);
                if (r.ComputedAbsoluteAddress == 0)
                {
                    writer.WriteInt32(0);
                }
                else if (labelMap.TryGetValue(r.ComputedAbsoluteAddress, out var label))
                {
                    writer.WriteInt32(label - opEndOffset);
                }
                else
                {
                    unresolvedLabels.Add(r.ComputedAbsoluteAddress);
                    writer.WriteInt32(r.ComputedAbsoluteAddress - opEndOffset);
                }
                break;
            case byte b:
                writer.WriteUInt8(b);
                break;
            case ushort h:
                writer.WriteUInt16(h);
                break;
            case uint i:
                writer.WriteUInt32(i);
                break;
            case float f:
                writer.WriteFloat32(f);
                break;
            case string s:
                writer.WriteSjisString(s);
                break;
            case AffixedString s:
                writer.WriteSjisString(s.FullString);
                break;
            case ImmutableArray<string> arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteSjisString(elem);
                }
                break;
            case ImmutableArray<ushort> arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteUInt16(elem);
                }
                break;
            case ImmutableArray<Ws2Choice> arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteUInt16(elem.Id);
                    writer.WriteSjisString(elem.Text);
                    writer.WriteUInt8(elem.Arg3);
                    writer.WriteUInt8(elem.Arg4);
                    writer.WriteUInt8(elem.Arg5);
                    WriteOp(writer, elem.JumpOp, labelMap, unresolvedLabels);
                }
                break;
            case ImmutableArray<WscChoice> arr:
                writer.WriteUInt16(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteUInt16(elem.Id);
                    writer.WriteSjisString(elem.Text);
                    writer.WriteUInt8(elem.Arg3);
                    writer.WriteUInt8(elem.Arg4);
                    writer.WriteUInt8(elem.Arg5);
                    WriteOp(writer, elem.JumpOp, labelMap, unresolvedLabels);
                }
                break;
            default:
                throw new UnreachableException();
        }
    }

    /// <summary>
    /// Serialize a list of ops to a JSON string.
    /// </summary>
    /// <param name="ops"></param>
    /// <returns></returns>
    public static string ToJson(IEnumerable<Op> ops)
    {
        var count = ops.Count();
        if (count == 0)
        {
            throw new InvalidDataException("Cannot serialize empty ops list to JSON.");
        }
        var versionOp = ops.First();
        if (versionOp.Code != Opcode.VERSION)
        {
            throw new InvalidDataException($"First op must be version, got 0x{(int)ops.First().Code:X2}.");
        }
        var version = Enum.Parse<ScriptVersion>(versionOp.Arguments[0].String);
        List<string> lines = [
            "[",
            .. ops.Select((op, i) => (i < count - 1)
                ? $"{op.ToJson(version).ToJsonString(JsonSerializer.Options)},"
                : op.ToJson(version).ToJsonString(JsonSerializer.Options)
            ),
            "]",
        ];
        return string.Join("\n", lines);
    }

    /// <summary>
    /// Deserialize a list of ops from a JSON string.
    /// </summary>
    /// <param name="json"></param>
    /// <returns></returns>
    public static List<Op> FromJson(string json)
    {
        var array = JsonSerializer.Deserialize<JsonArray>(json);
        var version = Enum.Parse<ScriptVersion>(
            array[0]!["args"]![0]!.GetValue<string>());
        return array
            .Select(node => Op.FromJson(node!, version))
            .ToList();
    }
}
