using System.Buffers;
using System.Runtime;

namespace Ws2Explorer;

public class Folder : IFolder {
    public const long MAX_FILE_SIZE = 1024 * 1024 * 1024; // 1 GiB

    private readonly string path;
    private IFolder? parent;

    public string Name { get; }
    public bool CanRenameChildren => true;

    public IFolder? Parent {
        get {
            if (parent != null) {
                return parent;
            }

            var parentPath = Directory.GetParent(path)?.FullName;
            if (parentPath == null) {
                return null;
            }

            parent = new Folder(parentPath);
            return parent;
        }
        set => parent = value;
    }

    public Folder(string path, IFolder? parent = null) {
        path = ExpandPath(path, out var wasRoot);
        this.path = path;
        Name = wasRoot ? path : Path.GetFileName(path);
        Parent = parent;
    }

    public List<FileMetadata> ListChildren() {
        var children = new List<FileMetadata>();
        foreach (var dir in Directory.GetDirectories(path)) {
            var name = Path.GetFileName(dir);
            children.Add(new FileMetadata(name, null, isBinaryFile: false));
        }
        foreach (var file in Directory.GetFiles(path)) {
            var name = Path.GetFileName(file);
            var len = new FileInfo(file).Length;
            children.Add(new FileMetadata(name, len));
        }
        return children;
    }

