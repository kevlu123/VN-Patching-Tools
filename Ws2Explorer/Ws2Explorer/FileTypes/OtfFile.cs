namespace Ws2Explorer.FileTypes;

/// <summary>
/// An open type font file.
/// </summary>
public sealed class OtfFile : FontFile, IFile<OtfFile>
{
    /// <summary>
    /// OTF file signature as little-endian int.
    /// </summary>
    public const int SIGNATURE = 0x4F54544F;

    private OtfFile(BinaryStream stream, out DecodeConfidence confidence)
        : base(stream, SIGNATURE, out confidence)
    { }

    /// <summary>
    /// Decodes an OTF file from a binary stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence"></param>
    /// <returns></returns>
    public static OtfFile Decode(BinaryStream stream, out DecodeConfidence confidence)
    {
        return DecodeException.Wrap(() => (new OtfFile(stream, out var c), c), out confidence);
    }
}
