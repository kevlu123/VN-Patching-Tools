namespace Ws2Explorer.FileTypes;

/// <summary>
/// An OGG audio file.
/// </summary>
public sealed class OggFile : IFile<OggFile>
{
    private const int OGGS = 0x5367674F;
    private const int VORB = 0x62726F76;

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The sample rate of the audio.
    /// </summary>
    public int SampleRate { get; }

    /// <summary>
    /// The number of samples in the audio.
    /// </summary>
    public long SampleCount { get; }

    /// <summary>
    /// The number of channels in the audio.
    /// </summary>
    public int ChannelCount { get; }

    /// <summary>
    /// The duration of the audio in seconds.
    /// </summary>
    public float Duration => (float)SampleCount / SampleRate;

    private OggFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != OGGS)
        {
            throw new DecodeException("Invalid signature.");
        }
        for (int i = 4; i < stream.Length; i++)
        {
            if (reader.ReadInt32At(i) == VORB)
            {
                ChannelCount = reader.ReadUInt8At(i + 10);
                SampleRate = reader.ReadNonnegativeInt32At(i + 11);
                break;
            }
        }
        for (int i = stream.Length - 4; i >= 0; i--)
        {
            if (reader.ReadInt32At(i) == OGGS)
            {
                SampleCount = reader.ReadNonnegativeInt64At(i + 6);
                break;
            }
        }

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    /// <summary>
    /// Decodes an OGG file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static OggFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(() => (new OggFile(stream, out var c), c), out confidence);
    }

    /// <summary>
    /// Disposes the OGG file.
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
    /// Disposes the OGG file.
    /// </summary>
    ~OggFile()
    {
        Dispose();
    }
}
