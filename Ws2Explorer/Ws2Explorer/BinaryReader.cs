using System.Buffers.Binary;
using System.Runtime.InteropServices;
using System.Text;

namespace Ws2Explorer;

public class BinaryReader(BinaryStream stream)
{
    private readonly BinaryStream stream = stream;

    public int Position { get; set; }

    public int Length { get; } = stream.Length;

    public void Seek(int position)
    {
        Position = position;
    }

    public void Skip(int count)
    {
        Position += count;
    }

    public byte? PeekByte()
    {
        if (Position >= Length)
        {
            return null;
        }
        return ReadUInt8At(Position);
    }

    public void ReadBytes(Span<byte> v)
    {
        int length = v.Length;
        stream.Span.Slice(Position, length).CopyTo(v);
        Skip(length);
    }

    public sbyte ReadInt8()
    {
        var v = ReadInt8At(Position);
        Skip(sizeof(sbyte));
        return v;
    }

    public byte ReadUInt8()
    {
        var v = ReadUInt8At(Position);
        Skip(sizeof(byte));
        return v;
    }

    public short ReadInt16()
    {
        var v = ReadInt16At(Position);
        Skip(sizeof(short));
        return v;
    }

    public ushort ReadUInt16()
    {
        var v = ReadUInt16At(Position);
        Skip(sizeof(ushort));
        return v;
    }

    public int ReadInt32()
    {
        var v = ReadInt32At(Position);
        Skip(sizeof(int));
        return v;
    }

    public uint ReadUInt32()
    {
        var v = ReadUInt32At(Position);
        Skip(sizeof(uint));
        return v;
    }

    public long ReadInt64()
    {
        var v = ReadInt64At(Position);
        Skip(sizeof(long));
        return v;
    }

    public ulong ReadUInt64()
    {
        var v = ReadUInt64At(Position);
        Skip(sizeof(ulong));
        return v;
    }

    public float ReadFloat32()
    {
        var v = ReadFloat32At(Position);
        Skip(sizeof(float));
        return v;
    }

    public double ReadFloat64()
    {
        var v = ReadFloat64At(Position);
        Skip(sizeof(double));
        return v;
    }

    public string ReadSjisString()
    {
        var bytes = new List<byte>(16);
        while (true)
        {
            var b = ReadUInt8();
            if (b == 0)
            {
                break;
            }
            bytes.Add(b);
        }
        return SjisEncoding.Encoding.GetString(CollectionsMarshal.AsSpan(bytes));
    }

    public string ReadUTF8String()
    {
        // TODO: Implement proper UTF-8 decoding
        var bytes = new List<byte>();
        while (true)
        {
            var b = ReadUInt8();
            if (b == 0)
            {
                break;
            }
            bytes.Add(b);
        }
        return Encoding.UTF8.GetString(CollectionsMarshal.AsSpan(bytes));
    }

    public string ReadUTF16String()
    {
        var bytes = new List<byte>();
        while (true)
        {
            var b1 = ReadUInt8();
            var b2 = ReadUInt8();
            if (b1 == 0 && b2 == 0)
            {
                break;
            }
            bytes.Add(b1);
            bytes.Add(b2);
        }
        return Encoding.Unicode.GetString(CollectionsMarshal.AsSpan(bytes));
    }

    public sbyte ReadInt8At(int position)
    {
        return (sbyte)stream.Span[position];
    }

    public byte ReadUInt8At(int position)
    {
        return stream.Span[position];
    }

    public short ReadInt16At(int position)
    {
        return BinaryPrimitives.ReadInt16LittleEndian(
            stream.Span.Slice(position, sizeof(short)));
    }

    public ushort ReadUInt16At(int position)
    {
        return BinaryPrimitives.ReadUInt16LittleEndian(
            stream.Span.Slice(position, sizeof(ushort)));
    }

    public int ReadInt32At(int position)
    {
        return BinaryPrimitives.ReadInt32LittleEndian(
            stream.Span.Slice(position, sizeof(int)));
    }

    public uint ReadUInt32At(int position)
    {
        return BinaryPrimitives.ReadUInt32LittleEndian(
            stream.Span.Slice(position, sizeof(uint)));
    }

    public long ReadInt64At(int position)
    {
        return BinaryPrimitives.ReadInt64LittleEndian(
            stream.Span.Slice(position, sizeof(long)));
    }

    public ulong ReadUInt64At(int position)
    {
        return BinaryPrimitives.ReadUInt64LittleEndian(
            stream.Span.Slice(position, sizeof(ulong)));
    }

    public float ReadFloat32At(int position)
    {
        return BinaryPrimitives.ReadSingleLittleEndian(
            stream.Span.Slice(position, sizeof(float)));
    }

    public double ReadFloat64At(int position)
    {
        return BinaryPrimitives.ReadDoubleLittleEndian(
            stream.Span.Slice(position, sizeof(double)));
    }

    public int ReadNonnegativeInt32()
    {
        var value = ReadNonnegativeInt32At(Position);
        Skip(sizeof(int));
        return value;
    }

    public long ReadNonnegativeInt64()
    {
        var value = ReadNonnegativeInt64At(Position);
        Skip(sizeof(long));
        return value;
    }

    public int ReadNonnegativeInt32BE()
    {
        var value = ReadNonnegativeInt32BEAt(Position);
        Skip(sizeof(int));
        return value;
    }

    public long ReadNonnegativeInt64BE()
    {
        var value = ReadNonnegativeInt64BEAt(Position);
        Skip(sizeof(long));
        return value;
    }

    public int ReadNonnegativeInt32At(int position)
    {
        var value = ReadInt32At(position);
        return value < 0
            ? throw new InvalidDataException("Unexpected negative int32.")
            : value;
    }

    public long ReadNonnegativeInt64At(int position)
    {
        var value = ReadInt64At(position);
        return value < 0
            ? throw new InvalidDataException("Unexpected negative int64.")
            : value;
    }

    public int ReadNonnegativeInt32BEAt(int position)
    {
        var value = BinaryPrimitives.ReadInt32BigEndian(
            stream.Span.Slice(position, sizeof(int)));
        return value < 0
            ? throw new InvalidDataException("Unexpected negative int32BE.")
            : value;
    }

    public long ReadNonnegativeInt64BEAt(int position)
    {
        var value = BinaryPrimitives.ReadInt64BigEndian(
            stream.Span.Slice(position, sizeof(long)));
        return value < 0
            ? throw new InvalidDataException("Unexpected negative int64BE.")
            : value;
    }
}
