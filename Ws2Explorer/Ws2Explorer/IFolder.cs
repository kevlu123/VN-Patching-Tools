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

    async Task<DisposingDictionary<string, BinaryStream>> GetContents(
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
            return contents;
        }
        catch
        {
            contents.Dispose();
            throw;
        }
    }

    async Task<DisposingDictionary<string, IFile>> GetFiles(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var contents = (await GetContents(progress, ct)).ToDisposingDictionary();
        var files = new DisposingDictionary<string, IFile>();
        try
        {
            foreach (var (filename, stream) in contents)
            {
                files.Add(filename, await stream.Decode(progress, ct, decRef: false));
            }
            return files;
        }
        catch
        {
            files.Dispose();
            throw;
        }
    }

    async Task<DisposingDictionary<string, T>> GetFiles<T>(
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
                    files.Add(filename, await stream.Decode<T>(decRef: false));
                }
                catch (DecodeException) { }
            }
            return files;
        }
        catch
        {
            files.Dispose();
            throw;
        }
    }
}
