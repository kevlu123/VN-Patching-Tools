namespace Ws2Explorer;

public sealed class BinFile : IFile<BinFile>
{
    private bool disposedValue;

    public BinaryStream Stream { get; }

    public static readonly BinFile Empty = new(new BinaryStream(Array.Empty<byte>()));

    public BinFile(BinaryStream stream) : this(stream, out _)
    {
    }

    private BinFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.Low;
    }

    public static BinFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        // Will not throw an exception
        return new BinFile(stream, out confidence);
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

    ~BinFile()
    {
        Dispose();
    }
}
