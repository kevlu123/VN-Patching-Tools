using System.Collections.Immutable;
using Ws2Explorer.Compiler;

namespace Ws2Explorer;

public sealed class Ws2File : IArchive<Ws2File>
{
    private bool disposedValue;

    public const string SUMMARY_FILENAME = "summary.txt";
    public const string OPS_FILENAME = "ops.json";

    public BinaryStream Stream { get; }

    public ImmutableArray<Op> Ops { get; }

    public Ws2Version Version => Enum.Parse<Ws2Version>(Ops[0].Arguments[0].String);

    private Ws2File(BinaryStream stream, out DecodeConfidence confidence)
    {
        Ops = [.. Ws2Compiler.Decompile(stream, out _)];

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
                Ops = [.. Ws2Compiler.FromJson(textFile.Text)];
                Stream = Ws2Compiler.Compile(Ops);
                return;
            }
        }
        throw new ArchiveCreationException($"Ws2File must contain '{OPS_FILENAME}'.");
    }

    public static Ws2File Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new Ws2File(stream, out var c), c),
            out confidence);
    }

    public static Ws2File Create(IDictionary<string, BinaryStream> contents)
    {
        return ArchiveCreationException.Wrap(() => new Ws2File(contents));
    }

    IArchive IArchive.Create(IDictionary<string, BinaryStream> contents)
    {
        return Create(contents);
    }

    public List<FileInfo> ListFiles()
    {
        return [
            new FileInfo { Filename = SUMMARY_FILENAME },
            new FileInfo { Filename = OPS_FILENAME },
        ];
    }

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

    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    ~Ws2File()
    {
        Dispose();
    }
}
