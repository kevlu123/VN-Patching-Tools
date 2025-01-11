namespace Ws2Explorer;

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

    public BinaryStream Stream { get; }

    public string? MetadataSummary => $"Dimensions: {ImageWidth}x{ImageHeight}";

    public int ImageWidth { get; }

    public int ImageHeight { get; }

    private bool disposedValue;

    private PngFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (stream.Length < 67) // https://evanhahn.com/worlds-smallest-png/
        {
            throw new DecodeException("File is too short.");
        } else if (reader.ReadUInt32() != 0x474E5089)
        {
            throw new DecodeException("Invalid signature.");
        }

        reader.Skip(12);
        ImageWidth = reader.ReadNonnegativeInt32BE();
        ImageHeight = reader.ReadNonnegativeInt32BE();

        Stream = stream;
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    public static PngFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new PngFile(stream, out var c), c),
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

    ~PngFile()
    {
        Dispose();
    }
}
