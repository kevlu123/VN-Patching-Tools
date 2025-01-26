namespace Ws2Explorer;

public interface IFolder : IFile {
    bool CanRenameChildren { get; }

    List<FileMetadata> ListChildren();
    Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress);
    Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress);
    Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress);
    Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress);
    Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress);
    Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress);
}
