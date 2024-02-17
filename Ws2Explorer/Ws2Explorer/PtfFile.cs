/*
PTF Compression Format

4 bytes:        length of the decompressed data, uint32 little-endian
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
1 byte:         format bits
8x[1,2] bytes:  data/reference to data
...

While output is written, a circular buffer of 4096 bytes keeps
track of the output history.

After all output has been written, the output is XORed with an
externally provided value. This value can be easily inferred
by looking at the first few bytes of the output.

Format bits is an array of 8 bits corresponding to the mode
of 8 'blocks' of data that follow. This bit array is read
starting from the least significant bit.

If the format bit is 1, the next byte is a single byte of data.

If the format bit is 0, the next two bytes encode a reference
to a sequence of data in the history buffer.
Denote the two bytes by 0bAAAABBBB 0bCCCCDDDD.
The index of the sequence in the history buffer is 0bBBBBCCCC.
The length of the sequence is 0b0000DDDD+2 bytes.
This sequence may wrap around the end of the history buffer.
If the index is 0, the end of the data is reached and the
reference is not used.
 */

namespace Ws2Explorer;

public class PtfFile : BinaryFile, IFolder {
    private BinaryStream decompressed;

    public bool CanRenameChildren => false;
    public byte XorKey { get; }

    public PtfFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        decompressed = Decompress(stream, out var xorKey);
        XorKey = xorKey;
    }

    public List<FileMetadata> ListChildren() {
        return new List<FileMetadata> {
            new("data", decompressed.Length),
        };
    }

    public Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (name != "data") {
            throw new FileNotFoundException();
        }

        return Task.FromResult<IFile>(new BinaryFile(this, name, decompressed));
    }

    public Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        if (child != "data") {
            throw new FileNotFoundException();
        }

        decompressed = newData;
        return Task.CompletedTask;
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public async Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        if (fromFullPath.Length != to.Length) {
            throw new ArgumentException("Argument length mismatch", nameof(to));
        }

        var invalid = to
            .Where(x => x != "data")
            .Select(x => x ?? "")
            .ToList();
        if (invalid.Count > 0) {
            throw new FileNotFoundException(string.Join(", ", invalid));
        }

        if (to.Length > 1) {
            throw new ArgumentException("Duplicate destination", nameof(to));
        }

        var src = await Folder.GetFile(fromFullPath[0], ct, progress);
        if (src is not BinaryFile binaryFile) {
            throw new InvalidOperationException($"Copying folder {((IFolder)src).FullPath} into PTF file is not supported.");
        }

        decompressed = binaryFile.Stream;

        await RebuildStream(ct, progress);
    }

    private async Task RebuildStream(CancellationToken ct, ITaskProgress? progress) {
        Stream = Compress(decompressed, XorKey);

        if (Parent != null) {
            await Parent.NotifyChildChanged(Name, Stream, ct, progress);
        }
    }

    public Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public static byte InferXorKey(byte[] data) {
        var magic = data.Take(4).ToArray();

        // OTF file (magic 0x4F 0x54 0x54 0x4F)
        if (magic[0] == magic[3] && magic[1] == magic[2]) {
            return (byte)(magic[0] ^ 0x4F);
        }

        // TTF file (magic 0x00 0x01 0x00 0x00)
        if (magic[0] == magic[2] && magic[2] == magic[3]) {
            return (byte)(magic[0] ^ 0x00);
        }

        throw new InvalidDataException("Invalid magic");
    }

    public static BinaryStream Decompress(BinaryStream stream, out byte xorKey) {
        stream.Reset();
        var outputLen = stream.ReadInt32();
        var outputBuffer = new byte[outputLen];
        var outputIndex = 0;

        var history = new byte[0x1000];
        var historyWriteIndex = 1;

        while (true) {
            var formatBits = stream.ReadByte();
            for (int i = 0; i < 8; i++, formatBits >>= 1) {
                if ((formatBits & 1) == 1) {
                    var input = stream.ReadByte();
                    outputBuffer[outputIndex++] = input;
                    history[historyWriteIndex] = input;
                    historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                } else {
                    var b1 = stream.ReadByte();
                    var b2 = stream.ReadByte();
                    var historyReadIndex = (b1 << 4) | (b2 >> 4);
                    if (historyReadIndex == 0) {
                        if (outputIndex < outputLen) {
                            throw new InvalidDataException("Invalid output length");
                        }

                        xorKey = InferXorKey(outputBuffer);
                        for (int j = 0; j < outputBuffer.Length; j++) {
                            outputBuffer[j] ^= xorKey;
                        }

                        return new BinaryStream(outputBuffer);
                    }

                    var length = (b2 & 0xF) + 2;
                    for (int j = 0; j < length; j++) {
                        var input = history[historyReadIndex];
                        outputBuffer[outputIndex++] = input;
                        history[historyWriteIndex] = input;
                        historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                        historyReadIndex = (historyReadIndex + 1) & 0xFFF;
                    }
                }
            }
        }
    }

    public static BinaryStream Compress(BinaryStream data, byte xorKey) {
        data.Reset();
        var input = new byte[data.Length];
        for (int i = 0; i < data.Length; i++) {
            input[i] = (byte)(data.ReadByte() ^ xorKey);
        }

        var output = new List<byte>();
        output.AddRange(BitConverter.GetBytes(input.Length));

        var inputIndex = 0;

        var formatBits = new List<byte>();
        var blockData = new List<byte>();

        bool exit = false;
        while (!exit) {
            formatBits.Clear();
            blockData.Clear();

            for (int i = 0; i < 8; i++) {
                if (inputIndex >= input.Length) {
                    exit = true;
                    formatBits.Add(0);
                    blockData.Add(0);
                    blockData.Add(0);
                    break;
                }
                formatBits.Add(1);
                blockData.Add(input[inputIndex++]);
            }

            while (formatBits.Count < 8) {
                formatBits.Add(0);
            }

            var format = formatBits[0]
                | (formatBits[1] << 1)
                | (formatBits[2] << 2)
                | (formatBits[3] << 3)
                | (formatBits[4] << 4)
                | (formatBits[5] << 5)
                | (formatBits[6] << 6)
                | (formatBits[7] << 7);
            output.Add((byte)format);
            output.AddRange(blockData);
        }

        return new BinaryStream(output.ToArray());
    }
}
