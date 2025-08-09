using System.Collections.Immutable;
using System.Text.Json.Nodes;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A WSC script file.
/// </summary>
public sealed class WscFile : ScriptFile, IArchive<WscFile>
{
    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public override BinaryStream Stream { get; }

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public override ImmutableArray<Op> Ops { get; }

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public override bool HasUnresolvedLabels => hasUnresolvedLabels;
    private readonly bool hasUnresolvedLabels;

    /// <summary>
    /// Get the message and choice text.
    /// </summary>
    public override ScriptText[] Text => Ops.SelectMany(op =>
    {
        switch (op.Code)
        {
            case Opcode.WSC_SHOW_CHOICE_02:
                return op.Arguments[0].WscChoiceArray
                    .Select(c => new ScriptText { Text = c.Text, Name = "", IsChoice = true });
            case Opcode.WSC_DISPLAY_TEXT_41:
                return [new ScriptText { Text = op.Arguments[3].AffixedString.String, Name = "", IsChoice = false }];
            case Opcode.WSC_DISPLAY_TEXT_AND_NAME_42:
                var text = op.Arguments[4].AffixedString.String;
                var name = op.Arguments[3].AffixedString.String;
                return [new ScriptText { Text = text, Name = name, IsChoice = false }];
            default:
                return [];
        }
    }).ToArray();

    /// <summary>
    /// Get the list of unique speaker names in this script.
    /// </summary>
    public override string[] Names => Ops
        .Where(op => op.Code == Opcode.WSC_DISPLAY_TEXT_AND_NAME_42)
        .Select(op => op.Arguments[3].AffixedString.String)
        .Distinct()
        .ToArray();

    /// <summary>
    /// Create a new WSC file with the message and choice text replaced.
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public override WscFile WithText(string[] text)
    {
        return ArchiveCreationException.Wrap(() => new WscFile(OpsWithText(Ops, text)));
    }

    private static List<Op> OpsWithText(IEnumerable<Op> ops, string[] text)
    {
        var newOps = new List<Op>();
        int i = 0;
        foreach (var op in ops)
        {
            switch (op.Code)
            {
                case Opcode.WSC_SHOW_CHOICE_02:
                    var newChoices = op.Arguments[0].WscChoiceArray.Select(c =>
                    {
                        if (i >= text.Length)
                        {
                            throw new ArgumentException("Not enough strings supplied");
                        }
                        return c.WithText(text[i++]);
                    });
                    newOps.Add(op.WithArgument(0, Argument.NewWscChoiceArray(newChoices)));
                    break;
                case Opcode.WSC_DISPLAY_TEXT_41:
                    if (i >= text.Length)
                    {
                        throw new ArgumentException("Not enough strings supplied");
                    }
                    var newArg = op.Arguments[3].AffixedString.WithString(text[i++]);
                    newOps.Add(op.WithArgument(3, Argument.NewAffixedString(newArg)));
                    break;
                case Opcode.WSC_DISPLAY_TEXT_AND_NAME_42:
                    if (i >= text.Length)
                    {
                        throw new ArgumentException("Not enough strings supplied");
                    }
                    var newArg2 = op.Arguments[4].AffixedString.WithString(text[i++]);
                    newOps.Add(op.WithArgument(4, Argument.NewAffixedString(newArg2)));
                    break;
                default:
                    newOps.Add(op);
                    break;
            }
        }
        if (i < text.Length)
        {
            throw new ArgumentException("Too many strings supplied");
        }
        return newOps;
    }

    /// <summary>
    /// Create a new WSC file with the names replaced according to the given mapping.
    /// Names not in the mapping are left unchanged.
    /// </summary>
    /// <param name="mapping"></param>
    /// <returns></returns>
    public override WscFile WithNames(IDictionary<string, string> mapping)
    {
        var newOps = new List<Op>();
        foreach (var op in Ops)
        {
            if (op.Code == Opcode.WSC_DISPLAY_TEXT_AND_NAME_42)
            {
                var oldNameString = op.Arguments[3].AffixedString;
                var oldName = oldNameString.String;
                var newName = mapping.TryGetValue(oldName, out var value) ? value : oldName;
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
        return ArchiveCreationException.Wrap(() => new WscFile(newOps));
    }

    /// <summary>
    /// Constructs a WSC file from a list of ops.
    /// </summary>
    /// <param name="ops"></param>
    public WscFile(IEnumerable<Op> ops)
    {
        if (!ScriptCompiler.GetScriptVersion(ops).IsWsc())
        {
            throw new ArgumentException("Ops must be for a WSC script.", nameof(ops));
        }
        Ops = [.. ops];
        Stream = ScriptCompiler.Compile(ops, out hasUnresolvedLabels);
    }

    private WscFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        Ops = [.. ScriptCompiler.DecompileWsc(stream, out _, out hasUnresolvedLabels)];
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = ((ReadOnlySpan<byte>)stream.Span).ContainsAnyExcept<byte>(0) && stream.Length > 16
            ? DecodeConfidence.High
            : DecodeConfidence.Low;
    }

    private WscFile(IDictionary<string, BinaryStream> contents)
    {
        if (!contents.TryGetValue(OPS_FILENAME, out var opsStream))
        {
            throw new ArchiveCreationException($"WSC file must contain '{OPS_FILENAME}'.");
        }
        using var textFile = opsStream
            .Decode<TextFile>(decRef: false).Result;
        Ops = [.. ScriptCompiler.FromJson(textFile.Text)];

        if (contents.TryGetValue(NEW_TEXT_FILENAME, out var newTextStream))
        {
            var json = JsonNode.Parse(newTextStream.Span);
            var newText = json!.AsArray().Select(ScriptText.FromJson!).ToArray();
            Ops = [.. OpsWithText(Ops, newText.Select(t => t.Text).ToArray())];
        }
        Stream = ScriptCompiler.Compile(Ops, out hasUnresolvedLabels);
    }

    /// <summary>
    /// Decodes a WSC file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static WscFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new WscFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a WSC file from subfiles.
    /// Only <see cref="ScriptFile.OPS_FILENAME"/> is required.
    /// If <see cref="ScriptFile.NEW_TEXT_FILENAME"/> is present,
    /// that file is used to overwrite the message and choice text.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    static WscFile IArchive<WscFile>.Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new WscFile(contents));
    }

    /// <summary>
    /// Constructs a WSC file from subfiles.
    /// Only <see cref="ScriptFile.OPS_FILENAME"/> is required.
    /// If <see cref="ScriptFile.NEW_TEXT_FILENAME"/> is present,
    /// that file is used to overwrite the message and choice text.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public override IArchive Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new WscFile(contents));
    }
}
