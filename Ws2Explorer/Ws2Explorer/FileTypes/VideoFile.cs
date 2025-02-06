namespace Ws2Explorer.FileTypes;

/// <summary>
/// A WMV video file.
/// </summary>
public sealed class VideoFile : IFile<VideoFile>
{
    private static readonly byte[] SIGNATURE = [
        0x30, 0x26, 0xB2, 0x75,
        0x8E, 0x66, 0xCF, 0x11,
        0xA6, 0xD9, 0x00, 0xAA,
        0x00, 0x62, 0xCE, 0x6C,
    ];

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    private VideoFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        var buffer = new byte[SIGNATURE.Length];
        reader.ReadBytes(buffer);
        if (!buffer.SequenceEqual(SIGNATURE))
        {
            throw new DecodeException("Invalid signature.");
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    /// <summary>
    /// Decodes a video file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static VideoFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new VideoFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Disposes the video file.
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
    /// Disposes the video file.
    /// </summary>
    ~VideoFile()
    {
        Dispose();
    }
}
