namespace Ws2Explorer.Compiler;

public class Ws2Writer {
    public int Length { get; }
    public bool EndOfStream => stream.Position + 8 >= Length;

    private readonly Stream stream;
    private readonly BinaryWriter writer;

    public Ws2Writer(Stream stream) {
        this.stream = stream;
        writer = new BinaryWriter(stream);
    }

    public void Write(byte value) {
        writer.Write(value);
    }

    public void Write(ushort value) {
        writer.Write(value);
    }

    public void Write(int value) {
        writer.Write(value);
    }

    public void Write(uint value) {
        writer.Write(value);
    }

    public void Write(float value) {
        writer.Write(value);
    }

    public void Write(string value) {
        writer.Write(SjisEncoding.Encoding.GetBytes(value));
        writer.Write((byte)0);
    }
}