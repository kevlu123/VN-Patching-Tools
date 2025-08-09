using System.Buffers.Binary;
using System.Runtime.InteropServices;
using System.Text;

namespace Ws2Explorer;

/// <summary>
/// Reads binary data from a <see cref="BinaryStream"/>.
/// All data is read in little-endian byte order unless otherwise specified.
/// </summary>
public class BinaryReader
{
    private readonly BinaryStream stream;

    /// <summary>
    /// Gets or sets the current position within the stream.
    /// </summary>
    public int Position { get; set; }

    /// <summary>
    /// Gets the length of the stream.
    /// </summary>
    public int Length { get; }

    /// <summary>
    /// Initializes a new instance of the <see cref="BinaryReader"/> class.
    /// </summary>
    /// <param name="stream">The stream to read from.</param>
    public BinaryReader(BinaryStream stream)
    {
        this.stream = stream;
        Length = stream.Length;
    }

    /// <summary>
    /// Seeks to the specified position in the stream from the beginning.
    /// </summary>
    /// <param name="position"></param>
    public void Seek(int position)
    {
        Position = position;
    }

    /// <summary>
    /// Seeks forward by the specified number of bytes.
    /// </summary>
    /// <param name="count"></param>
    public void Skip(int count)
    {
        Position += count;
    }

    /// <summary>
    /// Peeks at the next byte at the current position without advancing the position.
    /// </summary>
    /// <returns>The next byte or null if there is none.</returns>
    public byte? PeekByte()
    {
        if (Position >= Length)
        {
            return null;
        }
        return ReadUInt8At(Position);
    }

    /// <summary>
    /// Reads the specified number of bytes at the
    /// current position and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void ReadBytes(Span<byte> v)
    {
        int length = v.Length;
        stream.Span.Slice(Position, length).CopyTo(v);
        Skip(length);
    }

    /// <summary>
    /// Reads the specified number of bytes at the
    /// current position and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void ReadBytes(List<byte> v)
    {
        var span = CollectionsMarshal.AsSpan(v);
        int length = span.Length;
        stream.Span.Slice(Position, length).CopyTo(span);
        Skip(length);
    }

    /// <summary>
    /// Reads a int8 at the current position and advances the position.
    /// </summary>
    public sbyte ReadInt8()
    {
        var v = ReadInt8At(Position);
        Skip(sizeof(sbyte));
        return v;
    }

    /// <summary>
    /// Reads a uint8 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public byte ReadUInt8()
    {
        var v = ReadUInt8At(Position);
        Skip(sizeof(byte));
        return v;
    }

    /// <summary>
    /// Reads a int16 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public short ReadInt16()
    {
        var v = ReadInt16At(Position);
        Skip(sizeof(short));
        return v;
    }

    /// <summary>
    /// Reads a uint16 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public ushort ReadUInt16()
    {
        var v = ReadUInt16At(Position);
        Skip(sizeof(ushort));
        return v;
    }

    /// <summary>
    /// Reads a int32 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public int ReadInt32()
    {
        var v = ReadInt32At(Position);
        Skip(sizeof(int));
        return v;
    }

    /// <summary>
    /// Reads a uint32 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public uint ReadUInt32()
    {
        var v = ReadUInt32At(Position);
        Skip(sizeof(uint));
        return v;
    }

    /// <summary>
    /// Reads a int64 and at the current position advances the position.
    /// </summary>
    /// <returns></returns>
    public long ReadInt64()
    {
        var v = ReadInt64At(Position);
        Skip(sizeof(long));
        return v;
    }

    /// <summary>
    /// Reads a uint64 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public ulong ReadUInt64()
    {
        var v = ReadUInt64At(Position);
        Skip(sizeof(ulong));
        return v;
    }

    /// <summary>
    /// Reads a float32 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public float ReadFloat32()
    {
        var v = ReadFloat32At(Position);
        Skip(sizeof(float));
        return v;
    }

    /// <summary>
    /// Reads a float64 at the current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public double ReadFloat64()
    {
        var v = ReadFloat64At(Position);
        Skip(sizeof(double));
        return v;
    }

    /// <summary>
    /// Reads a null terminated Shift-JIS encoded string at the
    /// current position and advances the position.
    /// </summary>
    /// <returns></returns>
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

