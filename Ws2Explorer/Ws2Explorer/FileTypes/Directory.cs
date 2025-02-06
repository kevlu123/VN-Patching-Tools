namespace Ws2Explorer.FileTypes;

/// <summary>
/// A real directory on the filesystem.
/// </summary>
public class Directory : IFolder
{
    private readonly DirectoryInfo directoryInfo;

    /// <summary>
    /// Whether the directory is the root directory.
    /// </summary>
    public bool IsRoot => directoryInfo.Parent == null;

    /// <summary>
    /// The full path of the directory.
    /// </summary>
    public string FullPath => directoryInfo.FullName;

    /// <summary>
    /// The name of the directory.
    /// </summary>
    public string DirectoryName => directoryInfo.Name;

    /// <summary>
    /// Constructs a directory from a path.
    /// The directory must exist.
    /// </summary>
    /// <param name="path"></param>
    public Directory(string path)
    {
        if (!System.IO.Directory.Exists(path))
        {
            throw new DirectoryNotFoundException(path);
        }
        directoryInfo = new DirectoryInfo(path);
    }

    /// <summary>
    /// Lists the files and directories in the directory.
    /// </summary>
    /// <returns></returns>
    public List<FileInfo> ListFiles()
    {
        var files = directoryInfo
            .GetFiles()
            .Select(fi => new FileInfo { Filename = fi.Name, FileSize = fi.Length, });
        var directories = directoryInfo
            .GetDirectories()
            .Select(di => new FileInfo { Filename = di.Name, IsDirectory = true, });
        return [.. directories, .. files];
    }

    /// <summary>
    /// Opens a binary stream to the file with the given name.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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

    /// <summary>
    /// Opens a directory with the given name.
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public IFolder OpenDirectory(string name)
    {
        var path = Path.Combine(directoryInfo.FullName, name);
        return new Directory(path);
    }

    /// <summary>
    /// Opens the parent directory.
    /// </summary>
    /// <returns></returns>
    public Directory OpenParentDirectory()
    {
        var path = directoryInfo.Parent?.FullName;
        return path == null
            ? throw new DirectoryNotFoundException("No parent directory.")
            : new Directory(path);
    }

    /// <summary>
    /// Writes a file to the directory.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="stream"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
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
