using Microsoft.VisualBasic;
using System.Collections.Immutable;
using System.Text.Json.Nodes;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// Script text. This is either message text or choice text.
/// </summary>
public class ScriptText
{
    /// <summary>
    /// The text of the message or choice.
    /// </summary>
    public required string Text { get; init; }

    /// <summary>
    /// The name of the character speaking or an empty string if there is none.
    /// </summary>
    public required string Name { get; init; }

    /// <summary>
    /// Whether this text is for a choice or not.
    /// </summary>
    public required bool IsChoice { get; init; }

    internal JsonNode ToJson()
    {
        return new JsonObject
        {
            ["choice"] = IsChoice,
            ["name"] = Name,
            ["text"] = Text,
        };
    }

    internal static ScriptText FromJson(JsonNode json)
    {
        return new ScriptText
        {
            IsChoice = json["choice"]!.GetValue<bool>(),
            Name = json["name"]!.GetValue<string>(),
            Text = json["text"]!.GetValue<string>(),
        };
    }
}

/// <summary>
/// Base for Ws2File and WscFile.
/// </summary>
public abstract class ScriptFile : IArchive
{
    internal delegate List<Op> DecompileFn(BinaryStream stream, out ScriptVersion version, out bool hasUnresolvedLabels);

    /// <summary>
    /// The filename of the summary file.
    /// The summary file contains a human-readable summary of the script.
    /// </summary>
    public const string SUMMARY_FILENAME = "summary.txt";

    /// <summary>
    /// The filename of the text file.
    /// The text file contains the script's message and choice text in JSON format.
    /// </summary>
    public const string TEXT_FILENAME = "text.json";

    /// <summary>
    /// The filename of the new-text file.
    /// When creating a new script file, if the new-text file
    /// is present, it overwrites the script's message and choice text.
    /// This file is in the same format as the text file.
    /// A possible workflow is to take the text file, edit it,
    /// and reinsert it as the new-text file.
    /// </summary>
    public const string NEW_TEXT_FILENAME = "new_text.json";

    /// <summary>
    /// The filename of the ops file.
    /// The ops file contains the script instructions in JSON format.
    /// </summary>
    public const string OPS_FILENAME = "ops.json";

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public abstract BinaryStream Stream { get; }

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public abstract ImmutableArray<Op> Ops { get; }

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public abstract bool HasUnresolvedLabels { get; }

    /// <summary>
    /// The version of the script.
    /// </summary>
    public ScriptVersion Version => Enum.Parse<ScriptVersion>(Ops[0].Arguments[0].String);

    /// <summary>
    /// Get the message and choice text.
    /// </summary>
    public abstract ScriptText[] Text { get; }

    /// <summary>
    /// Create a new script file with the message and choice text replaced.
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public abstract ScriptFile WithText(string[] text);

    /// <summary>
    /// Constructs a script file from subfiles.
    /// Only <see cref="OPS_FILENAME"/> is required.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public abstract IArchive Create(IDictionary<string, BinaryStream> contents);

    /// <summary>
    /// Lists the virtual subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo { Filename = SUMMARY_FILENAME, IsReadOnly = true },
            new FileInfo { Filename = TEXT_FILENAME, IsReadOnly = true },
            new FileInfo { Filename = OPS_FILENAME },
        ];
    }

    /// <summary>
    /// Opens a virtual subfile.
    /// The filename is case-insensitive and can be
    /// <see cref="SUMMARY_FILENAME"/>, <see cref="TEXT_FILENAME"/>, or <see cref="OPS_FILENAME"/>.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        string data;
        var isWs2 = Version.IsWs2();
        switch (filename.ToLowerInvariant())
        {
            case SUMMARY_FILENAME:
                var texts = Text;
                var maxPrefixLen = Math.Max(
                    "Choice: ".Length,
                    texts.Length > 0 ? texts.Max(t => t.Name.Length + 2) : 0);
                var summary = texts.Select(t =>
                {
                    var prefix = "";
                    if (t.IsChoice)
                    {
                        prefix = "Choice: ";
                    }
                    else if (t.Name.Length > 0)
                    {
                        prefix = $"{t.Name}: ";
                    }
                    var pad = new string(' ', maxPrefixLen - prefix.Length);
                    var text = t.Text
                        .Replace("\\n", " ")
                        .Replace("\n", " ")
                        .Replace("\\d", "\"");
                    return pad + prefix + text;
                });
                data = string.Join('\n', summary);
                break;
            case TEXT_FILENAME:
                var text = Text.Select(t => t.ToJson().ToJsonString(JsonSerializer.OptionsIndented));
                data = "[\n" + string.Join(",\n", text) + "\n]";
                break;
            case OPS_FILENAME:
                data = ScriptCompiler.ToJson(Ops);
                break;
            default:
                throw new FileNotFoundException(filename);
        }
        return Task.FromResult(new BinaryStream(data));
    }

    /// <summary>
    /// Dispose the script file.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// Dispose the script file.
    /// </summary>
    ~ScriptFile()
    {
        Dispose();
    }
}

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
                        currentName = op.Arguments[0].AffixedString.String;
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
    /// Create a new WS2 file with the message and choice text replaced.
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public override Ws2File WithText(string[] text)
    {
        return ArchiveCreationException.Wrap(() => new Ws2File(OpsWithText(Ops, text)));
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
                    var newChoices = op.Arguments[0].Ws2ChoiceArray.Select(c => c.WithText(text[i++]));
                    newOps.Add(op.WithArgument(0, Argument.NewWs2ChoiceArray(newChoices)));
                    break;
                case Opcode.WS2_DISPLAY_TEXT_14:
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
                    var newChoices = op.Arguments[0].WscChoiceArray.Select(c => c.WithText(text[i++]));
                    newOps.Add(op.WithArgument(0, Argument.NewWscChoiceArray(newChoices)));
                    break;
                case Opcode.WSC_DISPLAY_TEXT_41:
                    var newArg = op.Arguments[3].AffixedString.WithString(text[i++]);
                    newOps.Add(op.WithArgument(3, Argument.NewAffixedString(newArg)));
                    break;
                case Opcode.WSC_DISPLAY_TEXT_AND_NAME_42:
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
