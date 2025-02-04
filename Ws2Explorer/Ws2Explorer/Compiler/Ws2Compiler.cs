using System.Collections.Immutable;
using System.Diagnostics;
using System.Reflection.Emit;
using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

public enum Ws2Version
{
    V1,
    V2,
    V3,
    V3_1,
}

public static class Ws2Compiler
{
    public static List<Op> Decompile(BinaryStream stream, out Ws2Version version, out bool hasUnresolvedLabels)
    {
        return Decompile(stream, false, out version, out hasUnresolvedLabels);
    }

    public static List<Op> Decompile(BinaryStream stream, out Ws2Version version, bool mustResolveLabels = true)
    {
        return Decompile(stream, mustResolveLabels, out version, out _);
    }

    private static List<Op> Decompile(BinaryStream stream, bool mustResolveLabels, out Ws2Version version, out bool hasUnresolvedLabels)
    {
        var versions = new Ws2Version[] {
            Ws2Version.V3,
            Ws2Version.V2,
            Ws2Version.V1,
            Ws2Version.V3_1, // Rare
        };

        var exceptions = new List<Exception>();
        foreach (var v in versions)
        {
            try
            {
                version = v;
                var ret = DecompileVersion(stream, v, out var unresolvedLabels);
                hasUnresolvedLabels = unresolvedLabels.Count > 0;
                if (mustResolveLabels && hasUnresolvedLabels)
                {
                    throw new InvalidDataException($"Unresolved labels: {string.Join(", ", unresolvedLabels)}");
                }
                return ret;
            }
            catch (Exception ex)
            {
                exceptions.Add(ex);
            }
        }
        throw new AggregateException("Failed to decompile ws2 file for any version.", exceptions);
    }

    private static List<Op> DecompileVersion(BinaryStream stream, Ws2Version version, out HashSet<int> unresolvedLabels)
    {
        using var data = new BinaryStream(stream.Length);
        var writer = new BinaryWriter(data);
        for (int i = 0; i < stream.Length; i++)
        {
            byte b = stream.Span[i];
            writer.WriteUInt8At(i, (byte)((b << 6) | (b >> 2)));
        }
        data.Freeze();

        var reader = new BinaryReader(data);
        var ops = new List<(Op op, int offset)>()
        {
            (new() { Code = Opcode.VERSION, Arguments = [Argument.NewString(version.ToString())] }, 0),
        };
        var labels = new HashSet<int>();
        while (reader.Position + Op.EPILOGUE_SIZE < reader.Length)
        {
            var offset = reader.Position;
            var op = ReadOp(reader, version);
            ops.Add((op, offset));
            labels.UnionWith(op.Labels);
        }
        labels.Remove(0); // Jump to zero has special meaning of no-jump.
        var epilogueOffset = reader.Position;
        ops.Add((new Op
        {
            Code = Opcode.EPILOGUE,
            Arguments = [.. Enumerable.Range(0, Op.EPILOGUE_SIZE)
                .Select(_ => Argument.NewUInt8(reader.ReadUInt8()))],
        }, epilogueOffset));

        var finalOps = new List<Op>();
        foreach (var (op, offset) in ops)
        {
            if (labels.Contains(offset))
            {
                finalOps.Add(new() { Code = Opcode.LABEL, Arguments = [Argument.NewLabel(offset)] });
                labels.Remove(offset);
            }
            finalOps.Add(op);
        }

        unresolvedLabels = labels;
        return finalOps;
    }

    private static Op ReadOp(BinaryReader reader, Ws2Version version)
    {
        var code = reader.ReadUInt8();
        var format = OpFormat.Formats[code].VersionFormats[(int)version]
            ?? throw new InvalidDataException($"Invalid opcode 0x{code:X2} for version {version} at offset {reader.Position}.");
        var args = format.Select(t => ReadArgument(reader, t));
        return new Op { Code = code, Arguments = [.. args] };
    }

