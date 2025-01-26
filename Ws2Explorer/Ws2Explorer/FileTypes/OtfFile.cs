namespace Ws2Explorer;

public sealed class OtfFile : IFile<OtfFile>
{
    private const int SIGNATURE = 0x4F54544F;

    private bool disposedValue;

    public BinaryStream Stream { get; }

    private OtfFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        Stream = stream;
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    public static OtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new OtfFile(stream, out var c), c),
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

    ~OtfFile()
    {
        Dispose();
    }
}
