namespace Ws2Explorer;

public sealed class OggFile : IFile<OggFile>
{
    private const int OGGS = 0x5367674F;
    private const int VORB = 0x62726F76;

    private bool disposedValue;

    public BinaryStream Stream { get; }

    public int SampleRate { get; }
    public long SampleCount { get; }
    public int ChannelCount { get; }
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
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    public static OggFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new OggFile(stream, out var c), c),
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

    ~OggFile()
    {
        Dispose();
    }
}
