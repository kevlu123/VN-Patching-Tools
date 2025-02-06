namespace Ws2Explorer.FileTypes;

/// <summary>
/// A compiled Lua file.
/// </summary>
public sealed class LuacFile : IFile<LuacFile>
{
    private const int SIGNATURE = 0x61754C1B;

    private bool disposedValue;

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public BinaryStream Stream { get; }

    /// <summary>
    /// The version of Lua.
    /// The upper 4 bits are the major version, and the lower 4 bits are the minor version.
    /// e.g. 0x51 is Lua 5.1.
    /// </summary>
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

    /// <summary>
    /// Decodes a Luac file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static LuacFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(
            () => (new LuacFile(stream, out var c), c),
            out confidence);
    }

    /// <summary>
    /// Disposes the Luac file.
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
    /// Disposes the Luac file.
    /// </summary>
    ~LuacFile()
    {
        Dispose();
    }
}
