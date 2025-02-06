using System.Collections.Immutable;
using System.Diagnostics;
using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

/// <summary>
/// A string used by the engine for names.
/// The string may contain a special prefix.
/// </summary>
public readonly struct NameString
{
    /// <summary>
    /// The full string, including the prefix.
    /// </summary>
    public string FullString { get; }

    /// <summary>
    /// The prefix of the string.
    /// </summary>
    public string Prefix => FullString[..GetPrefixLength()];

    /// <summary>
    /// The string without the prefix.
    /// </summary>
    public string String => FullString[GetPrefixLength()..];

    /// <summary>
    /// Creates a new NameString with the given full string.
    /// </summary>
    /// <param name="fullString"></param>
    public NameString(string fullString)
    {
        FullString = fullString;
    }

    /// <summary>
    /// Creates a new NameString with the given prefix and string.
    /// </summary>
    /// <param name="prefix"></param>
    /// <param name="str"></param>
    public NameString(string prefix, string str)
    {
        FullString = prefix + str;
    }

    /// <summary>
    /// Creates a new NameString from this NameString
    /// with a different prefix, but the same string.
    /// </summary>
    /// <param name="prefix"></param>
    /// <returns></returns>
    public NameString WithPrefix(string prefix)
    {
        return new NameString(prefix, String);
    }

    /// <summary>
    /// Creates a new NameString from this NameString
    /// with a different string, but the same prefix.
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public NameString WithString(string str)
    {
        return new NameString(Prefix, str);
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

/// <summary>
/// A string used by the engine for messages.
/// The string may contain a special suffix.
/// </summary>
public readonly struct MessageString
{
    /// <summary>
    /// The full string, including the suffix.
    /// </summary>
    public string FullString { get; }

    /// <summary>
    /// The string without the suffix.
    /// </summary>
    public string String => FullString[..^GetSuffixLength()];

    /// <summary>
    /// The suffix of the string.
    /// </summary>
    public string Suffix => FullString[^GetSuffixLength()..];

    /// <summary>
    /// Creates a new MessageString with the given full string.
    /// </summary>
    /// <param name="fullString"></param>
    public MessageString(string fullString)
    {
        FullString = fullString;
    }

    /// <summary>
    /// Creates a new MessageString with the given string and suffix.
    /// </summary>
    /// <param name="str"></param>
    /// <param name="suffix"></param>
    public MessageString(string str, string suffix)
    {
        FullString = str + suffix;
    }

    /// <summary>
    /// Creates a new MessageString from this MessageString
    /// with a different string, but the same suffix.
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public MessageString WithString(string str)
    {
        return new MessageString(str, Suffix);
    }

    /// <summary>
    /// Creates a new MessageString from this MessageString
    /// with a different suffix, but the same string.
    /// </summary>
    /// <param name="suffix"></param>
    /// <returns></returns>
    public MessageString WithSuffix(string suffix)
    {
        return new MessageString(String, suffix);
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

/// <summary>
/// A choice argument type.
/// </summary>
public readonly struct Choice
{
    /// <summary>
    /// The ID of the choice.
    /// </summary>
    public required ushort Id { get; init; }

    /// <summary>
    /// The text of the choice.
    /// </summary>
    public required string Text { get; init; }

    /// <summary>
    /// Unknown byte.
    /// </summary>
    public required byte Arg3 { get; init; }

    /// <summary>
    /// Unknown byte.
    /// </summary>
    public required byte Arg4 { get; init; }

    /// <summary>
    /// Unknown byte.
    /// </summary>
    public required byte Arg5 { get; init; }

    /// <summary>
    /// The instruction to run when this choice is selected.
    /// Must be either <see cref="Opcode.JUMP_06"/> or <see cref="Opcode.JUMP_FILE_07"/>.
    /// </summary>
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

/// <summary>
/// An argument for an opcode.
/// </summary>
public readonly struct Argument
{
    /// <summary>
    /// The value of the argument as an object.
    /// </summary>
    public readonly object Value { get; private init; }

    /// <summary>
    /// The label value.
    /// </summary>
    public int Label { get => (int)Value; }

    /// <summary>
    /// The uint8 value.
    /// </summary>
    public byte UInt8 { get => (byte)Value; }

    /// <summary>
    /// The uint16 value.
    /// </summary>
    public ushort UInt16 { get => (ushort)Value; }

    /// <summary>
    /// The uint32 value.
    /// </summary>
    public uint UInt32 { get => (uint)Value; }

    /// <summary>
    /// The float32 value.
    /// </summary>
    public float Float32 { get => (float)Value; }

    /// <summary>
    /// The string value.
    /// </summary>
    public string String { get => (string)Value; }

    /// <summary>
    /// The NameString value.
    /// </summary>
    public NameString NameString { get => (NameString)Value; }

    /// <summary>
    /// The MessageString value.
    /// </summary>
    public MessageString MessageString { get => (MessageString)Value; }

    /// <summary>
    /// The uint16 array value.
    /// </summary>
    public ImmutableArray<ushort> UInt16Array { get => (ImmutableArray<ushort> )Value; }

    /// <summary>
    /// The string array value.
    /// </summary>
    public ImmutableArray<string> StringArray { get => (ImmutableArray<string>)Value; }

    /// <summary>
    /// The choice array value.
    /// </summary>
    public ImmutableArray<Choice> ChoiceArray { get => (ImmutableArray<Choice>)Value; }

    /// <summary>
    /// The size of the argument in bytes.
    /// </summary>
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

    /// <summary>
    /// Creates a label argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewLabel(int v) => new() { Value = v };

    /// <summary>
    /// Creates a uint8 argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewUInt8(byte v) => new() { Value = v };

    /// <summary>
    /// Creates a uint16 argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewUInt16(ushort v) => new() { Value = v };

    /// <summary>
    /// Creates a uint32 argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewUInt32(uint v) => new() { Value = v };

    /// <summary>
    /// Creates a float32 argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewFloat32(float v) => new() { Value = v };

    /// <summary>
    /// Creates a string argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewString(string v) => new() { Value = v };

    /// <summary>
    /// Creates a NameString argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewNameString(NameString v) => new() { Value = v };

    /// <summary>
    /// Creates a MessageString argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewMessageString(MessageString v) => new() { Value = v };

    /// <summary>
    /// Creates a uint16 array argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewUInt16Array(IEnumerable<ushort> v) => new() { Value = ImmutableArray<ushort>.Empty.AddRange(v) };

    /// <summary>
    /// Creates a string array argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewStringArray(IEnumerable<string> v) => new() { Value = ImmutableArray<string>.Empty.AddRange(v) };

    /// <summary>
    /// Creates a choice array argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
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

/// <summary>
/// An instruction in a WS2 script.
/// </summary>
public readonly struct Op
{
    internal const int EPILOGUE_SIZE = 8;

    /// <summary>
    /// The opcode.
    /// See <see cref="Opcode"/>.
    /// </summary>
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
    private readonly int code;

    /// <summary>
    /// The description of the opcode if it is known.
    /// </summary>
    public string? Description => Code switch
    {
        Opcode.EPILOGUE => "<Epilogue>",
        Opcode.LABEL => "<Label>",
        Opcode.VERSION => "<Version>",
        _ => OpFormat.Formats[Code].Description,
    };

    /// <summary>
    /// The arguments of the op.
    /// </summary>
    public ImmutableArray<Argument> Arguments
    {
        get => arguments.IsDefault ? [] : arguments;
        init => arguments = value;
    }
    private readonly ImmutableArray<Argument> arguments;

    /// <summary>
    /// The labels that this op references.
    /// </summary>
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

    /// <summary>
    /// The size of the op in bytes.
    /// </summary>
    public int Size => Code switch
    {
        Opcode.EPILOGUE => EPILOGUE_SIZE,
        Opcode.LABEL => 0,
        Opcode.VERSION => 0,
        _ => 1 + Arguments.Sum(a => a.Size),
    };

    /// <summary>
    /// Creates a new op from this with the given argument
    /// replacing the argument at the given index.
    /// </summary>
    /// <param name="index"></param>
    /// <param name="arg"></param>
    /// <returns></returns>
    public Op WithArgument(int index, Argument arg) => new()
    {
        Code = Code,
        Arguments = [.. Arguments.Select((a, i) => i == index ? arg : a)],
    };

    private string GetOpName()
    {
        return Code switch
        {
            Opcode.EPILOGUE => "<Epilogue>",
            Opcode.LABEL => "<Label>",
            Opcode.VERSION => "<Version>",
            _ when Description != null => $"{Code:X2} ({Description})",
            _ => $"{Code:X2}",
        };
    }

    private static int GetOpCode(string name)
    {
        switch (name)
        {
            case "<Epilogue>":
                return Opcode.EPILOGUE;
            case "<Label>":
                return Opcode.LABEL;
            case "<Version>":
                return Opcode.VERSION;
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
                Opcode.EPILOGUE => "bbbbbbbb",
                Opcode.LABEL => "a",
                Opcode.VERSION => "s",
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
