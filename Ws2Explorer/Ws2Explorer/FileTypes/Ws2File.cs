using System.Collections.Immutable;
using Ws2Explorer.Compiler;

namespace Ws2Explorer.FileTypes;

/// <summary>
/// A WS2 script file.
/// </summary>
public sealed class Ws2File : IArchive<Ws2File>
{
    private bool disposedValue;

    /// <summary>
    /// The filename of the summary file.
    /// The summary file contains a human-readable summary of the script.
    /// </summary>
    public const string SUMMARY_FILENAME = "summary.txt";

    /// <summary>
    /// The filename of the ops file.
    /// The ops file contains the script instructions in JSON format.
    /// </summary>
    public const string OPS_FILENAME = "ops.json";

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The ops of the script.
    /// </summary>
    public ImmutableArray<Op> Ops { get; }

    /// <summary>
    /// Whether the script contains labels that do not point to a valid location.
    /// </summary>
    public bool HasUnresolvedLabels => hasUnresolvedLabels;
    private readonly bool hasUnresolvedLabels;

    /// <summary>
    /// The version of the script.
    /// </summary>
    public Ws2Version Version => Enum.Parse<Ws2Version>(Ops[0].Arguments[0].String);

    /// <summary>
    /// Constructs a WS2 file from a list of ops.
    /// </summary>
    /// <param name="ops"></param>
    public Ws2File(IEnumerable<Op> ops)
    {
        // TODO: Validate ops
        Ops = [.. ops];
        Stream = Ws2Compiler.Compile(ops, out hasUnresolvedLabels);
    }

    private Ws2File(BinaryStream stream, out DecodeConfidence confidence)
    {
        Ops = [.. Ws2Compiler.Decompile(stream, out _, out hasUnresolvedLabels)];

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = ((ReadOnlySpan<byte>)stream.Span).ContainsAnyExcept<byte>(0)
            ? DecodeConfidence.High
            : DecodeConfidence.Low;
    }

    private Ws2File(IDictionary<string, BinaryStream> contents)
    {
        foreach (var (name, stream) in contents)
        {
            if (name == OPS_FILENAME)
            {
                using var textFile = stream
                    .Decode<TextFile>(decRef: false).Result;
                // TODO: Validate ops
                Ops = [.. Ws2Compiler.FromJson(textFile.Text)];
                Stream = Ws2Compiler.Compile(Ops, out hasUnresolvedLabels);
                return;
            }
        }
        throw new ArchiveCreationException($"Ws2File must contain '{OPS_FILENAME}'.");
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
    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo { Filename = SUMMARY_FILENAME },
            new FileInfo { Filename = OPS_FILENAME },
        ];
    }

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
        string data;
        switch (filename.ToLowerInvariant())
        {
            case SUMMARY_FILENAME:
                var currentName = "";
                var summary = Ops.SelectMany(op =>
                {
                    switch (op.Code)
                    {
                        case 0x0F:
                            return op.Arguments[0].ChoiceArray
                                .Select(c => $"Choice: {c.Text}");
                        case 0x15:
                            currentName = op.Arguments[0].NameString.String;
                            return [];
                        case 0x14:
                            var text = currentName.Length > 0
                                ? $"{currentName}: {op.Arguments[2].MessageString.String}"
                                : $"{op.Arguments[2].MessageString.String}";
                            return [text.Replace("\\n", " ")];
                        default:
                            return [];
                    }
                });
                data = string.Join('\n', summary);
                if (data.Length == 0)
                {
                    data = "---- Nothing to show ----";
                }
                break;
            case OPS_FILENAME:
                data = Ws2Compiler.ToJson(Ops);
                break;
            default:
                throw new FileNotFoundException(filename);
        }
        return Task.FromResult(new BinaryStream(data));
    }

    /// <summary>
    /// Disposes the WS2 file.
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
    /// Disposes the WS2 file.
    /// </summary>
    ~Ws2File()
    {
        Dispose();
    }
}