    private static Argument ReadArgument(BinaryReader reader, char type)
    {
        switch (type)
        {
            case 'a':
                return Argument.NewLabel(reader.ReadInt32());
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
            case 'n':
                return Argument.NewNameString(new(reader.ReadSjisString()));
            case 'm':
                return Argument.NewMessageString(new(reader.ReadSjisString()));
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
                    var len = reader.ReadUInt8();
                    var arr = new Choice[len];
                    for (int i = 0; i < len; i++)
                    {
                        arr[i] = new Choice
                        {
                            Id = reader.ReadUInt16(),
                            Text = reader.ReadSjisString(),
                            Arg3 = reader.ReadUInt8(),
                            Arg4 = reader.ReadUInt8(),
                            Arg5 = reader.ReadUInt8(),
                            JumpOp = ReadOp(reader, Ws2Version.V1 /* Consistent across versions */),
                        };
                    }
                    return Argument.NewChoiceArray(arr);
                }
            default:
                throw new UnreachableException();
        }
    }

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

    public static BinaryStream Compile(IEnumerable<Op> ops, out bool hasUnresolvedLabels)
    {
        var ret = Compile(ops, out HashSet<int> unresolvedLabels);
        hasUnresolvedLabels = unresolvedLabels.Count > 0;
        return ret;
    }

    private static BinaryStream Compile(IEnumerable<Op> ops, out HashSet<int> unresolvedLabels)
    {
        var len = 0;
        var labelMap = new Dictionary<int, int>();
        foreach (var op in ops)
        {
            if (op.Code == Opcode.LABEL)
            {
                var label = op.Arguments[0].Label;
                labelMap.Add(label, len);
            }
            else
            {
                len += op.Size;
            }
        }

        using var data = new BinaryStream(len);
        var writer = new BinaryWriter(data);

        var versionOp = ops.First();
        if (versionOp.Code != Opcode.VERSION)
        {
            throw new InvalidDataException($"First op must be version, got {versionOp.Code}.");
        }
        var version = Enum.Parse<Ws2Version>(versionOp.Arguments[0].String);

        unresolvedLabels = new HashSet<int>();
        foreach (var op in ops.Skip(1).SkipLast(1))
        {
            switch (op.Code)
            {
                case Opcode.LABEL:
                    break;
                case Opcode.EPILOGUE:
                    foreach (var arg in op.Arguments)
                    {
                        writer.WriteUInt8(arg.UInt8);
                    }
                    break;
                case (>= 0) and (<= 0xFF):
                    WriteOp(writer, op, labelMap, unresolvedLabels);
                    break;
                default:
                    throw new InvalidDataException($"Invalid op code 0x{op.Code:X2}.");
            }
        }

        var epilogueOp = ops.Last();
        if (epilogueOp.Code != Opcode.EPILOGUE)
        {
            throw new InvalidDataException($"Last op must be epilogue, got {epilogueOp.Code}");
        }
        foreach (var arg in epilogueOp.Arguments)
        {
            writer.WriteUInt8(arg.UInt8);
        }
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
        foreach (var arg in op.Arguments)
        {
            WriteArgument(writer, arg, labelMap, unresolvedLabels);
        }
    }

    private static void WriteArgument(BinaryWriter writer, Argument arg, Dictionary<int, int> labelMap, HashSet<int> unresolvedLabels)
    {
        switch (arg.Value)
        {
            case int a:
                if (a == 0)
                {
                    writer.WriteInt32(0);
                }
                else if (labelMap.TryGetValue(a, out var label))
                {
                    writer.WriteInt32(label);
                }
                else
                {
                    unresolvedLabels.Add(a);
                    writer.WriteInt32(a);
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
            case NameString s:
                writer.WriteSjisString(s.FullString);
                break;
            case MessageString s:
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
            case ImmutableArray<Choice> arr:
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
            default:
                throw new UnreachableException();
        }
    }

    public static string ToJson(IEnumerable<Op> ops)
    {
        var count = ops.Count();
        List<string> lines = [
            "[",
            .. ops.Select((op, i) => (i < count - 1)
                ? $"{op.ToJson().ToJsonString(JsonSerializer.Options)},"
                : op.ToJson().ToJsonString(JsonSerializer.Options)
            ),
            "]",
        ];
        return string.Join("\n", lines);
    }

    public static List<Op> FromJson(string json)
    {
        var array = JsonSerializer.Deserialize<JsonArray>(json);
        var version = Enum.Parse<Ws2Version>(
            array[0]!["args"]![0]!.GetValue<string>());
        return array
            .Select(node => Op.FromJson(node!, version))
            .ToList();
    }
}
