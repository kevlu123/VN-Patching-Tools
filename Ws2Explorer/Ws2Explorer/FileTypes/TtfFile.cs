namespace Ws2Explorer.FileTypes;

/// <summary>
/// A true type font file.
/// </summary>
public sealed class TtfFile : IFile<TtfFile>
{
    /// <summary>
    /// TTF file signature as little-endian int.
    /// </summary>
    public const int SIGNATURE = 0x00000100;

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    private TtfFile(BinaryStream stream, out DecodeConfidence confidence)
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
    /// Decodes a TTF file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static TtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(() => (new TtfFile(stream, out var c), c), out confidence);
    }

    /// <summary>
    /// Disposes the TTF file.
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
    /// Disposes the true type font file.
    /// </summary>
    ~TtfFile()
    {
        Dispose();
    }
}
