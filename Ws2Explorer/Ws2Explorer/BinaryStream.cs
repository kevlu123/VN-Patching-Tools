using Pipelines.Sockets.Unofficial;
using System.Runtime.InteropServices;
using System.Text;
using System.Diagnostics.CodeAnalysis;

namespace Ws2Explorer;

public sealed class BinaryStream : IDisposable
{
    private sealed class Allocation
    {
        private int freed;
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
            var newRef = Interlocked.Increment(ref refCount);
            ObjectDisposedException.ThrowIf(newRef == 1, this);
        }

        public void DecRef()
        {
            int newRef = Interlocked.Decrement(ref refCount);
            ObjectDisposedException.ThrowIf(newRef < 0, this);
            if (newRef == 0)
            {
                Free();
            }
        }

        private void Free()
        {
            if (Interlocked.Exchange(ref freed, 1) == 0)
            {
                unsafe
                {
                    NativeMemory.Free(Pointer);
                }
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

    public bool Writable { get; private set; } = true;

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

    public BinaryStream(string utf8Data)
        : this(Encoding.UTF8.GetBytes(utf8Data), 0, Encoding.UTF8.GetByteCount(utf8Data))
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

    public Task<T> Decode<T>(bool decRef = true)
        where T : class, IFile<T>
    {
        return Task.Run(() =>
        {
            try
            {
                return T.Decode(this, out _);
            }
            finally
            {
                if (decRef)
                {
                    DecRef();
                }
            }
        });
    }

#pragma warning disable CA1068 // CancellationToken parameters must come last
    public Task<IFile> Decode(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        return DecodeWithHint<PngFile>(progress, ct, decRef: decRef);
    }

    public Task<IFile> DecodeWithHint(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        var ext = Path.GetExtension(filename).ToLowerInvariant();
        return ext switch
        {
            ".png" => DecodeWithHint<PngFile>(progress, ct, decRef: decRef),
            ".pna" => DecodeWithHint<PnaFile>(progress, ct, decRef: decRef),
            ".lua" => DecodeWithHint<LuacFile>(progress, ct, decRef: decRef),
            ".ogg" => DecodeWithHint<OggFile>(progress, ct, decRef: decRef),
            ".dat" => DecodeWithHint<VideoFile>(progress, ct, decRef: decRef),
            ".pan" => DecodeWithHint<PanFile>(progress, ct, decRef: decRef),
            ".ttf" => DecodeWithHint<TtfFile>(progress, ct, decRef: decRef),
            ".otf" => DecodeWithHint<OtfFile>(progress, ct, decRef: decRef),
            ".arc" => DecodeWithHint<ArcFile>(progress, ct, decRef: decRef),
            ".ws2" => DecodeWithHint<Ws2File>(progress, ct, decRef: decRef),
            ".ptf" => DecodeWithHint<PtfFile>(progress, ct, decRef: decRef),
            ".txt" => DecodeWithHint<TextFile>(progress, ct, decRef: decRef),
            _ => Decode(progress, ct, decRef: decRef),
        };
    }

    public Task<IFile> DecodeWithHint<Hint>(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
        where Hint : class, IFile<Hint>
    {
        return Task.Run(() =>
        {
            using var pr = new ProgressReporter("Decoding file", progress, 14);

            if (Length == 0)
            {
                var ret = TextFile.Decode(this, out _);
                if (decRef)
                {
                    DecRef();
                }
                return ret;
            }

            try
            {
                var ret = Hint.Decode(this, out var confidence);
                if (confidence == DecodeConfidence.High)
                {
                    if (decRef)
                    {
                        DecRef();
                    }
                    return ret;
                }
                else
                {
                    ret.Dispose();
                }
            }
            catch (DecodeException) { }
            finally
            {
                pr.Step();
            }

            var candidates = new List<IFile>();
            bool TryType<T>()
                where T : class, IFile<T>
            {
                if (typeof(T) == typeof(Hint))
                {
                    return false;
                }
                if (ct.IsCancellationRequested)
                {
                    return true; // Short circuit further down
                }
                try
                {
                    var file = T.Decode(this, out var confidence);
                    candidates!.Add(file);
                    return confidence == DecodeConfidence.High;
                }
                catch
                {
                    return false;
                }
                finally
                {
                    pr.Step();
                }
            }

            void DisposeCandidates(IFile? except)
            {
                foreach (var candidate in candidates!)
                {
                    if (candidate != except)
                    {
                        candidate.Dispose();
                    }
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
                DecRef();
            }
            if (ct.IsCancellationRequested)
            {
                DisposeCandidates(null);
                throw new TaskCanceledException();
            }
            var result = highConfidence ? candidates[^1] : candidates[0];
            DisposeCandidates(result);
            return result;
        });
    }
#pragma warning restore CA1068 // CancellationToken parameters must come last

    public static bool StreamEquals(BinaryStream lhs, BinaryStream rhs)
    {
        return lhs.Memory.Span.SequenceEqual(rhs.Memory.Span);
    }

    public void Freeze()
    {
        Writable = false;
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
    public static async Task<T> Decode<T>(this Task<BinaryStream> self, bool decRef = true)
        where T : class, IFile<T>
    {
        return await (await self).Decode<T>(decRef: decRef);
    }

#pragma warning disable CA1068 // CancellationToken parameters must come last
    [SuppressMessage("Design", "CA1068:CancellationToken parameters must come last", Justification = "decRef should only be used as a named argument.")]
    public static async Task<IFile> Decode(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        return await (await self).Decode(progress, ct, decRef: decRef);
    }

    [SuppressMessage("Design", "CA1068:CancellationToken parameters must come last", Justification = "decRef should only be used as a named argument.")]
    public static async Task<IFile> DecodeWithHint<Hint>(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
        where Hint : class, IFile<Hint>
    {
        return await (await self).DecodeWithHint<Hint>(progress, ct, decRef: decRef);
    }

    public static async Task<IFile> DecodeWithHint(
        this Task<BinaryStream> self,
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        return await (await self).DecodeWithHint(filename, progress, ct, decRef: decRef);
    }
#pragma warning restore CA1068 // CancellationToken parameters must come last
}
