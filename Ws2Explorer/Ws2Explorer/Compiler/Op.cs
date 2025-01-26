using System.Collections.Immutable;
using System.Diagnostics;
using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

public readonly struct NameString
{
    public string FullString { get; }
    public string Prefix => FullString[..GetPrefixLength()];
    public string String => FullString[GetPrefixLength()..];

    public NameString(string fullString)
    {
        FullString = fullString;
    }

    public NameString(string prefix, string str)
    {
        FullString = prefix + str;
    }

    private int GetPrefixLength()
    {
        int i = 0;
        while (i + 3 < FullString.Length && FullString[i] == '%')
        {
            i += 3;
        }
        return i;
    }

    internal JsonNode ToJson()
    {
        return new JsonArray
        {
            Prefix,
            String
        };
    }

    internal static NameString FromJson(JsonNode array)
    {
        return new NameString(
            array[0]!.GetValue<string>(),
            array[1]!.GetValue<string>());
    }
}

public readonly struct MessageString
{
    public string FullString { get; }
    public string String => FullString[..^GetSuffixLength()];
    public string Suffix => FullString[^GetSuffixLength()..];

    public MessageString(string fullString)
    {
        FullString = fullString;
    }

    public MessageString(string str, string suffix)
    {
        FullString = str + suffix;
    }

    private int GetSuffixLength()
    {
        int i = FullString.Length;
        while (i > 2 && FullString[i - 2] == '%')
        {
            i -= 2;
        }
        return FullString.Length - i;
    }

    internal JsonNode ToJson()
    {
        return new JsonArray
        {
            String,
            Suffix
        };
    }

    internal static MessageString FromJson(JsonNode array)
    {
        return new MessageString(
            array[0]!.GetValue<string>(),
            array[1]!.GetValue<string>());
    }
}

public readonly struct Choice
{
    public required ushort Id { get; init; }
    public required string Text { get; init; }
    public required byte Arg3 { get; init; }
    public required byte Arg4 { get; init; }
    public required byte Arg5 { get; init; }
    public required Op JumpOp
    {
        get => jumpOp;
        init
        {
            if (value.Code != Opcode.JUMP_06 && value.Code != Opcode.JUMP_FILE_07)
            {
                throw new ArgumentException($"jumpOp must be opcode {Opcode.JUMP_06} or {Opcode.JUMP_FILE_07}.");
            }
            jumpOp = value;
        }
    }
    private readonly Op jumpOp;

    internal JsonNode ToJson()
    {
        return new JsonArray
        {
            Id,
            Text,
            Arg3,
            Arg4,
            Arg5,
            JumpOp.ToJson(),
        };
    }

    internal static Choice FromJson(JsonNode array)
    {
        return new Choice
        {
            Id = array[0]!.GetValue<ushort>(),
            Text = array[1]!.GetValue<string>(),
            Arg3 = array[2]!.GetValue<byte>(),
            Arg4 = array[3]!.GetValue<byte>(),
            Arg5 = array[4]!.GetValue<byte>(),
            JumpOp = Op.FromJson(array[5]!, Ws2Version.V1 /* Consistent across versions */),
        };
    }
}

public readonly struct Argument
{
    public readonly object Value { get; private init; }

    public int Label { get => (int)Value; }
    public byte UInt8 { get => (byte)Value; }
    public ushort UInt16 { get => (ushort)Value; }
    public uint UInt32 { get => (uint)Value; }
    public float Float32 { get => (float)Value; }
    public string String { get => (string)Value; }
    public NameString NameString { get => (NameString)Value; }
    public MessageString MessageString { get => (MessageString)Value; }
    public ImmutableArray<ushort> UInt16Array { get => (ImmutableArray<ushort> )Value; }
    public ImmutableArray<string> StringArray { get => (ImmutableArray<string>)Value; }
    public ImmutableArray<Choice> ChoiceArray { get => (ImmutableArray<Choice>)Value; }

    public int Size => Value switch
    {
        int => sizeof(int),
        byte => sizeof(byte),
        ushort => sizeof(ushort),
        uint => sizeof(uint),
        float => sizeof(float),
        string => 1 + SjisEncoding.Encoding.GetByteCount(String),
        NameString v => 1 + SjisEncoding.Encoding.GetByteCount(v.FullString),
        MessageString v => 1 + SjisEncoding.Encoding.GetByteCount(v.FullString),
        ImmutableArray<ushort> v => 1 + (v.Length * sizeof(ushort)),
        ImmutableArray<string> v => 1 + v.Sum(s => 1 + SjisEncoding.Encoding.GetByteCount(s)),
        ImmutableArray<Choice> v => 1 + v.Sum(c => 6 + SjisEncoding.Encoding.GetByteCount(c.Text) + c.JumpOp.Size),
        _ => throw new UnreachableException(),
    };

    public static Argument NewLabel(int v) => new() { Value = v };
    public static Argument NewUInt8(byte v) => new() { Value = v };
    public static Argument NewUInt16(ushort v) => new() { Value = v };
    public static Argument NewUInt32(uint v) => new() { Value = v };
    public static Argument NewFloat32(float v) => new() { Value = v };
    public static Argument NewString(string v) => new() { Value = v };
    public static Argument NewNameString(NameString v) => new() { Value = v };
    public static Argument NewMessageString(MessageString v) => new() { Value = v };
    public static Argument NewUInt16Array(IEnumerable<ushort> v) => new() { Value = ImmutableArray<ushort>.Empty.AddRange(v) };
    public static Argument NewStringArray(IEnumerable<string> v) => new() { Value = ImmutableArray<string>.Empty.AddRange(v) };
    public static Argument NewChoiceArray(IEnumerable<Choice> v) => new() { Value = ImmutableArray<Choice>.Empty.AddRange(v) };

    internal JsonNode ToJson()
    {
        return Value switch
        {
            int v => v,
            byte v => v,
            ushort v => v,
            uint v => v,
            float v => v,
            string v => v,
            NameString v => v.ToJson(),
            MessageString v => v.ToJson(),
            ImmutableArray<ushort> v => new JsonArray(v.Select(x => JsonValue.Create(x)).ToArray()),
            ImmutableArray<string> v => new JsonArray(v.Select(x => JsonValue.Create(x)).ToArray()),
            ImmutableArray<Choice> v => new JsonArray(v.Select(x => x.ToJson()).ToArray()),
            _ => throw new UnreachableException(),
        };
    }

    internal static Argument FromJson(JsonNode node, char type)
    {
        return type switch
        {
            'a' => NewLabel(node.GetValue<int>()),
            'b' => NewUInt8(node.GetValue<byte>()),
            'h' => NewUInt16(node.GetValue<ushort>()),
            'i' => NewUInt32(node.GetValue<uint>()),
            'f' => NewFloat32(node.GetValue<float>()),
            's' => NewString(node.GetValue<string>()),
            'n' => NewNameString(NameString.FromJson(node)),
            'm' => NewMessageString(MessageString.FromJson(node)),
            'H' => NewUInt16Array(node.AsArray().Select(x => x!.GetValue<ushort>())),
            'S' => NewStringArray(node.AsArray().Select(x => x!.GetValue<string>())),
            'C' => NewChoiceArray(node.AsArray().Select(x => Choice.FromJson(x!))),
            _ => throw new ArgumentOutOfRangeException(nameof(type)),
        };
    }
}

