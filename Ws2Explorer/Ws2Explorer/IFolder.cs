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
}

public static class IFolderExtensions
{
    public static bool ContainsFile(this IFolder self, string filename)
    {
        // TODO: case sensitivity
        return self.ListFiles().Any(f => f.Filename == filename);
    }

    public static async Task<DisposingDictionary<string, BinaryStream>> LoadAllStreams(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var contents = new DisposingDictionary<string, BinaryStream>();
        try
        {
            foreach (var fileInfo in self.ListFiles())
            {
                if (!fileInfo.IsDirectory)
                {
                    contents[fileInfo.Filename] = await self.OpenFile(fileInfo.Filename, progress, ct);
                }
            }
            return contents;
        }
        catch
        {
            contents.Dispose();
            throw;
        }
    }

    public static async Task<DisposingDictionary<string, IFile>> LoadAllFiles(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var contents = await self.LoadAllStreams(progress, ct);
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

    public static async Task<DisposingDictionary<string, T>> LoadAllFiles<T>(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
        where T : class, IFile<T>
    {
        using var contents = await self.LoadAllStreams(progress, ct);
        var fileTasks = contents.Select(async kvp => new
        {
            Name = kvp.Key,
            File = await kvp.Value.Decode<T>(decRef: false),
        }).ToList();

        try
        {
            // TODO: Check this works as expected
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