    /// <summary>
    /// Reads a null terminated UTF-8 encoded string at the
    /// current position and advances the position.
    /// </summary>
    /// <returns></returns>
    public string ReadUTF8String()
    {
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

    /// <summary>
    /// Reads a null terminated UTF-16 encoded string at the
    /// current position and advances the position.
    /// </summary>
    /// <returns></returns>
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

    /// <summary>
    /// Reads a int8 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public sbyte ReadInt8At(int position)
    {
        return (sbyte)stream.Span[position];
    }

    /// <summary>
    /// Reads a uint8 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public byte ReadUInt8At(int position)
    {
        return stream.Span[position];
    }

    /// <summary>
    /// Reads a int16 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public short ReadInt16At(int position)
    {
        return BinaryPrimitives.ReadInt16LittleEndian(stream.Span.Slice(position, sizeof(short)));
    }

    /// <summary>
    /// Reads a uint16 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public ushort ReadUInt16At(int position)
    {
        return BinaryPrimitives.ReadUInt16LittleEndian(stream.Span.Slice(position, sizeof(ushort)));
    }

    /// <summary>
    /// Reads a int32 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public int ReadInt32At(int position)
    {
        return BinaryPrimitives.ReadInt32LittleEndian(stream.Span.Slice(position, sizeof(int)));
    }

    /// <summary>
    /// Reads a uint32 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public uint ReadUInt32At(int position)
    {
        return BinaryPrimitives.ReadUInt32LittleEndian(stream.Span.Slice(position, sizeof(uint)));
    }

    /// <summary>
    /// Reads a int64 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public long ReadInt64At(int position)
    {
        return BinaryPrimitives.ReadInt64LittleEndian(stream.Span.Slice(position, sizeof(long)));
    }

    /// <summary>
    /// Reads a uint64 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public ulong ReadUInt64At(int position)
    {
        return BinaryPrimitives.ReadUInt64LittleEndian(stream.Span.Slice(position, sizeof(ulong)));
    }

    /// <summary>
    /// Reads a float32 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public float ReadFloat32At(int position)
    {
        return BinaryPrimitives.ReadSingleLittleEndian(stream.Span.Slice(position, sizeof(float)));
    }

    /// <summary>
    /// Reads a float64 at the specified position without advancing the position.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public double ReadFloat64At(int position)
    {
        return BinaryPrimitives.ReadDoubleLittleEndian(stream.Span.Slice(position, sizeof(double)));
    }

    /// <summary>
    /// Reads a int32 at the current position. If the value is negative,
    /// an exception is thrown. Otherwise, the position is advanced.
    /// </summary>
    /// <returns></returns>
    public int ReadNonnegativeInt32()
    {
        var value = ReadNonnegativeInt32At(Position);
        Skip(sizeof(int));
        return value;
    }

    /// <summary>
    /// Reads a int64 at the current position. If the value is negative,
    /// an exception is thrown. Otherwise, the position is advanced.
    /// </summary>
    /// <returns></returns>
    public long ReadNonnegativeInt64()
    {
        var value = ReadNonnegativeInt64At(Position);
        Skip(sizeof(long));
        return value;
    }

    /// <summary>
    /// Reads a big endian int32 at the current position. If the value is negative,
    /// an exception is thrown. Otherwise, the position is advanced.
    /// </summary>
    /// <returns></returns>
    public int ReadNonnegativeInt32BE()
    {
        var value = ReadNonnegativeInt32BEAt(Position);
        Skip(sizeof(int));
        return value;
    }

    /// <summary>
    /// Reads a big endian int64 at the current position. If the value is negative,
    /// an exception is thrown. Otherwise, the position is advanced.
    /// </summary>
    /// <returns></returns>
    public long ReadNonnegativeInt64BE()
    {
        var value = ReadNonnegativeInt64BEAt(Position);
        Skip(sizeof(long));
        return value;
    }

    /// <summary>
    /// Reads a int32 at the specified position. If the value is negative,
    /// an exception is thrown.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public int ReadNonnegativeInt32At(int position)
    {
        var value = ReadInt32At(position);
        return value < 0 ? throw new InvalidDataException("Unexpected negative int32.") : value;
    }

    /// <summary>
    /// Reads a int64 at the specified position. If the value is negative,
    /// an exception is thrown.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public long ReadNonnegativeInt64At(int position)
    {
        var value = ReadInt64At(position);
        return value < 0 ? throw new InvalidDataException("Unexpected negative int64.") : value;
    }

    /// <summary>
    /// Reads a big endian int32 at the specified position. If the value is negative,
    /// an exception is thrown.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public int ReadNonnegativeInt32BEAt(int position)
    {
        var value = BinaryPrimitives.ReadInt32BigEndian(stream.Span.Slice(position, sizeof(int)));
        return value < 0 ? throw new InvalidDataException("Unexpected negative int32BE.") : value;
    }

    /// <summary>
    /// Reads a big endian int64 at the specified position. If the value is negative,
    /// an exception is thrown.
    /// </summary>
    /// <param name="position"></param>
    /// <returns></returns>
    public long ReadNonnegativeInt64BEAt(int position)
    {
        var value = BinaryPrimitives.ReadInt64BigEndian(stream.Span.Slice(position, sizeof(long)));
        return value < 0 ? throw new InvalidDataException("Unexpected negative int64BE.") : value;
    }
}
