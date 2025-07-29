using System.Collections.Immutable;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

internal sealed class ScriptFileBase : IDisposable
{
    public delegate List<Op> DecompileFn(BinaryStream stream, out ScriptVersion version, out bool hasUnresolvedLabels);

    private bool disposedValue;

    public const string SUMMARY_FILENAME = "summary.txt";

    public const string OPS_FILENAME = "ops.json";

    public BinaryStream Stream { get; }

    public ImmutableArray<Op> Ops { get; }

    public bool HasUnresolvedLabels => hasUnresolvedLabels;
    private readonly bool hasUnresolvedLabels;

    public ScriptVersion Version => Enum.Parse<ScriptVersion>(Ops[0].Arguments[0].String);

    public ScriptFileBase(IEnumerable<Op> ops)
    {
        // TODO: Validate ops
        Ops = [.. ops];
        Stream = ScriptCompiler.Compile(ops, out hasUnresolvedLabels);
    }

    public ScriptFileBase(BinaryStream stream, DecompileFn decompileFn, out DecodeConfidence confidence)
    {
        Ops = [.. decompileFn(stream, out _, out hasUnresolvedLabels)];
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = ((ReadOnlySpan<byte>)stream.Span).ContainsAnyExcept<byte>(0) && stream.Length > 16
            ? DecodeConfidence.High
            : DecodeConfidence.Low;
    }

    public ScriptFileBase(IDictionary<string, BinaryStream> contents)
    {
        foreach (var (name, stream) in contents)
        {
            if (name == OPS_FILENAME)
            {
                using var textFile = stream
                    .Decode<TextFile>(decRef: false).Result;
                // TODO: Validate ops
                Ops = [.. ScriptCompiler.FromJson(textFile.Text)];
                Stream = ScriptCompiler.Compile(Ops, out hasUnresolvedLabels);
                return;
            }
        }
        throw new ArchiveCreationException($"Script file must contain '{OPS_FILENAME}'.");
    }

    public static List<FileInfo> ListFiles()
    {
        return [
            new FileInfo { Filename = SUMMARY_FILENAME },
            new FileInfo { Filename = OPS_FILENAME },
        ];
    }

    public Task<BinaryStream> OpenFile(string filename)
    {
        string data;
        switch (filename.ToLowerInvariant())
        {
            case SUMMARY_FILENAME:
                var currentName = "";
                var summary = Ops.SelectMany(op =>
                {
                    if (Version.IsWs2())
                    {
                        switch (op.Code)
                        {
                            case Opcode.WS2_SHOW_CHOICE_0F:
                                return op.Arguments[0].Ws2ChoiceArray
                                    .Select(c => $"Choice: {c.Text}");
                            case Opcode.WS2_DISPLAY_NAME_15:
                                currentName = op.Arguments[0].AffixedString.String;
                                return [];
                            case Opcode.WS2_DISPLAY_TEXT_14:
                                var text = currentName.Length > 0
                                    ? $"{currentName}: {op.Arguments[2].AffixedString.String}"
                                    : $"{op.Arguments[2].AffixedString.String}";
                                return [text.Replace("\\n", " ")];
                            default:
                                return [];
                        }
                    }
                    else if (Version.IsWsc())
                    {
                        switch (op.Code)
                        {
                            case Opcode.WSC_SHOW_CHOICE_02:
                                return op.Arguments[0].WscChoiceArray
                                    .Select(c => $"Choice: {c.Text}");
                            case Opcode.WSC_DISPLAY_TEXT_41:
                                return [op.Arguments[3].AffixedString.String.Replace("\\n", " ")];
                            case Opcode.WSC_DISPLAY_TEXT_AND_NAME_42:
                                var name = op.Arguments[3].AffixedString.String;
                                var text = op.Arguments[4].AffixedString.String.Replace("\\n", " ");
                                return [string.IsNullOrEmpty(name) ? text : $"{name}: {text}"];
                            default:
                                return [];
                        }
                    }
                    return [];
                });
                data = string.Join('\n', summary);
                if (data.Length == 0)
                {
                    data = "---- Nothing to show ----";
                }
                break;
            case OPS_FILENAME:
                data = ScriptCompiler.ToJson(Ops);
                break;
            default:
                throw new FileNotFoundException(filename);
        }
        return Task.FromResult(new BinaryStream(data));
    }

    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    ~ScriptFileBase()
    {
        Dispose();
    }
}

