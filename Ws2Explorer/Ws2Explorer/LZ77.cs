namespace Ws2Explorer;

/// <summary>
/// LZ77 compression and decompression methods used by the game.
/// </summary>
public static class LZ77
{
    /// <summary>
    /// Decompress a stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <returns></returns>
    /// <exception cref="InvalidDataException"></exception>
    public static BinaryStream Decompress(BinaryStream stream)
    {
        return Decompress(stream, null);
    }

    internal static BinaryStream Decompress(BinaryStream stream, Action<List<byte>>? failCheck)
    {
        var reader = new BinaryReader(stream);
        var outputBuffer = new List<byte>();
        var history = new byte[0x1000];
        var historyWriteIndex = 1;

        try
        {
            while (true)
            {
                for (int n = 0; n < 512; n++)
                {
                    var formatBits = reader.ReadUInt8();
                    for (int i = 0; i < 8; i++, formatBits >>= 1)
                    {
                        if ((formatBits & 1) == 1)
                        {
                            var input = reader.ReadUInt8();
                            outputBuffer.Add(input);
                            history[historyWriteIndex] = input;
                            historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                        }
                        else
                        {
                            var b1 = reader.ReadUInt8();
                            var b2 = reader.ReadUInt8();
                            var historyReadIndex = (b1 << 4) | (b2 >> 4);
                            if (historyReadIndex == 0)
                            {
                                goto end;
                            }

                            var length = (b2 & 0xF) + 2;
                            for (int j = 0; j < length; j++)
                            {
                                var input = history[historyReadIndex];
                                outputBuffer.Add(input);
                                history[historyWriteIndex] = input;
                                historyWriteIndex = (historyWriteIndex + 1) & 0xFFF;
                                historyReadIndex = (historyReadIndex + 1) & 0xFFF;
                            }
                        }
                    }
                }
                failCheck?.Invoke(outputBuffer);
            }
        }
        catch (IndexOutOfRangeException ex)
        {
            throw new InvalidDataException("Not enough data.", ex);
        }

    end:
        if (reader.Position != stream.Length)
        {
            throw new InvalidDataException("Trailing data.");
        }
        return new BinaryStream([.. outputBuffer]);
    }

    /// <summary>
    /// Compress a stream.
    /// </summary>
    /// <param name="stream"></param>
    /// <returns></returns>
    public static BinaryStream Compress(BinaryStream stream)
    {
        return Compress(stream, []);
    }

    internal static BinaryStream Compress(BinaryStream stream, IEnumerable<byte> startBytes)
    {
        var input = stream.Span;
        var output = new List<byte>();
        var inputIndex = 0;
        var formatBits = new List<byte>();
        var blockData = new List<byte>();
        bool exit = false;
        output.AddRange(startBytes);

        while (!exit)
        {
            formatBits.Clear();
            blockData.Clear();

            for (int i = 0; i < 8; i++)
            {
                if (inputIndex >= input.Length)
                {
                    exit = true;
                    formatBits.Add(0);
                    blockData.Add(0);
                    blockData.Add(0);
                    break;
                }
                formatBits.Add(1);
                blockData.Add(input[inputIndex++]);
            }

            while (formatBits.Count < 8)
            {
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

        return new BinaryStream([.. output]);
    }
}
