using System.Buffers.Binary;
using System.Text;

namespace Ws2Explorer;

public class BinaryWriter
{
    private readonly BinaryStream stream;

    public int Position { get; set; }

    public int Length { get; }

    public BinaryWriter(BinaryStream stream)
    {
        if (!stream.Writable)
        {
            throw new InvalidOperationException("Stream is not writable.");
        }
        this.stream = stream;
        Length = stream.Length;
    }

    public void Seek(int position)
    {
        Position = position;
    }

    public void Skip(int count)
    {
        Position += count;
    }

    public void WriteBytes(ReadOnlySpan<byte> v)
    {
        v.CopyTo(stream.Span[Position..]);
        Skip(v.Length);
    }

    public void WriteInt8(sbyte v)
    {
        WriteInt8At(Position, v);
        Skip(sizeof(sbyte));
    }

    public void WriteUInt8(byte v)
    {
        WriteUInt8At(Position, v);
        Skip(sizeof(byte));
    }

    public void WriteInt16(short v)
    {
        WriteInt16At(Position, v);
        Skip(sizeof(short));
    }

    public void WriteUInt16(ushort v)
    {
        WriteUInt16At(Position, v);
        Skip(sizeof(ushort));
    }

    public void WriteInt32(int v)
    {
        WriteInt32At(Position, v);
        Skip(sizeof(int));
    }

    public void WriteUInt32(uint v)
    {
        WriteUInt32At(Position, v);
        Skip(sizeof(uint));
    }

    public void WriteInt64(long v)
    {
        WriteInt64At(Position, v);
        Skip(sizeof(long));
    }

    public void WriteUInt64(ulong v)
    {
        WriteUInt64At(Position, v);
        Skip(sizeof(ulong));
    }

    public void WriteFloat32(float v)
    {
        WriteFloat32At(Position, v);
        Skip(sizeof(float));
    }

    public void WriteFloat64(double v)
    {
        WriteFloat64At(Position, v);
        Skip(sizeof(double));
    }

    public void WriteSjisString(string v)
    {
        WriteBytes(SjisEncoding.Encoding.GetBytes(v));
        WriteUInt8(0);
    }

    public void WriteUTF8String(string v)
    {
        WriteBytes(Encoding.UTF8.GetBytes(v));
        WriteUInt8(0);
    }

    public void WriteUTF16String(string v)
    {
        WriteBytes(Encoding.Unicode.GetBytes(v));
        WriteUInt16(0);
    }

    public void WriteInt8At(int position, sbyte v)
    {
        stream.Span[position] = (byte)v;
    }

    public void WriteUInt8At(int position, byte v)
    {
        stream.Span[position] = v;
    }

    public void WriteInt16At(int position, short v)
    {
        BinaryPrimitives.WriteInt16LittleEndian(stream.Span[position..], v);
    }

    public void WriteUInt16At(int position, ushort v)
    {
        BinaryPrimitives.WriteUInt16LittleEndian(stream.Span[position..], v);
    }

    public void WriteInt32At(int position, int v)
    {
        BinaryPrimitives.WriteInt32LittleEndian(stream.Span[position..], v);
    }

    public void WriteUInt32At(int position, uint v)
    {
        BinaryPrimitives.WriteUInt32LittleEndian(stream.Span[position..], v);
    }

    public void WriteInt64At(int position, long v)
    {
        BinaryPrimitives.WriteInt64LittleEndian(stream.Span[position..], v);
    }

    public void WriteUInt64At(int position, ulong v)
    {
        BinaryPrimitives.WriteUInt64LittleEndian(stream.Span[position..], v);
    }

    public void WriteFloat32At(int position, float v)
    {
        BinaryPrimitives.WriteSingleLittleEndian(stream.Span[position..], v);
    }

    public void WriteFloat64At(int position, double v)
    {
        BinaryPrimitives.WriteDoubleLittleEndian(stream.Span[position..], v);
    }
}
