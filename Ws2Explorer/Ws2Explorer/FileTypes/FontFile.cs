namespace Ws2Explorer.FileTypes;

/// <summary>
/// Base class for TtfFile and OtfFile.
/// </summary>
public abstract class FontFile : IFile
{
    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// Gets a font measurer object.
    /// </summary>
    public FontMeasurer FontMeasurer { get; }

    /// <summary>
    /// Initializes a new instance of the <see cref="FontFile"/> class.
    /// </summary>
    /// <param name="stream">The binary stream.</param>
    /// <param name="signature">The expected 4-byte little endian file signature.</param>
    /// <param name="confidence">The decode confidence.</param>
    protected FontFile(BinaryStream stream, int signature, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != signature)
        {
            throw new DecodeException("Invalid signature.");
        }

        FontMeasurer = new FontMeasurer(stream.Span);
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    /// <summary>
    /// Disposes the font file.
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
    /// Disposes the font file.
    /// </summary>
    ~FontFile()
    {
        Dispose();
    }
}
