using System.Collections.Immutable;
using System.Diagnostics;
using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

/// <summary>
/// An absolute address.
/// </summary>
/// <param name="address"></param>
public readonly struct Label(int address)
{
    /// <summary>
    /// The absolute address as bytes from the beginning of the script.
    /// </summary>
    public int Address { get; } = address;
}

/// <summary>
/// A relative address.
/// </summary>
/// <param name="relativeAddress"></param>
/// <param name="computedAbsAddress"></param>
public readonly struct RelativeLabel(int relativeAddress, int computedAbsAddress)
{
    /// <summary>
    /// The relative address as bytes from the end of the current op.
    /// </summary>
    public int RelativeAddress { get; } = relativeAddress;

    /// <summary>
    /// The computed absolute address as bytes from the beginning of the script.
    /// This value does not appear in the compiled script and is only used by the compiler.
    /// </summary>
    public int ComputedAbsoluteAddress { get; } = computedAbsAddress;
}

/// <summary>
/// A string used by the engine for names and messages.
/// The string may contain a special prefix or suffix.
/// </summary>
public readonly struct AffixedString
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
    /// The string without the prefix or suffix.
    /// </summary>
    public string String => FullString[GetPrefixLength()..^GetSuffixLength()];

    /// <summary>
    /// The suffix of the string.
    /// </summary>
    public string Suffix => FullString[^GetSuffixLength()..];

    /// <summary>
    /// Creates a new AffixedString with the given
    /// full string including prefix and suffix.
    /// </summary>
    /// <param name="fullString"></param>
    public AffixedString(string fullString)
    {
        FullString = fullString;
    }

    /// <summary>
    /// Creates a new AffixedString with the given prefix, string, and suffix.
    /// </summary>
    /// <param name="prefix"></param>
    /// <param name="str"></param>
    /// <param name="suffix"></param>
    public AffixedString(string prefix, string str, string suffix)
    {
        FullString = prefix + str + suffix;
    }

    /// <summary>
    /// Creates a new AffixedString from this AffixedString
    /// with a different prefix, but the same string and suffix.
    /// </summary>
    /// <param name="prefix"></param>
    /// <returns></returns>
    public AffixedString WithPrefix(string prefix)
    {
        return new AffixedString(prefix, String, Suffix);
    }

    /// <summary>
    /// Creates a new AffixedString from this AffixedString
    /// with a different string, but the same prefix and suffix.
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public AffixedString WithString(string str)
    {
        return new AffixedString(Prefix, str, Suffix);
    }

    /// <summary>
    /// Creates a new AffixedString from this AffixedString
    /// with a different suffix, but the same prefix and string.
    /// </summary>
    /// <param name="suffix"></param>
    /// <returns></returns>
    public AffixedString WithSuffix(string suffix)
    {
        return new AffixedString(Prefix, String, suffix);
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
            Prefix,
            String,
            Suffix
        };
    }

    internal static AffixedString FromJson(JsonNode array)
    {
        return new AffixedString(
            array[0]!.GetValue<string>(),
            array[1]!.GetValue<string>(),
            array[2]!.GetValue<string>());
    }
}

/// <summary>
/// A WS2 choice argument type.
/// </summary>
public readonly struct Ws2Choice
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
    /// Must be either <see cref="Opcode.WS2_JUMP_06"/> or <see cref="Opcode.WS2_JUMP_FILE_07"/>.
    /// </summary>
    public required Op JumpOp
    {
        get => jumpOp;
        init
        {
            if (value.Code != Opcode.WS2_JUMP_06 && value.Code != Opcode.WS2_JUMP_FILE_07)
            {
                throw new ArgumentException($"JumpOp must be opcode {Opcode.WS2_JUMP_06} or {Opcode.WS2_JUMP_FILE_07}.");
            }
            jumpOp = value;
        }
    }
    private readonly Op jumpOp;

    internal JsonNode ToJson(ScriptVersion version)
    {
        return new JsonArray
        {
            Id,
            Text,
            Arg3,
            Arg4,
            Arg5,
            JumpOp.ToJson(version),
        };
    }

    internal static Ws2Choice FromJson(JsonNode array, ScriptVersion version)
    {
        return new Ws2Choice
        {
            Id = array[0]!.GetValue<ushort>(),
            Text = array[1]!.GetValue<string>(),
            Arg3 = array[2]!.GetValue<byte>(),
            Arg4 = array[3]!.GetValue<byte>(),
            Arg5 = array[4]!.GetValue<byte>(),
            JumpOp = Op.FromJson(array[5]!, version),
        };
    }
}

