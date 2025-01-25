namespace Ws2Explorer;

public class Directory : IFolder
{
    private readonly DirectoryInfo directoryInfo;

    public bool IsRoot => directoryInfo.Parent == null;

    public string FullPath => directoryInfo.FullName;

    public string DirectoryName => directoryInfo.Name;

    public Directory(string path)
    {
        if (!System.IO.Directory.Exists(path))
        {
            throw new DirectoryNotFoundException(path);
        }
        directoryInfo = new DirectoryInfo(path);
    }

    public List<FileInfo> ListFiles()
    {
        var files = directoryInfo
            .GetFiles()
            .Select(fi => new FileInfo
            {
                Filename = fi.Name,
                FileSize = fi.Length,
            });
        var directories = directoryInfo
            .GetDirectories()
            .Select(di => new FileInfo
            {
                Filename = di.Name,
                IsDirectory = true,
            });
        return directories.Concat(files).ToList();
    }

    public async Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var path = Path.Combine(directoryInfo.FullName, filename);
        await using var fs = new FileStream(
            path,
            FileMode.Open,
            FileAccess.Read,
            FileShare.Read,
            128 * 1024,
            FileOptions.Asynchronous);
        return await BinaryStream.CopyFrom(fs, filename, progress, ct);
    }

    public IFolder OpenFolder(string name)
    {
        var path = Path.Combine(directoryInfo.FullName, name);
        return new Directory(path);
    }

    public Directory OpenParentFolder()
    {
        var path = directoryInfo.Parent?.FullName;
        return path == null
            ? throw new DirectoryNotFoundException("No parent directory.")
            : new Directory(path);
    }

    public async Task WriteFile(
        string filename,
        BinaryStream stream,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var path = Path.Combine(directoryInfo.FullName, filename);
        await using var fs = new FileStream(
            path,
            FileMode.Create,
            FileAccess.Write,
            FileShare.None,
            128 * 1024,
            FileOptions.Asynchronous);
        await stream.CopyTo(fs, filename, progress, ct);
    }
}
