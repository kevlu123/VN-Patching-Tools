using System.IO.Compression;

namespace Ws2Explorer;

class ZipFolder : IFolder {
    private readonly Dictionary<string, ZipFolder> subfolders = new();
    private readonly Dictionary<string, ZipArchiveEntry> files = new();

    public bool CanRenameChildren => false;
    public IFolder? Parent { get; }
    public string Name { get; }

    public ZipFolder(IFolder? parent, string name) {
        Parent = parent;
        Name = name;
    }

    public ZipFolder CreateFolderIfNotExists(string name) {
        if (!subfolders.TryGetValue(name, out var folder)) {
            folder = new ZipFolder(this, name);
            subfolders.Add(name, folder);
        }
        return folder;
    }

    public void AddFile(string name, ZipArchiveEntry file) {
        files.Add(name, file);
    }

    public List<FileMetadata> ListChildren() {
        return subfolders.
            Select(x => new FileMetadata(x.Key, null, isBinaryFile: false)).
            Concat(files.Select(x => new FileMetadata(x.Key, x.Value.Length))).
            ToList();
    }

    public async Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (subfolders.TryGetValue(name, out var folder)) {
            return await Task.FromResult<IFile>(folder);
        }

        if (!files.TryGetValue(name, out var file)) {
            throw new FileNotFoundException(name);
        }

        if (file.IsEncrypted) {
            throw new NotSupportedException("Encrypted ZIP files are not supported.");
        }

        var buffer = new byte[file.Length];
        var stream = new BinaryStream(buffer, 0, buffer.Length);
        await using var fileStream = file.Open();
        await fileStream.CopyToAsync(stream.MemoryStream, ct);
        return await stream.Deduce(this, name);
    }

    public Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }
}

public class ZipFile : BinaryFile, IFolder {
    private readonly ZipFolder root;

    public bool CanRenameChildren => false;

    public ZipFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        root = new ZipFolder(parent, name);
        stream.Reset();
        var zip = new ZipArchive(stream.MemoryStream, ZipArchiveMode.Read, false);

        foreach (var entry in zip.Entries) {
            bool isFolder = entry.FullName.EndsWith('/');
            var parts = entry.FullName.Split('/', StringSplitOptions.RemoveEmptyEntries);
            var current = root;
            foreach (var part in parts.SkipLast(isFolder ? 0 : 1)) {
                current = current.CreateFolderIfNotExists(part);
            }
            if (!isFolder) {
                current.AddFile(parts.Last(), entry);
            }
        }
    }

    public List<FileMetadata> ListChildren() {
        return root.ListChildren();
    }

    public Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        return root.GetChild(name, ct, progress);
    }

    public Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }

    public Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Modifying ZIP files is not supported.");
    }
}
