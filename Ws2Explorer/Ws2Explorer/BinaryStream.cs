using Pipelines.Sockets.Unofficial;
using System.Runtime.InteropServices;
using System.Text;
using Ws2Explorer.FileTypes;

namespace Ws2Explorer;

/// <summary>
/// A class holding binary data.
/// The internal data is reference counted and a new
/// instance of <see cref="BinaryStream"/> has a reference count of 1.
/// The data must be less than 2GB.
/// </summary>
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

    /// <summary>
    /// An empty binary stream.
    /// </summary>
    public static readonly BinaryStream Empty = new(0);

    private readonly Allocation? allocation;
    private readonly byte[] byteArray = [];
    private readonly int offset;
    private bool disposedValue;

    /// <summary>
    /// Gets the length of the stream.
    /// </summary>
    public int Length { get; }

    /// <summary>
    /// Gets a value indicating whether the stream is writable.
    /// </summary>
    public bool Writable { get; private set; } = true;

    /// <summary>
    /// Gets the data as a Span.
    /// </summary>
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

    /// <summary>
    /// Gets the data as a Memory.
    /// </summary>
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

    /// <summary>
    /// Constructs a new binary stream from a non-null terminated UTF-8 string.
    /// </summary>
    /// <param name="utf8Data"></param>
    public BinaryStream(string utf8Data)
        : this(Encoding.UTF8.GetBytes(utf8Data), 0, Encoding.UTF8.GetByteCount(utf8Data))
    {
    }

    /// <summary>
    /// Constructs a new binary stream from a byte array.
    /// </summary>
    /// <param name="data"></param>
    public BinaryStream(byte[] data)
        : this(data, 0, data.Length)
    {
    }

    /// <summary>
    /// Constructs a new binary stream from part of a byte array.
    /// </summary>
    /// <param name="data"></param>
    /// <param name="offset"></param>
    /// <param name="len"></param>
    public BinaryStream(byte[] data, int offset, int len)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(offset, nameof(offset));
        ArgumentOutOfRangeException.ThrowIfNegative(len, nameof(len));
        byteArray = data;
        this.offset = offset;
        Length = len;
    }

    /// <summary>
    /// Constructs a new binary stream from a new buffer of the specified length.
    /// </summary>
    /// <param name="len"></param>
    public BinaryStream(int len)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(len, nameof(len));
        allocation = new Allocation(len);
        offset = 0;
        Length = len;
    }

    /// <summary>
    /// Constructs a new binary stream from a part of another binary stream.
    /// </summary>
    /// <param name="data"></param>
    /// <param name="offset"></param>
    /// <param name="len"></param>
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

    /// <summary>
    /// Constructs a new binary stream from a part of another binary stream.
    /// </summary>
    /// <param name="offset"></param>
    /// <param name="len"></param>
    /// <returns></returns>
    public BinaryStream SubStream(int offset, int len)
    {
        return new BinaryStream(this, offset, len);
    }

    /// <summary>
    /// Constructs a new binary stream from a <see cref="Stream"/>.
    /// </summary>
    /// <param name="stream">The stream to copy data from.</param>
    /// <param name="streamName">
    /// The name of the stream being copied from.
    /// This is used for progress reporting.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Writes the data to a <see cref="Stream"/>.
    /// </summary>
    /// <param name="stream">The stream to write to.</param>
    /// <param name="streamName">
    /// The name of the stream being copied to.
    /// This is used for progress reporting.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public async Task CopyTo(
        Stream stream,
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
            await stream.WriteAsync(buffer.Slice(i, blockSize), ct);
            pr?.Step();
        }
    }

    /// <summary>
    /// Decodes the binary stream into a file.
    /// </summary>
    /// <typeparam name="T">The file type.</typeparam>
    /// <param name="decRef">
    /// Whether this stream's reference count should be decremented.
    /// The reference count will be decremented even if decoding fails.
    /// </param>
    /// <returns></returns>
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

    /// <summary>
    /// Decodes the binary stream into a file, guessing the file type.
    /// </summary>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef">
    /// Whether this stream's reference count should be decremented.
    /// The reference count will be decremented even if decoding fails.
    /// </param>
    /// <returns></returns>
