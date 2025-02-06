namespace Ws2Explorer;

/// <summary>
/// A file backed by a binary stream.
/// </summary>
public interface IFile : IDisposable
{
    /// <summary>
    /// The binary stream backing the file.
    /// </summary>
    BinaryStream Stream { get; }
}

/// <summary>
/// Stronger typed version of <see cref="IFile"/> used for generics.
/// </summary>
/// <typeparam name="T"></typeparam>
public interface IFile<T> : IFile
    where T : class, IFile<T>
{
    /// <summary>
    /// Decode a binary stream to this file type.
    /// </summary>
    /// <param name="stream"></param>
    /// <param name="confidence">
    /// The confidence that the binary stream decodes
    /// uniquely to file type.
    /// </param>
    /// <returns></returns>
    /// <exception cref="DecodeException" />
    static abstract T Decode(BinaryStream stream, out DecodeConfidence confidence);
}
