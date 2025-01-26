namespace Ws2Explorer;

public interface IArchive : IFile, IFolder
{
    IArchive Create(IDictionary<string, BinaryStream> contents);
}

public interface IArchive<T> : IArchive, IFile<T>
    where T : class, IArchive<T>
{
    new static abstract T Create(IDictionary<string, BinaryStream> contents);
}
