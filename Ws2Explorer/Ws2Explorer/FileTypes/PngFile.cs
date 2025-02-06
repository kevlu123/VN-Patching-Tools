namespace Ws2Explorer.FileTypes;

/// <summary>
/// A PNG image file.
/// </summary>
public sealed class PngFile : IFile<PngFile>
{
    internal static readonly PngFile Example = Decode(new BinaryStream([
        0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
        0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
        0x01, 0x00, 0x00, 0x00, 0x00, 0x37, 0x6E, 0xF9, 0x24, 0x00, 0x00, 0x00,
        0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x01, 0x63, 0x60, 0x00, 0x00, 0x00,
        0x02, 0x00, 0x01, 0x73, 0x75, 0x01, 0x18, 0x00, 0x00, 0x00, 0x00, 0x49,
        0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
    ]), out _);

    /// <summary>
    /// The PNG signature.
    /// </summary>
    public const int SIGNATURE = 0x474E5089;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The width of the image.
    /// </summary>
    public int ImageWidth { get; }

    /// <summary>
    /// The height of the image.
    /// </summary>
    public int ImageHeight { get; }

    private bool disposedValue;

    private PngFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (stream.Length < 67) // https://evanhahn.com/worlds-smallest-png/
        {
            throw new DecodeException("File is too short.");
        } else if (reader.ReadUInt32() != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        reader.Skip(12);
        ImageWidth = reader.ReadNonnegativeInt32BE();
        ImageHeight = reader.ReadNonnegativeInt32BE();

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    /// <summary>
    /// Decodes a PNG file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static PngFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PngFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Disposes the PNG file.
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
    /// Disposes the PNG file.
    /// </summary>
    ~PngFile()
    {
        Dispose();
    }
}
