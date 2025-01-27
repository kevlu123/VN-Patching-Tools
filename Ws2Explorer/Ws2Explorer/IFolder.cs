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
        using var contents = await GetContents(progress, ct);
        var fileTasks = contents.Select(async kvp => new
        {
            Name = kvp.Key,
            File = await kvp.Value.DecodeWithHint(kvp.Key, null, ct, decRef: false),
        }).ToList();

        try
        {
            await Task.WhenAll(fileTasks);
        }
        catch
        {
            foreach (var fileTask in fileTasks)
            {
                fileTask.Result.File.Dispose();
            }
            throw;
        }

        return fileTasks
            .ToDictionary(
                kvp => kvp.Result.Name,
                kvp => kvp.Result.File)
            .ToDisposingDictionary();
    }

    async Task<DisposingDictionary<string, T>> GetFiles<T>(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
        where T : class, IFile<T>
    {
        using var contents = await GetContents(progress, ct);
        var fileTasks = contents.Select(async kvp => new
        {
            Name = kvp.Key,
            File = await kvp.Value.Decode<T>(decRef: false),
        }).ToList();

        try
        {
            await Task.WhenAll(fileTasks);
        }
        catch { }

        foreach (var fileTask in fileTasks.Where(t => t.IsFaulted))
        {
            fileTask.Result.File.Dispose();
        }

        return fileTasks.Where(t => !t.IsFaulted)
            .ToDictionary(
                kvp => kvp.Result.Name,
                kvp => kvp.Result.File)
            .ToDisposingDictionary();
    }
}
