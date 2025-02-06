namespace Ws2Explorer;

/// <summary>
/// An archive file backed by a binary stream
/// and can contain subfiles.
/// </summary>
public interface IArchive : IFile, IFolder
{
    /// <summary>
    /// Creates an archive from the given contents.
    /// The archive will have the same type as this instance.
    /// </summary>
    /// <param name="contents">
    /// The contents of the archive. The keys are the filenames
    /// and the values are the binary streams of the subfiles.
    /// </param>
    /// <returns></returns>
    /// <exception cref="ArchiveCreationException" />
    IArchive Create(IDictionary<string, BinaryStream> contents);
}

/// <summary>
/// Stronger typed version of <see cref="IArchive"/> used for generics.
/// </summary>
/// <typeparam name="T"></typeparam>
public interface IArchive<T> : IArchive, IFile<T>
    where T : class, IArchive<T>
{
    /// <summary>
    /// Creates an archive from the given contents.
    /// </summary>
    /// <param name="contents">
    /// The contents of the archive. The keys are the filenames
    /// and the values are the binary streams of the subfiles.
    /// </param>
    /// <returns></returns>
    /// <exception cref="ArchiveCreationException" />
    new static abstract T Create(IDictionary<string, BinaryStream> contents);
}
