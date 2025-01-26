namespace Ws2Explorer;

public sealed class LuacFile : IFile<LuacFile>
{
    private const int SIGNATURE = 0x61754C1B;

    private bool disposedValue;

    public BinaryStream Stream { get; }

    public byte LuaVersion { get; }

    private LuacFile(BinaryStream stream, out DecodeConfidence confidence)
    {
        var reader = new BinaryReader(stream);

        if (reader.ReadInt32() != SIGNATURE)
        {
            throw new DecodeException("Invalid signature.");
        }

        LuaVersion = reader.ReadUInt8();

        Stream = stream;
        stream.Freeze();
        stream.IncRef();
        confidence = DecodeConfidence.High;
    }

    public static LuacFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new LuacFile(stream, out var c), c),
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

    ~LuacFile()
    {
        Dispose();
    }
}