/// <summary>
/// A WSC choice argument type.
/// </summary>
public readonly struct WscChoice
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
    /// Must be either <see cref="Opcode.WSC_JUMP_06"/> or <see cref="Opcode.WSC_JUMP_FILE_07"/>.
    /// </summary>
    public required Op JumpOp
    {
        get => jumpOp;
        init
        {
            if (value.Code != Opcode.WSC_JUMP_06 && value.Code != Opcode.WSC_JUMP_FILE_07)
            {
                throw new ArgumentException($"JumpOp must be opcode {Opcode.WSC_JUMP_06} or {Opcode.WSC_JUMP_FILE_07}.");
            }
            jumpOp = value;
        }
    }
    private readonly Op jumpOp;

    internal JsonNode ToJson(ScriptVersion version)
    {
        return new JsonArray
        {
            Id,
            Text,
            Arg3,
            Arg4,
            Arg5,
            JumpOp.ToJson(version),
        };
    }

    internal static WscChoice FromJson(JsonNode array, ScriptVersion version)
    {
        return new WscChoice
        {
            Id = array[0]!.GetValue<ushort>(),
            Text = array[1]!.GetValue<string>(),
            Arg3 = array[2]!.GetValue<byte>(),
            Arg4 = array[3]!.GetValue<byte>(),
            Arg5 = array[4]!.GetValue<byte>(),
            JumpOp = Op.FromJson(array[5]!, version),
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
    public Label Label { get => (Label)Value; }

    /// <summary>
    /// The relative label value.
    /// </summary>
    public RelativeLabel RelativeLabel { get => (RelativeLabel)Value; }

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
    /// The AffixedString value.
    /// </summary>
    public AffixedString AffixedString { get => (AffixedString)Value; }

    /// <summary>
    /// The uint16 array value.
    /// </summary>
    public ImmutableArray<ushort> UInt16Array { get => (ImmutableArray<ushort> )Value; }

    /// <summary>
    /// The string array value.
    /// </summary>
    public ImmutableArray<string> StringArray { get => (ImmutableArray<string>)Value; }

    /// <summary>
    /// The WS2 choice array value.
    /// </summary>
    public ImmutableArray<Ws2Choice> Ws2ChoiceArray { get => (ImmutableArray<Ws2Choice>)Value; }

    /// <summary>
    /// The WSC choice array value.
    /// </summary>
    public ImmutableArray<WscChoice> WscChoiceArray { get => (ImmutableArray<WscChoice>)Value; }

    /// <summary>
    /// The size of the argument in bytes.
    /// </summary>
    public int Size => Value switch
    {
        Compiler.Label => 4,
        Compiler.RelativeLabel => 4,
        byte => 1,
        ushort => 2,
        uint => 4,
        float => 4,
        string => 1 + SjisEncoding.Encoding.GetByteCount(String),
        AffixedString v => 1 + SjisEncoding.Encoding.GetByteCount(v.FullString),
        ImmutableArray<ushort> v => 1 + (v.Length * 2),
        ImmutableArray<string> v => 1 + v.Sum(s => 1 + SjisEncoding.Encoding.GetByteCount(s)),
        ImmutableArray<Ws2Choice> v => 1 + v.Sum(c => 6 + SjisEncoding.Encoding.GetByteCount(c.Text) + c.JumpOp.Size),
        ImmutableArray<WscChoice> v => 2 + v.Sum(c => 6 + SjisEncoding.Encoding.GetByteCount(c.Text) + c.JumpOp.Size),
        _ => throw new UnreachableException(),
    };

    /// <summary>
    /// Creates a label argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewLabel(Label v) => new() { Value = v };

    /// <summary>
    /// Creates a relative label argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewRelativeLabel(RelativeLabel v) => new() { Value = v };

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
    /// Creates an AffixedString argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewAffixedString(AffixedString v) => new() { Value = v };

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
    /// Creates a WS2 choice array argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewWs2ChoiceArray(IEnumerable<Ws2Choice> v) => new() { Value = ImmutableArray<Ws2Choice>.Empty.AddRange(v) };

    /// <summary>
    /// Creates a WSC choice array argument.
    /// </summary>
    /// <param name="v"></param>
    /// <returns></returns>
    public static Argument NewWscChoiceArray(IEnumerable<WscChoice> v) => new() { Value = ImmutableArray<WscChoice>.Empty.AddRange(v) };

    internal JsonNode ToJson(ScriptVersion version)
    {
        return Value switch
        {
            Label v => v.Address,
            RelativeLabel v => v.ComputedAbsoluteAddress,
            byte v => v,
            ushort v => v,
            uint v => v,
            float v => v,
            string v => v,
            AffixedString v => v.ToJson(),
            ImmutableArray<ushort> v => new JsonArray(v.Select(x => JsonValue.Create(x)).ToArray()),
            ImmutableArray<string> v => new JsonArray(v.Select(x => JsonValue.Create(x)).ToArray()),
            ImmutableArray<Ws2Choice> v => new JsonArray(v.Select(x => x.ToJson(version)).ToArray()),
            ImmutableArray<WscChoice> v => new JsonArray(v.Select(x => x.ToJson(version)).ToArray()),
            _ => throw new UnreachableException(),
        };
    }

    internal static Argument FromJson(JsonNode node, char type, ScriptVersion version)
    {
        return type switch
        {
            'a' => NewLabel(new(node.GetValue<int>())),
            'r' => NewRelativeLabel(new(0 /* Placeholder */, node.GetValue<int>())),
            'b' => NewUInt8(node.GetValue<byte>()),
            'h' => NewUInt16(node.GetValue<ushort>()),
            'i' => NewUInt32(node.GetValue<uint>()),
            'f' => NewFloat32(node.GetValue<float>()),
            's' => NewString(node.GetValue<string>()),
            't' => NewAffixedString(AffixedString.FromJson(node)),
            'H' => NewUInt16Array(node.AsArray().Select(x => x!.GetValue<ushort>())),
            'S' => NewStringArray(node.AsArray().Select(x => x!.GetValue<string>())),
            'C' => NewWs2ChoiceArray(node.AsArray().Select(x => Ws2Choice.FromJson(x!, version))),
            'D' => NewWscChoiceArray(node.AsArray().Select(x => WscChoice.FromJson(x!, version))),
            _ => throw new ArgumentOutOfRangeException(nameof(type)),
        };
    }
}

/// <summary>
/// An instruction in a WS2 script.
/// </summary>
public readonly struct Op
{
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
    public string? GetDescription(ScriptVersion version) => Code switch
    {
        Opcode.LABEL => "<Label>",
        Opcode.VERSION => "<Version>",
        _ => OpFormat.Formats[(int)version][Code]?.Description,
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
                if (arg.Value is Label label)
                {
                    yield return label.Address;
                }
                else if (arg.Value is RelativeLabel relLabel)
                {
                    yield return relLabel.ComputedAbsoluteAddress;
                }
                else if (arg.Value is ImmutableArray<Ws2Choice> ws2Choices)
                {
                    foreach (var choice in ws2Choices)
                    {
                        foreach (var lbl in choice.JumpOp.Labels)
                        {
                            yield return lbl;
                        }
                    }
                }
                else if (arg.Value is ImmutableArray<WscChoice> wscChoices)
                {
                    foreach (var choice in wscChoices)
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

    private string GetOpName(ScriptVersion version)
    {
        return Code switch
        {
            Opcode.LABEL => "<Label>",
            Opcode.VERSION => "<Version>",
            _ when GetDescription(version) != null => $"{Code:X2} ({GetDescription(version)})",
            _ => $"{Code:X2}",
        };
    }

    private static int GetOpCode(string name)
    {
        switch (name)
        {
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

    internal JsonNode ToJson(ScriptVersion version)
    {
        // For choice op: avoid creating an array just to contain a single array.
        // i.e. [[ ... ]] -> [ ... ]
        if ((version.IsWs2() && Code == Opcode.WS2_SHOW_CHOICE_0F) ||
            (version.IsWsc() && Code == Opcode.WSC_SHOW_CHOICE_02))
        {
            return new JsonObject
            {
                ["op"] = GetOpName(version),
                ["args"] = Arguments[0].ToJson(version),
            };
        }
        else
        {
            return new JsonObject
            {
                ["op"] = GetOpName(version),
                ["args"] = new JsonArray(Arguments
                    .Select(a => a.ToJson(version))
                    .ToArray()),
            };
        }
    }

    internal static Op FromJson(JsonNode node, ScriptVersion version)
    {
        var code = GetOpCode(node["op"]!.GetValue<string>());
        var args = node["args"]!.AsArray();
        if (version.IsWs2() && code == Opcode.WS2_SHOW_CHOICE_0F)
        {
            return new Op
            {
                Code = code,
                Arguments = [Argument.FromJson(args, 'C', version)],
            };
        }
        else if (version.IsWsc() && code == Opcode.WSC_SHOW_CHOICE_02)
        {
            return new Op
            {
                Code = code,
                Arguments = [Argument.FromJson(args, 'D', version)],
            };
        }
        else
        {
            string format = code switch
            {
                Opcode.LABEL => "a",
                Opcode.VERSION => "s",
                _ => OpFormat.Formats[(int)version][code]?.Format
                    ?? throw new InvalidDataException($"Op code {code:X2} is not supported in version {version}"),
            };
            return new Op
            {
                Code = code,
                Arguments = [.. args.Select((a, i) => Argument.FromJson(a!, format[i], version))],
            };
        }
    }
}