    public async Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        var childPath = Path.Combine(path, name);
        if (File.Exists(childPath)) {
            var data = await ReadFile(childPath, ct, progress);
            var stream = new BinaryStream(data, 0, data.Length);
            return await stream.Deduce(this, name);
        } else if (Directory.Exists(childPath)) {
            return new Folder(childPath, this);
        }
        throw new FileNotFoundException(name);
    }

    public static async Task<IFolder> GetFolder(string path, CancellationToken ct, ITaskProgress? progress) {
        var fullPath = ExpandPath(path, out _);
        var pathParts = fullPath
            .Split(new[] { '\\', '/' }, StringSplitOptions.RemoveEmptyEntries)
            .ToList();

        var root = pathParts[0];
        IFolder current = new Folder(root);

        foreach (var part in pathParts.Skip(1)) {
            var file = await current.GetChild(part, ct, progress) ?? throw new FileNotFoundException(part);
            if (file is not IFolder folder) {
                throw new FileNotFoundException(part);
            }
            current = folder;
        }

        return current;
    }

    public static async Task<IFile> GetFile(string path, CancellationToken ct, ITaskProgress? progress = null) {
        var fullPath = ExpandPath(path, out _);
        var folderPath = Path.GetDirectoryName(fullPath) ?? throw new FileNotFoundException(fullPath);
        var fileName = Path.GetFileName(fullPath);
        var folder = await GetFolder(folderPath, ct, progress);
        return await folder.GetChild(fileName, ct, progress);
    }

    private static string ExpandPath(string path, out bool wasRoot) {
        wasRoot = path.Length == 2 && path[1] == ':';
        path = wasRoot ? path.TrimEnd('/') + '/' : path;
        if (path.StartsWith('~')) {
            path = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile)
                + '/' + path[1..];
        }
        path = Path.GetFullPath(path);
        return path.Replace('\\', '/');
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        var fromPath = Path.Combine(path, from);
        var toPath = Path.Combine(path, to);
        if (File.Exists(fromPath)) {
            File.Move(fromPath, toPath);
        } else if (Directory.Exists(fromPath)) {
            Directory.Move(fromPath, toPath);
        } else {
            throw new FileNotFoundException(fromPath);
        }
        return Task.CompletedTask;
    }

    public async Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        newData.Reset();
        var childPath = Path.Combine(path, child);
        await WriteFile(childPath, newData, ct, progress);
    }

    public async Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        if (fromFullPath.Length != to.Length) {
            throw new ArgumentException("Argument length mismatch", nameof(to));
        }

        to.GroupBy(x => x)
            .Where(x => x.Count() > 1)
            .Select(x => x.Key)
            .ToList()
            .ForEach(x => throw new ArgumentException($"Duplicate destination {x}", nameof(to))); // Foreach run at most once

        var children = ListChildren().Select(x => x.Name);
        var alreadyExisting = children.Intersect(to);
        if (alreadyExisting.Any() && !prompt($"Overwrite existing files:\n{string.Join("\n", alreadyExisting)}")) {
            return;
        }

        var srcFiles = new List<BinaryFile>();
        foreach (var from in fromFullPath) {
            var srcFile = await GetFile(from, ct, progress);
            if (srcFile is not BinaryFile binaryFile) {
                throw new InvalidOperationException($"Copying folder {((IFolder)srcFile).FullPath} is not supported.");
            }
            srcFiles.Add(binaryFile);
        }

        for (var i = 0; i < srcFiles.Count; i++) {
            var srcFile = srcFiles[i];
            var dstPath = Path.Combine(path, to[i]);
            await WriteFile(dstPath, srcFile.Stream, ct, progress);
        }
    }

    public Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        var aPath = Path.Combine(path, a);
        var bPath = Path.Combine(path, b);
        if (!File.Exists(aPath)) {
            throw new FileNotFoundException(aPath);
        } else if (!File.Exists(bPath)) {
            throw new FileNotFoundException(bPath);
        }

        var tempPath = Path.Combine(path, "temp" + Guid.NewGuid());
        File.Move(aPath, tempPath);
        File.Move(bPath, aPath);
        File.Move(tempPath, bPath);
        return Task.CompletedTask;
    }

    public Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        var nonExisting = names.Except(ListChildren().Select(x => x.Name));
        if (nonExisting.Any()) {
            throw new FileNotFoundException(string.Join(", ", nonExisting));
        }

        foreach (var name in names) {
            var filePath = Path.Combine(path, name);
            if (File.Exists(filePath)) {
                File.Delete(filePath);
            } else if (Directory.Exists(filePath)) {
                Directory.Delete(filePath, true);
            } else {
                throw new FileNotFoundException(filePath);
            }
        }

        return Task.CompletedTask;
    }

    private static async Task<byte[]> ReadFile(string filename, CancellationToken ct, ITaskProgress? progress) {
        await using var fileStream = File.OpenRead(filename);
        var longLen = fileStream.Length;
        if (longLen > MAX_FILE_SIZE) {
            throw new InvalidDataException("File too large");
        }
        var len = (int)longLen;

        var data = new byte[len];
        if (len >= 512 * 1024 * 1024) {
            GCSettings.LargeObjectHeapCompactionMode = GCLargeObjectHeapCompactionMode.CompactOnce;
            GC.Collect();
        }

        const int chunkSize = 8 * 1024 * 1024;
        int loops = (int)Math.Ceiling((double)len / chunkSize);
        using var pm = new ProgressManager($"Reading {filename.Replace('\\', '/')}", progress, loops);
        for (var i = 0; i < len; i += chunkSize) {
            var toRead = Math.Min(chunkSize, len - i);
            await fileStream.ReadAsync(data.AsMemory(i, toRead), ct);
            pm.Step();
        }
        return data;
    }

    private static async Task WriteFile(string filename, BinaryStream data, CancellationToken ct, ITaskProgress? progress) {
        data.Reset();
        await using var fileStream = File.Create(filename);
        var len = data.Length;
        const int chunkSize = 8 * 1024 * 1024;
        int loops = (int)Math.Ceiling((double)len / chunkSize);
        using var pm = new ProgressManager($"Writing {filename.Replace('\\', '/')}", progress, loops);
        for (var i = 0; i < len; i += chunkSize) {
            var toWrite = Math.Min(chunkSize, len - i);
            await fileStream.WriteAsync(data.Memory.Slice(i, toWrite), ct);
            pm.Step();
        }
    }
}
