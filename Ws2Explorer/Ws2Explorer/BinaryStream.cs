using System.Text;

namespace Ws2Explorer;

public class BinaryStream {
    private readonly byte[] data;
    private readonly int start;
    private readonly BinaryReader reader;
    private readonly BinaryWriter writer;

    public MemoryStream MemoryStream { get; }
    public ReadOnlyMemory<byte> Memory => data.AsMemory(start, Length);
    public int Length { get; }
    public (byte[] data, int start, int len) RawBuffer => (data, start, Length);

    public BinaryStream(byte[] data) : this(data, 0, data.Length) { }

    public BinaryStream(byte[] data, int start, int len) {
        this.data = data;
        this.start = start;
        Length = len;

        MemoryStream = new MemoryStream(data, start, len);
        reader = new BinaryReader(MemoryStream);
        writer = new BinaryWriter(MemoryStream);
    }

    public void Reset() {
        reader.BaseStream.Seek(0, SeekOrigin.Begin);
        writer.BaseStream.Seek(0, SeekOrigin.Begin);
    }

    public BinaryStream GetSubStream(int start, int len) {
        if (start < 0 || start > Length) {
            throw new ArgumentOutOfRangeException(nameof(start));
        } else if (len < 0 || start + len > Length) {
            throw new ArgumentOutOfRangeException(nameof(len));
        }

        return new BinaryStream(data, this.start + start, len);
    }

    public async Task CopyToAsync(Stream stream, CancellationToken ct) {
        Reset();
        await MemoryStream.CopyToAsync(stream, ct);
    }

    public void WriteBytes(byte[] bytes) {
        writer.Write(bytes);
    }

    public byte[] ReadBytes(int len) {
        return reader.ReadBytes(len);
    }

    public void WriteByte(byte value) {
        writer.Write(value);
    }

    public byte ReadByte() {
        return reader.ReadByte();
    }

    public void WriteInt32(int value) {
        writer.Write(value);
    }

    public int ReadInt32() {
        return reader.ReadInt32();
    }

    public void WriteSingle(float value) {
        writer.Write(value);
    }

    public float ReadSingle() {
        return reader.ReadSingle();
    }

    public void WriteStringUTF16(string value) {
        writer.Write(Encoding.Unicode.GetBytes(value));
        writer.Write((short)0);
    }

    public string ReadStringUTF16() {
        var bytes = new List<byte>();
        while (true) {
            var b1 = reader.ReadByte();
            var b2 = reader.ReadByte();
            if (b1 == 0 && b2 == 0) {
                break;
            }

            bytes.Add(b1);
            bytes.Add(b2);
        }

        return Encoding.Unicode.GetString(bytes.ToArray());
    }

    public async Task<IFile> Deduce(IFolder? parent, string name) {
        Reset();
        if (Length <= BinaryFile.MAX_TEXT_SIZE) {
            try { return BinaryFile.AsText(parent, name, this); } catch { Reset(); }
        }

        // Potentially long-running
        return await Task.Run(() => {
            try { return new PnaFile(parent, name, this); } catch { Reset(); }
            try { return new ArcFile(parent, name, this); } catch { Reset(); }
            try { return new PtfFile(parent, name, this); } catch { Reset(); }
            try { return new Ws2File(parent, name, this); } catch { Reset(); }
            try { return new ImageFile(parent, name, this); } catch { Reset(); }
            try { return new ZipFile(parent, name, this); } catch { Reset(); }
            try { return new VideoFile(parent, name, this); } catch { Reset(); }
            return new BinaryFile(parent, name, this);
        });
    }
}