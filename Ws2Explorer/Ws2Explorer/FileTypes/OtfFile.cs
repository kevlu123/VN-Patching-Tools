namespace Ws2Explorer.FileTypes;

/// <summary>
/// An open type font file.
/// </summary>
public sealed class OtfFile : IFile<OtfFile>
{
    private const int SIGNATURE = 0x4F54544F;

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    private OtfFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    /// <summary>
    /// Decodes an OTF file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static OtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(() => (new OtfFile(stream, out var c), c), out confidence);
    }

    /// <summary>
    /// Disposes the OTF file.
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
    /// Disposes the OTF file.
    /// </summary>
    ~OtfFile()
    {
        Dispose();
    }
}
