namespace Ws2Explorer.Compiler;

public class Ws2Reader {
    public bool EndOfStream => stream.Position >= stream.Length;

    private readonly Stream stream;
    private readonly BinaryReader reader;

    public Ws2Reader(Stream stream) {
        this.stream = stream;
        reader = new BinaryReader(stream);
    }

    public byte? PeekByte() {
        if (EndOfStream) {
            return null;
        }
        var position = stream.Position;
        var value = reader.ReadByte();
        stream.Position = position;
        return value;
    }

    public byte ReadByte() {
        return reader.ReadByte();
    }
    
    public ushort ReadUInt16() {
        return reader.ReadUInt16();
    }

    public int ReadInt32() {
        return reader.ReadInt32();
    }

    public uint ReadUInt32() {
        return reader.ReadUInt32();
    }

    public float ReadSingle() {
        return reader.ReadSingle();
    }

    public string ReadString() {
        var bytes = new List<byte>();
        while (true) {
            var b = reader.ReadByte();
            if (b == 0) {
                break;
            }
            bytes.Add(b);
        }
        return SjisEncoding.Encoding.GetString(bytes.ToArray());
    }
}