public readonly struct Op
{
    public const int EPILOGUE_CODE = -1;
    public const int LABEL_CODE = -2;
    public const int VERSION_CODE = -3;

    internal const int EPILOGUE_SIZE = 8;

    private readonly int code;
    public int Code {
        get => code;
        init
        {
            if (code < -3 || code > 0xFF)
            {
                throw new ArgumentOutOfRangeException(nameof(Code));
            }
            code = value;
        }
    }

    public string? Description => Code switch
    {
        EPILOGUE_CODE => "<Epilogue>",
        LABEL_CODE => "<Label>",
        VERSION_CODE => "<Version>",
        _ => OpFormat.Formats[Code].Description,
    };

    public ImmutableArray<Argument> Arguments { get; init; }

    public IEnumerable<int> Labels
    {
        get
        {
            foreach (var arg in Arguments)
            {
                if (arg.Value is int label)
                {
                    yield return label;
                }
                else if (arg.Value is ImmutableArray<Choice> choices)
                {
                    foreach (var choice in choices)
                    {
                        foreach (var lbl in choice.JumpOp.Labels)
                        {
                            yield return lbl;
                        }
                    }
                }
            }
        }
    }

    public int Size => Code switch
    {
        EPILOGUE_CODE => EPILOGUE_SIZE,
        LABEL_CODE => 0,
        VERSION_CODE => 0,
        _ => 1 + Arguments.Sum(a => a.Size),
    };

    public Op WithArgument(int index, Argument arg) => new()
    {
        Code = Code,
        Arguments = [.. Arguments.Select((a, i) => i == index ? arg : a)],
    };

    private string GetOpName()
    {
        return Code switch
        {
            EPILOGUE_CODE => "<Epilogue>",
            LABEL_CODE => "<Label>",
            VERSION_CODE => "<Version>",
            _ when Description != null => $"{Code:X2} ({Description})",
            _ => $"{Code:X2}",
        };
    }

    private static int GetOpCode(string name)
    {
        switch (name)
        {
            case "<Epilogue>":
                return EPILOGUE_CODE;
            case "<Label>":
                return LABEL_CODE;
            case "<Version>":
                return VERSION_CODE;
            default:
                try
                {
                    return byte.Parse(name[..2], System.Globalization.NumberStyles.HexNumber);
                }
                catch (Exception ex)
                {
                    throw new InvalidDataException($"Invalid hex op code '{name}'", ex);
                }
        }
    }

    internal JsonNode ToJson()
    {
        if (Code == 0x0F)
        {
            // For choice op: avoid creating an array just to contain a single array.
            // i.e. [[ ... ]] -> [ ... ]
            return new JsonObject
            {
                ["op"] = GetOpName(),
                ["args"] = Arguments[0].ToJson(),
            };
        }
        else
        {
            return new JsonObject
            {
                ["op"] = GetOpName(),
                ["args"] = new JsonArray(Arguments
                    .Select(a => a.ToJson())
                    .ToArray()),
            };
        }
    }

    internal static Op FromJson(JsonNode node, Ws2Version version)
    {
        var code = GetOpCode(node["op"]!.GetValue<string>());
        var args = node["args"]!.AsArray();
        if (code == 0x0F)
        {
            // Choice
            return new Op
            {
                Code = code,
                Arguments = [Argument.FromJson(args, 'C')],
            };
        }
        else
        {
            string format = code switch
            {
                EPILOGUE_CODE => "bbbbbbbb",
                LABEL_CODE => "a",
                VERSION_CODE => "s",
                _ => OpFormat.Formats[code].VersionFormats[(int)version]
                    ?? throw new InvalidDataException($"Op code {code:X2} is not supported in version {version}"),
            };
            return new Op
            {
                Code = code,
                Arguments = [.. args.Select((a, i) => Argument.FromJson(a!, format[i]))],
            };
        }
    }
}
