namespace Ws2Explorer;

public sealed class TtfFile : IFile<TtfFile>
{
    private const int SIGNATURE = 0x00000100;

    private bool disposedValue;

    public BinaryStream Stream { get; }

    private TtfFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        Stream = stream;
        stream.IncRef();
        confidence = DecodeConfidence.High; // Low?
    }

    public static TtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new TtfFile(stream, out var c), c),
            out confidence);
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

    ~TtfFile()
    {
        Dispose();
    }
}