/// <summary>
/// A WS2 script file.
/// </summary>
public sealed class Ws2File : IArchive<Ws2File>
{
    private readonly ScriptFileBase scriptFileBase;

    /// <summary>
    /// The filename of the summary file.
    /// The summary file contains a human-readable summary of the script.
    /// </summary>
    public const string SUMMARY_FILENAME = ScriptFileBase.SUMMARY_FILENAME;

    /// <summary>
    /// The filename of the ops file.
    /// The ops file contains the script instructions in JSON format.
    /// </summary>
    public const string OPS_FILENAME = ScriptFileBase.OPS_FILENAME;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream => scriptFileBase.Stream;

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public ImmutableArray<Op> Ops => scriptFileBase.Ops;

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public bool HasUnresolvedLabels => scriptFileBase.HasUnresolvedLabels;

    /// <summary>
    /// The version of the script.
    /// </summary>
    public ScriptVersion Version => scriptFileBase.Version;

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
        scriptFileBase = new ScriptFileBase(ops);
    }

    private Ws2File(BinaryStream stream, out DecodeConfidence confidence)
    {
        scriptFileBase = new ScriptFileBase(stream, ScriptCompiler.DecompileWs2, out confidence);
    }

    private Ws2File(IDictionary<string, BinaryStream> contents)
    {
        scriptFileBase = new ScriptFileBase(contents);
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
    /// Only <see cref="OPS_FILENAME"/> is required.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static Ws2File Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new Ws2File(contents));
    }

    /// <summary>
    /// See <see cref="Create(IDictionary{string, BinaryStream})"/>.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    /// <summary>
    /// Lists the virtual subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles() => ScriptFileBase.ListFiles();

    /// <summary>
    /// Opens a virtual subfile.
    /// The filename is case-insensitive and can be
    /// <see cref="SUMMARY_FILENAME"/> or <see cref="OPS_FILENAME"/>.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        return scriptFileBase.OpenFile(filename);
    }

    /// <summary>
    /// Disposes the WS2 file.
    /// </summary>
    public void Dispose()
    {
        scriptFileBase?.Dispose();
    }
}

/// <summary>
/// A WSC script file.
/// </summary>
public sealed class WscFile : IArchive<WscFile>
{
    private readonly ScriptFileBase scriptFileBase;

    /// <summary>
    /// The filename of the summary file.
    /// The summary file contains a human-readable summary of the script.
    /// </summary>
    public const string SUMMARY_FILENAME = ScriptFileBase.SUMMARY_FILENAME;

    /// <summary>
    /// The filename of the ops file.
    /// The ops file contains the script instructions in JSON format.
    /// </summary>
    public const string OPS_FILENAME = ScriptFileBase.OPS_FILENAME;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream => scriptFileBase.Stream;

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public ImmutableArray<Op> Ops => scriptFileBase.Ops;

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public bool HasUnresolvedLabels => scriptFileBase.HasUnresolvedLabels;

    /// <summary>
    /// The version of the script.
    /// </summary>
    public ScriptVersion Version => scriptFileBase.Version;

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
        scriptFileBase = new ScriptFileBase(ops);
    }

    private WscFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        scriptFileBase = new ScriptFileBase(stream, ScriptCompiler.DecompileWsc, out confidence);
    }

    private WscFile(IDictionary<string, BinaryStream> contents)
    {
        scriptFileBase = new ScriptFileBase(contents);
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
    /// Only <see cref="OPS_FILENAME"/> is required.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public static WscFile Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new WscFile(contents));
    }

    /// <summary>
    /// See <see cref="Create(IDictionary{string, BinaryStream})"/>.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    /// <summary>
    /// Lists the virtual subfiles.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles() => ScriptFileBase.ListFiles();

    /// <summary>
    /// Opens a virtual subfile.
    /// The filename is case-insensitive and can be
    /// <see cref="SUMMARY_FILENAME"/> or <see cref="OPS_FILENAME"/>.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public Task<BinaryStream> OpenFile(string filename, IProgress<TaskProgressInfo>? progress = null, CancellationToken ct = default)
    {
        return scriptFileBase.OpenFile(filename);
    }

    /// <summary>
    /// Disposes the WSC file.
    /// </summary>
    public void Dispose()
    {
        scriptFileBase?.Dispose();
    }
}
