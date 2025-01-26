namespace Ws2Explorer.Compiler;

class RotationStream : Stream {
    private readonly Stream stream;
    private readonly int rotationLeft;

    public RotationStream(Stream stream, int rotationLeft) {
        this.stream = stream;
        this.rotationLeft = rotationLeft;
    }

    public override long Length => stream.Length;
    public override bool CanRead => stream.CanRead;
    public override bool CanSeek => stream.CanSeek;
    public override bool CanWrite => stream.CanWrite;
    public override long Position { get => stream.Position; set => stream.Position = value; }
    public override void Flush() => stream.Flush();
    public override long Seek(long offset, SeekOrigin origin) => stream.Seek(offset, origin);
    public override void SetLength(long value) => stream.SetLength(value);

    public override int Read(byte[] buffer, int offset, int count) {
        var read = stream.Read(buffer, offset, count);
        for (int i = 0; i < read; i++) {
            buffer[i + offset] = RotateLeft(buffer[i + offset], rotationLeft);
        }
        return read;
    }

    public override void Write(byte[] buffer, int offset, int count) {
        for (int i = 0; i < count; i++) {
            buffer[i + offset] = RotateLeft(buffer[i + offset], 8 - rotationLeft);
        }
        stream.Write(buffer, offset, count);
    }

    private static byte RotateLeft(byte value, int count) {
        return (byte)((value << count) | (value >> (8 - count)));
    }
}
