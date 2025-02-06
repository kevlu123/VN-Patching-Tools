using System.Buffers.Binary;
using System.Text;

namespace Ws2Explorer;

/// <summary>
/// A class for writing binary data to a <see cref="BinaryStream"/>.
/// All data is written in little-endian format.
/// </summary>
public class BinaryWriter
{
    private readonly BinaryStream stream;

    /// <summary>
    /// Gets or sets the current position in the stream.
    /// </summary>
    public int Position { get; set; }

    /// <summary>
    /// Gets the length of the stream.
    /// </summary>
    public int Length { get; }

    /// <summary>
    /// Initializes a new instance of the <see cref="BinaryWriter"/> class.
    /// The stream must be writable, otherwise an <see cref="InvalidOperationException"/> is thrown.
    /// </summary>
    /// <param name="stream"></param>
    public BinaryWriter(BinaryStream stream)
    {
        if (!stream.Writable)
        {
            throw new InvalidOperationException("Stream is not writable.");
        }
        this.stream = stream;
        Length = stream.Length;
    }

    /// <summary>
    /// Seeks to the specified position in the stream.
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
    /// Writes the specified bytes to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteBytes(ReadOnlySpan<byte> v)
    {
        v.CopyTo(stream.Span[Position..]);
        Skip(v.Length);
    }

    /// <summary>
    /// Writes a int8 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteInt8(sbyte v)
    {
        WriteInt8At(Position, v);
        Skip(sizeof(sbyte));
    }

    /// <summary>
    /// Writes a uint8 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUInt8(byte v)
    {
        WriteUInt8At(Position, v);
        Skip(sizeof(byte));
    }

    /// <summary>
    /// Writes a int16 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteInt16(short v)
    {
        WriteInt16At(Position, v);
        Skip(sizeof(short));
    }

    /// <summary>
    /// Writes a uint16 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUInt16(ushort v)
    {
        WriteUInt16At(Position, v);
        Skip(sizeof(ushort));
    }

    /// <summary>
    /// Writes a int32 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteInt32(int v)
    {
        WriteInt32At(Position, v);
        Skip(sizeof(int));
    }

    /// <summary>
    /// Writes a uint32 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUInt32(uint v)
    {
        WriteUInt32At(Position, v);
        Skip(sizeof(uint));
    }

    /// <summary>
    /// Writes a int64 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteInt64(long v)
    {
        WriteInt64At(Position, v);
        Skip(sizeof(long));
    }

    /// <summary>
    /// Writes a uint64 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUInt64(ulong v)
    {
        WriteUInt64At(Position, v);
        Skip(sizeof(ulong));
    }

    /// <summary>
    /// Writes a float32 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteFloat32(float v)
    {
        WriteFloat32At(Position, v);
        Skip(sizeof(float));
    }

    /// <summary>
    /// Writes a float64 to the stream at the current position
    /// and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteFloat64(double v)
    {
        WriteFloat64At(Position, v);
        Skip(sizeof(double));
    }

    /// <summary>
    /// Writes a null terminated Shift-JIS encoded string to the
    /// stream at the current position and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteSjisString(string v)
    {
        WriteBytes(SjisEncoding.Encoding.GetBytes(v));
        WriteUInt8(0);
    }

    /// <summary>
    /// Writes a null terminated UTF-8 encoded string to the
    /// stream at the current position and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUTF8String(string v)
    {
        WriteBytes(Encoding.UTF8.GetBytes(v));
        WriteUInt8(0);
    }

    /// <summary>
    /// Writes a null terminated UTF-16 encoded string to the
    /// stream at the current position and advances the position.
    /// </summary>
    /// <param name="v"></param>
    public void WriteUTF16String(string v)
    {
        WriteBytes(Encoding.Unicode.GetBytes(v));
        WriteUInt16(0);
    }

    /// <summary>
    /// Writes a int8 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteInt8At(int position, sbyte v)
    {
        stream.Span[position] = (byte)v;
    }

    /// <summary>
    /// Writes a uint8 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteUInt8At(int position, byte v)
    {
        stream.Span[position] = v;
    }

    /// <summary>
    /// Writes a int16 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteInt16At(int position, short v)
    {
        BinaryPrimitives.WriteInt16LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a uint16 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteUInt16At(int position, ushort v)
    {
        BinaryPrimitives.WriteUInt16LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a int32 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteInt32At(int position, int v)
    {
        BinaryPrimitives.WriteInt32LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a uint32 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteUInt32At(int position, uint v)
    {
        BinaryPrimitives.WriteUInt32LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a int64 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteInt64At(int position, long v)
    {
        BinaryPrimitives.WriteInt64LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a uint64 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteUInt64At(int position, ulong v)
    {
        BinaryPrimitives.WriteUInt64LittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a float32 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteFloat32At(int position, float v)
    {
        BinaryPrimitives.WriteSingleLittleEndian(stream.Span[position..], v);
    }

    /// <summary>
    /// Writes a float64 at the specified position.
    /// </summary>
    /// <param name="position"></param>
    /// <param name="v"></param>
    public void WriteFloat64At(int position, double v)
    {
        BinaryPrimitives.WriteDoubleLittleEndian(stream.Span[position..], v);
    }
}
