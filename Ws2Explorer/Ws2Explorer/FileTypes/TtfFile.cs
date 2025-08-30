namespace Ws2Explorer.FileTypes;

/// <summary>
/// A true type font file.
/// </summary>
public sealed class TtfFile : FontFile, IFile<TtfFile>
{
    /// <summary>
    /// TTF file signature as little-endian int.
    /// </summary>
    public const int SIGNATURE = 0x00000100;

    private TtfFile(BinaryStream stream, out DecodeConfidence confidence)
        : base(stream, SIGNATURE, out confidence)
    { }

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
}
