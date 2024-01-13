namespace Ws2Explorer;

public class VideoFile : BinaryFile {
    private static readonly byte[] MAGIC = new byte[] { 0x30, 0x26, 0xB2, 0x75, 0x8E, 0x66, 0xCF, 0x11, 0xA6, 0xD9, 0x00, 0xAA, 0x00, 0x62, 0xCE, 0x6C };

    public VideoFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        if (stream.Length < MAGIC.Length) {
            throw new InvalidDataException("Invalid header");
        }

        var (data, start, _) = stream.RawBuffer;
        var slice = data.Skip(start).Take(MAGIC.Length);
        if (!slice.SequenceEqual(MAGIC)) {
            throw new InvalidDataException("Invalid header");
        }
    }
}
