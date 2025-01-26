namespace Ws2Explorer;

public interface IFolder
{
    bool IsRoot => false;

    List<FileInfo> ListFiles();

    Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default);

    IFolder OpenFolder(string name)
    {
        throw new FileNotFoundException("File not found.", name);
    }

    async Task<Dictionary<string, BinaryStream>> GetContents(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var contents = new DisposingDictionary<string, BinaryStream>();
        try
        {
            foreach (var fileInfo in ListFiles())
            {
                contents[fileInfo.Filename] = await OpenFile(fileInfo.Filename, progress, ct);
            }
            return contents.ToDictionary();
        }
        catch
        {
            contents.Dispose();
            throw;
        }
    }

    async Task<Dictionary<string, IFile>> GetFiles(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var contents = (await GetContents(progress, ct)).ToDisposingDictionary();
        var files = new DisposingDictionary<string, IFile>();
        try
        {
            foreach (var (filename, stream) in contents)
            {
                files.Add(filename, await stream.ToDataFile(progress, decRef: false));
            }
            return files.ToDictionary();
        }
        catch
        {
            files.Dispose();
            throw;
        }
    }

    async Task<Dictionary<string, T>> GetFiles<T>(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
        where T : class, IFile<T>
    {
        using var contents = (await GetContents(progress, ct)).ToDisposingDictionary();
        var files = new DisposingDictionary<string, T>();
        try
        {
            foreach (var (filename, stream) in contents)
            {
                try
                {
                    files.Add(filename, await stream.ToDataFile<T>(progress, decRef: false));
                }
                catch (DecodeException) { }
            }
            return files.ToDictionary();
        }
        catch
        {
            files.Dispose();
            throw;
        }
    }
}
