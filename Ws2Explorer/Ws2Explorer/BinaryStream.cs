using Pipelines.Sockets.Unofficial;
using System.Runtime.InteropServices;
using System.Text;

namespace Ws2Explorer;

public sealed class BinaryStream : IDisposable
{
    private sealed class Allocation
    {
        private bool freed;
        private int refCount = 1;

        public unsafe byte* Pointer { get; }

        public int Length { get; }

        public Memory<byte> Memory
        {
            get
            {
                unsafe
                {
                    using var umm = new UnmanagedMemoryManager<byte>(Pointer, Length);
                    return umm.Memory;
                }
            }
        }

        public Allocation(int len)
        {
            ArgumentOutOfRangeException.ThrowIfNegative(len);
            unsafe
            {
                Pointer = (byte*)NativeMemory.Alloc((nuint)len);
                Length = len;
            }
        }

        public void IncRef()
        {
            ObjectDisposedException.ThrowIf(freed, this);
            refCount++;
        }

        public void DecRef()
        {
            ObjectDisposedException.ThrowIf(refCount <= 0, this);
            refCount--;
            if (refCount == 0)
            {
                Free();
            }
        }

        private void Free()
        {
            if (!freed)
            {
                unsafe
                {
                    NativeMemory.Free(Pointer);
                }
                freed = true;
            }
        }

        ~Allocation()
        {
            Free();
        }
    }

    public static readonly BinaryStream Empty = new(0);

    private readonly Allocation? allocation;
    private readonly byte[] byteArray = [];
    private readonly int offset;
    private bool disposedValue;

    public int Length { get; }

    public Span<byte> Span
    {
        get
        {
            if (allocation != null)
            {
                unsafe
                {
                    return new Span<byte>(allocation.Pointer + offset, Length);
                }
            }
            return byteArray.AsSpan(offset, Length);
        }
    }

    public Memory<byte> Memory
    {
        get
        {
            if (allocation != null)
            {
                return allocation.Memory.Slice(offset, Length);
            }
            return byteArray.AsMemory(offset, Length);
        }
    }

    public BinaryStream(string utfData)
        : this(Encoding.UTF8.GetBytes(utfData), 0, Encoding.UTF8.GetByteCount(utfData))
    {
    }

    public BinaryStream(byte[] data)
        : this(data, 0, data.Length)
    {
    }

    public BinaryStream(byte[] data, int offset, int len)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(offset, nameof(offset));
        ArgumentOutOfRangeException.ThrowIfNegative(len, nameof(len));
        byteArray = data;
        this.offset = offset;
        Length = len;
    }

    public BinaryStream(int len)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(len, nameof(len));
        allocation = new Allocation(len);
        offset = 0;
        Length = len;
    }

    private BinaryStream(BinaryStream data, int offset, int len)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(offset, nameof(offset));
        ArgumentOutOfRangeException.ThrowIfNegative(len, nameof(len));
        this.offset = data.offset + offset;
        Length = len;
        if (data.allocation != null)
        {
            allocation = data.allocation;
            allocation.IncRef();
        }
        else
        {
            byteArray = data.byteArray;
        }
    }

    public BinaryStream SubStream(int offset, int len)
    {
        return new BinaryStream(this, offset, len);
    }

    public BinaryStream Clone()
    {
        return SubStream(0, Length);
    }

    public static async Task<BinaryStream> CopyFrom(
        Stream stream,
        string streamName = "",
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var longLen = stream.Length;
        if (longLen > int.MaxValue)
        {
            throw new ArgumentException("Stream too large.", nameof(stream));
        }
        var len = (int)longLen;

        var bs = new BinaryStream(len);
        var buffer = bs.Memory;
        try
        {
            const int BLOCK_SIZE = 8 * 1024 * 1024;
            int loops = (int)Math.Ceiling((double)len / BLOCK_SIZE);
            using var pr = new ProgressReporter($"Reading {streamName}", progress, loops);
            for (var i = 0; i < len; i += BLOCK_SIZE)
            {
                var blockSize = Math.Min(BLOCK_SIZE, len - i);
                await stream.ReadAsync(buffer.Slice(i, blockSize), ct);
                pr?.Step();
            }
            return bs;
        }
        catch
        {
            bs.DecRef();
            throw;
        }
    }

    public async Task CopyTo(
        Stream destination,
        string streamName = "",
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var buffer = Memory;
        const int BLOCK_SIZE = 8 * 1024 * 1024;
        int loops = (int)Math.Ceiling((double)Length / BLOCK_SIZE);
        using var pr = new ProgressReporter($"Writing {streamName}", progress, loops);
        for (var i = 0; i < Length; i += BLOCK_SIZE)
        {
            var blockSize = Math.Min(BLOCK_SIZE, Length - i);
            await destination.WriteAsync(buffer.Slice(i, blockSize), ct);
            pr?.Step();
        }
    }

    public Task<T> Decode<T>(IProgress<TaskProgressInfo>? progress = null, bool decRef = true)
        where T : class, IFile<T>
    {
        return Task.Run(() =>
        {
            using var pr = new ProgressReporter("Decoding file", progress);
            var file = T.Decode(this, out _);
            if (decRef)
            {
                DecRef();
            }
            return file;
        });
    }

    public Task<IFile> Decode(IProgress<TaskProgressInfo>? progress = null, bool decRef = true)
    {
        return Task.Run(() =>
        {
            using var pr = new ProgressReporter("Decoding file", progress, 14);

            if (Length == 0)
            {
                return TextFile.Decode(this, out _);
            }

            var candidates = new List<IFile>();
            bool TryType<T>()
                where T : class, IFile<T>
            {
                try
                {
                    var file = T.Decode(this, out var confidence);
                    candidates!.Add(file);
                    pr.Step();
                    return confidence == DecodeConfidence.High;
                }
                catch
                {
                    return false;
                }
            }

            bool highConfidence =
                // Try signature verified types first in order of commonality
                TryType<PngFile>() ||
                TryType<PnaFile>() ||
                TryType<LuacFile>() ||
                TryType<OggFile>() ||
                TryType<VideoFile>() ||
                TryType<PanFile>() ||
                TryType<TtfFile>() ||
                TryType<OtfFile>() ||
                // Try other types in order of commonality
                TryType<ArcFile>() ||
                TryType<Ws2File>() ||
                TryType<PtfFile>() ||
                TryType<TextFile>() ||
                // Final fallback (always succeeds)
                TryType<BinFile>();
            if (decRef)
            {
                for (var i = 0; i < candidates.Count - 1; i++)
                {
                    DecRef();
                }
            }
            return highConfidence ? candidates[^1] : candidates[0];
        });
    }

    public static bool StreamEquals(BinaryStream lhs, BinaryStream rhs)
    {
        return lhs.Memory.Span.SequenceEqual(rhs.Memory.Span);
    }

    public void IncRef()
    {
        allocation?.IncRef();
    }

    public void DecRef()
    {
        allocation?.DecRef();
    }

    // For use in using statements only.
    // Do not use if calling DecRef manually.
    public void Dispose()
    {
        if (!disposedValue)
        {
            allocation?.DecRef();
            disposedValue = true;
        }
    }
}

public static class BinaryStreamExtensions
{
    public static async Task<T> Decode<T>(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        bool decRef = true)
        where T : class, IFile<T>
    {
        return await (await self).Decode<T>(progress, decRef);
    }

    public static async Task<IFile> Decode(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        bool decRef = true)
    {
        return await (await self).Decode(progress, decRef);
    }
}