#pragma warning disable CA1068 // CancellationToken parameters must come last
    public Task<IFile> Decode(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        // Try PNG first, the most common high-confidence only file type.
        return DecodeWithHint<PngFile>(progress, ct, decRef: decRef);
    }

    /// <summary>
    /// Decodes the binary stream into a file, guessing the file type
    /// with the filename as a hint for what to try first.
    /// </summary>
    /// <param name="filename">The hint.</param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef">
    /// Whether this stream's reference count should be decremented.
    /// The reference count will be decremented even if decoding fails.
    /// </param>
    /// <param name="requiredHintConfidence">
    /// The minimum confidence required to accept the hint.
    /// </param>
    /// <returns></returns>
    public Task<IFile> DecodeWithHint(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true,
        DecodeConfidence requiredHintConfidence = DecodeConfidence.High)
    {
        var ext = Path.GetExtension(filename).ToLowerInvariant();
        return ext switch
        {
            ".png" =>            DecodeWithHint<PngFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".pna" or ".mos" =>  DecodeWithHint<PnaFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".lua" =>            DecodeWithHint<LuacFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".ogg" =>            DecodeWithHint<OggFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".dat" =>            DecodeWithHint<VideoFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".pan" =>            DecodeWithHint<PanFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".ttf" =>            DecodeWithHint<TtfFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".otf" =>            DecodeWithHint<OtfFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".ws2" =>            DecodeWithHint<Ws2File>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".ptf" =>            DecodeWithHint<PtfFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".txt" or ".json" => DecodeWithHint<TextFile>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence),
            ".arc" =>            DecodeWithHintOr<ArcFile>(decRef: decRef,
                                    () => DecodeWithHintOr<LegacyArc12File>(decRef: decRef,
                                        () => DecodeWithHint<LegacyArc8File>(progress, ct, decRef: decRef, requiredHintConfidence: requiredHintConfidence))),
            _ => Decode(progress, ct, decRef: decRef),
        };
    }

    private async Task<IFile> DecodeWithHintOr<Hint>(bool decRef, Func<Task<IFile>> or)
        where Hint : class, IFile<Hint>
    {
        IFile arcFile;
        try
        {
            arcFile = await Decode<Hint>(decRef: false);
        }
        catch (DecodeException)
        {
            return await or();
        }
        if (decRef)
        {
            DecRef();
        }
        return arcFile;
    }

    /// <summary>
    /// Decodes the binary stream into a file, guessing the file type
    /// with a hint for what to try first.
    /// </summary>
    /// <typeparam name="Hint">The file type to try first.</typeparam>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef">
    /// Whether this stream's reference count should be decremented.
    /// The reference count will be decremented even if decoding fails.
    /// </param>
    /// <param name="requiredHintConfidence">
    /// The minimum confidence required to accept the hint.
    /// </param>
    /// <returns></returns>
    public Task<IFile> DecodeWithHint<Hint>(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true,
        DecodeConfidence requiredHintConfidence = DecodeConfidence.High)
        where Hint : class, IFile<Hint>
    {
        return Task.Run(() =>
        {
            using var pr = new ProgressReporter("Decoding file", progress, 15);

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
                if ((int)confidence >= (int)requiredHintConfidence)
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
                TryType<LegacyArc12File>() ||
                TryType<LegacyArc8File>() ||
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

    /// <summary>
    /// Checks if the data in two streams is equal.
    /// </summary>
    /// <param name="lhs"></param>
    /// <param name="rhs"></param>
    /// <returns></returns>
    public static bool StreamEquals(BinaryStream lhs, BinaryStream rhs)
    {
        return lhs.Memory.Span.SequenceEqual(rhs.Memory.Span);
    }

    /// <summary>
    /// Sets the stream to read-only.
    /// This disallows any new <see cref="BinaryWriter"/> instances from being created
    /// from this stream. This is irreversible.
    /// </summary>
    public void Freeze()
    {
        Writable = false;
    }

    /// <summary>
    /// Increments the reference count.
    /// </summary>
    public void IncRef()
    {
        allocation?.IncRef();
    }

    /// <summary>
    /// Decrements the reference count.
    /// </summary>
    public void DecRef()
    {
        allocation?.DecRef();
    }

    /// <summary>
    /// Disposes the stream.
    /// This should not be called if you have already called
    /// <see cref="DecRef"/> to trigger cleanup because disposing
    /// too will decrement the internal reference count twice.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            allocation?.DecRef();
            disposedValue = true;
        }
    }
}

/// <summary>
/// Extension methods for <see cref="Task{BinaryStream}"/>.
/// </summary>
public static class BinaryStreamExtensions
{
    /// <summary>
    /// Decodes the binary stream into a file.
    /// See <see cref="BinaryStream.Decode{T}(bool)"/>.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="self"></param>
    /// <param name="decRef"></param>
    /// <returns></returns>
    public static async Task<T> Decode<T>(this Task<BinaryStream> self, bool decRef = true)
        where T : class, IFile<T>
    {
        return await (await self).Decode<T>(decRef: decRef);
    }

    /// <summary>
    /// Decodes the binary stream into a file.
    /// See <see cref="BinaryStream.Decode(IProgress{TaskProgressInfo}?, CancellationToken, bool)"/>.
    /// </summary>
    /// <param name="self"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef"></param>
    /// <returns></returns>
#pragma warning disable CA1068 // CancellationToken parameters must come last
    public static async Task<IFile> Decode(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true)
    {
        return await (await self).Decode(progress, ct, decRef: decRef);
    }

    /// <summary>
    /// Decodes the binary stream into a file.
    /// See <see cref="BinaryStream.DecodeWithHint{Hint}(IProgress{TaskProgressInfo}?, CancellationToken, bool, DecodeConfidence)"/>.
    /// </summary>
    /// <typeparam name="Hint"></typeparam>
    /// <param name="self"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef"></param>
    /// <param name="requiredHintConfidence"></param>
    /// <returns></returns>
    public static async Task<IFile> DecodeWithHint<Hint>(
        this Task<BinaryStream> self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true,
        DecodeConfidence requiredHintConfidence = DecodeConfidence.High)
        where Hint : class, IFile<Hint>
    {
        return await (await self).DecodeWithHint<Hint>(
            progress,
            ct,
            decRef: decRef,
            requiredHintConfidence: requiredHintConfidence);
    }

    /// <summary>
    /// Decodes the binary stream into a file.
    /// See <see cref="BinaryStream.DecodeWithHint(string, IProgress{TaskProgressInfo}?, CancellationToken, bool, DecodeConfidence)"/>.
    /// </summary>
    /// <param name="self"></param>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <param name="decRef"></param>
    /// <param name="requiredHintConfidence"></param>
    /// <returns></returns>
    public static async Task<IFile> DecodeWithHint(
        this Task<BinaryStream> self,
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default,
        bool decRef = true,
        DecodeConfidence requiredHintConfidence = DecodeConfidence.High)
    {
        return await (await self).DecodeWithHint(
            filename,
            progress,
            ct,
            decRef: decRef,
            requiredHintConfidence: requiredHintConfidence);
    }
#pragma warning restore CA1068 // CancellationToken parameters must come last
}
