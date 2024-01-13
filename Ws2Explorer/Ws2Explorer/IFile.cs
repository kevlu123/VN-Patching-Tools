namespace Ws2Explorer;

public interface IFile {
    IFolder? Parent { get; }
    string Name { get; }
    string FullPath => (Parent == null ? Name : Path.Combine(Parent.FullPath, Name))
        .Replace('\\', '/');
}
