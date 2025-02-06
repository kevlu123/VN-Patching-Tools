namespace Ws2Explorer.FileTypes;

/// <summary>
/// A generic binary file.
/// </summary>
public sealed class BinFile : IFile<BinFile>
{
    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// An empty binary file.
    /// </summary>
    public static readonly BinFile Empty = new(new BinaryStream(Array.Empty<byte>()));

    /// <summary>
    /// Constructs a binary file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    public BinFile(BinaryStream stream)
        : this(stream, out _) { }

    private BinFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.Low;
    }

    /// <summary>
    /// Decodes a binary file from a binary stream.
    /// This will always succeed with low confidence.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static BinFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return new BinFile(stream, out confidence);
    }

    /// <summary>
    /// Disposes the binary file.
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
    /// Disposes the binary file.
    /// </summary>
    ~BinFile()
    {
        Dispose();
    }
}
