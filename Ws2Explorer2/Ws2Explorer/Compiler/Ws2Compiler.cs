using System.Diagnostics;
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
    public static List<Op> Decompile(BinaryStream stream, out Ws2Version version)
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
                return Decompile(stream, v);
            }
            catch (Exception ex)
            {
                exceptions.Add(ex);
            }
        }
        throw new AggregateException("Failed to decompile ws2 file for any version.", exceptions);
    }

    private static List<Op> Decompile(BinaryStream stream, Ws2Version version)
    {
        using var data = new BinaryStream(stream.Length);
        var writer = new BinaryWriter(data);
        for (int i = 0; i < stream.Length; i++)
        {
            byte b = stream.Span[i];
            writer.WriteUInt8At(i, (byte)((b << 6) | (b >> 2)));
        }

        var reader = new BinaryReader(data);
        var ops = new List<(Op op, int offset)>()
        {
            (new() { Code = Op.VERSION_CODE, Arguments = [Argument.NewString(version.ToString())] }, 0),
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
            Code = Op.EPILOGUE_CODE,
            Arguments = [.. Enumerable.Range(0, Op.EPILOGUE_SIZE)
                .Select(_ => Argument.NewUInt8(reader.ReadUInt8()))],
        }, epilogueOffset));

        var finalOps = new List<Op>();
        foreach (var (op, offset) in ops)
        {
            if (labels.Contains(offset))
            {
                finalOps.Add(new() { Code = Op.LABEL_CODE, Arguments = [Argument.NewLabel(offset)] });
                labels.Remove(offset);
            }
            finalOps.Add(op);
        }

        // Verify all labels are resolved?
        //if (labels.Count > 0)
        //{
        //    throw new Exception($"Unresolved labels: {string.Join(", ", labels)}");
        //}
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
                    ushort[] arr = Enumerable.Range(0, len)
                        .Select(_ => reader.ReadUInt16())
                        .ToArray();
                    return Argument.NewUInt16Array(arr);
                }
            case 'S':
                {
                    var len = reader.ReadUInt8();
                    string[] arr = Enumerable.Range(0, len)
                        .Select(_ => reader.ReadSjisString())
                        .ToArray();
                    return Argument.NewStringArray(arr);
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

    public static BinaryStream Compile(IEnumerable<Op> ops)
    {
        var len = 0;
        var labelMap = new Dictionary<int, int>();
        foreach (var op in ops)
        {
            if (op.Code == Op.LABEL_CODE)
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
        if (versionOp.Code != Op.VERSION_CODE)
        {
            throw new InvalidDataException($"First op must be version, got {versionOp.Code}.");
        }
        var version = Enum.Parse<Ws2Version>(versionOp.Arguments[0].String);

        foreach (var op in ops.Skip(1).SkipLast(1))
        {
            switch (op.Code)
            {
                case Op.LABEL_CODE:
                    break;
                case Op.EPILOGUE_CODE:
                    foreach (var arg in op.Arguments)
                    {
                        writer.WriteUInt8(arg.UInt8);
                    }
                    break;
                case (>= 0) and (<= 0xFF):
                    WriteOp(writer, op, labelMap);
                    break;
                default:
                    throw new InvalidDataException($"Invalid op code 0x{op.Code:X2}.");
            }
        }

        var epilogueOp = ops.Last();
        if (epilogueOp.Code != Op.EPILOGUE_CODE)
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

        data.IncRef();
        return data;
    }

    private static void WriteOp(BinaryWriter writer, Op op, Dictionary<int, int> labelMap)
    {
        writer.WriteUInt8((byte)op.Code);
        foreach (var arg in op.Arguments)
        {
            WriteArgument(writer, arg, labelMap);
        }
    }

    private static void WriteArgument(BinaryWriter writer, Argument arg, Dictionary<int, int> labelMap)
    {
        switch (arg.Value)
        {
            case int a:
                // Verify label is resolved?
                //writer.WriteInt32(labelMap[a]);
                writer.WriteInt32(labelMap.GetValueOrDefault(a, a));
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
            case string[] arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteSjisString(elem);
                }
                break;
            case ushort[] arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteUInt16(elem);
                }
                break;
            case Choice[] arr:
                writer.WriteUInt8(checked((byte)arr.Length));
                foreach (var elem in arr)
                {
                    writer.WriteUInt16(elem.Id);
                    writer.WriteSjisString(elem.Text);
                    writer.WriteUInt8(elem.Arg3);
                    writer.WriteUInt8(elem.Arg4);
                    writer.WriteUInt8(elem.Arg5);
                    WriteOp(writer, elem.JumpOp, labelMap);
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
