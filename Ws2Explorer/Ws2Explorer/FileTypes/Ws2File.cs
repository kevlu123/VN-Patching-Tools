using System.Collections.Immutable;
using System.Text.Json.Nodes;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A WS2 script file.
/// </summary>
public sealed class Ws2File : ScriptFile, IArchive<Ws2File>
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
    public override ScriptText[] Text
    {
        get
        {
            var currentName = "";
            return Ops.SelectMany(op =>
            {
                switch (op.Code)
                {
                    case Opcode.WS2_SHOW_CHOICE_0F:
                        return op.Arguments[0].Ws2ChoiceArray
                            .Select(c => new ScriptText { Text = c.Text, Name = "", IsChoice = true });
                    case Opcode.WS2_DISPLAY_NAME_15:
                        currentName = op.Arguments[0].AffixedString.String.Trim(' ', '\u3000');
                        return [];
                    case Opcode.WS2_DISPLAY_TEXT_14:
                        return [new ScriptText { Text = op.Arguments[2].AffixedString.String, Name = currentName, IsChoice = false }];
                    default:
                        return [];
                }
            }).ToArray();
        }
    }

    /// <summary>
    /// Get the list of unique speaker names in this script.
    /// </summary>
    public override string[] Names => Ops
        .Where(op => op.Code == Opcode.WS2_DISPLAY_NAME_15)
        .Select(op => op.Arguments[0].AffixedString.String)
        .Distinct()
        .ToArray();

    /// <summary>
    /// Create a new WS2 file with the message and choice text replaced.
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public override Ws2File WithText(IEnumerable<string> text)
    {
        return ArchiveCreationException.Wrap(() => new Ws2File(OpsWithText(Ops, text.ToArray())));
    }

    private static List<Op> OpsWithText(IEnumerable<Op> ops, string[] text)
    {
        var newOps = new List<Op>();
        int i = 0;
        foreach (var op in ops)
        {
            switch (op.Code)
            {
                case Opcode.WS2_SHOW_CHOICE_0F:
                    var newChoices = op.Arguments[0].Ws2ChoiceArray.Select(c =>
                    {
                        if (i >= text.Length)
                        {
                            throw new ArgumentException("Not enough strings supplied");
                        }
                        return c.WithText(text[i++]);
                    });
                    newOps.Add(op.WithArgument(0, Argument.NewWs2ChoiceArray(newChoices)));
                    break;
                case Opcode.WS2_DISPLAY_TEXT_14:
                    if (i >= text.Length)
                    {
                        throw new ArgumentException("Not enough strings supplied");
                    }
                    var newArg = op.Arguments[2].AffixedString.WithString(text[i++]);
                    newOps.Add(op.WithArgument(2, Argument.NewAffixedString(newArg)));
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
    /// Create a new WS2 file with the names replaced according to the given mapping.
    /// Names not in the mapping are left unchanged.
    /// </summary>
    /// <param name="mapping"></param>
    /// <returns></returns>
    public override Ws2File WithNames(IDictionary<string, string> mapping)
    {
        var newOps = new List<Op>();
        foreach (var op in Ops)
        {
            if (op.Code == Opcode.WS2_DISPLAY_NAME_15)
            {
                var oldNameString = op.Arguments[0].AffixedString;
                var oldName = oldNameString.String;
                var newName = mapping.TryGetValue(oldName, out var value) ? value : oldName;
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
        return ArchiveCreationException.Wrap(() => new Ws2File(newOps));
    }

    /// <summary>
    /// Constructs a WS2 file from a list of ops.
    /// </summary>
    /// <param name="ops"></param>
    public Ws2File(IEnumerable<Op> ops)
    {
        if (!ScriptCompiler.GetScriptVersion(ops).IsWs2())
        {
            throw new ArgumentException("Ops must be for a WS2 script.", nameof(ops));
        }
        Ops = [.. ops];
        Stream = ScriptCompiler.Compile(ops, out hasUnresolvedLabels);
    }


    private Ws2File(BinaryStream stream, out DecodeConfidence confidence)
    {
        Ops = [.. ScriptCompiler.DecompileWs2(stream, out _, out hasUnresolvedLabels)];
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = ((ReadOnlySpan<byte>)stream.Span).ContainsAnyExcept<byte>(0) && stream.Length > 16
            ? DecodeConfidence.High
            : DecodeConfidence.Low;
    }

    private Ws2File(IDictionary<string, BinaryStream> contents)
    {
        if (!contents.TryGetValue(OPS_FILENAME, out var opsStream))
        {
            throw new ArchiveCreationException($"WS2 file must contain '{OPS_FILENAME}'.");
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
    /// Decodes a WS2 file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static Ws2File Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new Ws2File(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Constructs a WS2 file from subfiles.
    /// Only <see cref="ScriptFile.OPS_FILENAME"/> is required.
    /// If <see cref="ScriptFile.NEW_TEXT_FILENAME"/> is present,
    /// that file is used to overwrite the message and choice text.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    static Ws2File IArchive<Ws2File>.Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new Ws2File(contents));
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
        return ArchiveCreationException.Wrap(() => new Ws2File(contents));
    }
}
