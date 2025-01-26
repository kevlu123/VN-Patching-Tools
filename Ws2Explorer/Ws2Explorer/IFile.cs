namespace Ws2Explorer;

public interface IFile : IDisposable
{
    BinaryStream Stream { get; }
}

public interface IFile<T> : IFile
    where T : class, IFile<T>
{
    static abstract T Decode(BinaryStream stream, out DecodeConfidence confidence);
}