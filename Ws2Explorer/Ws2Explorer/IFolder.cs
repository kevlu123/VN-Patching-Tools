namespace Ws2Explorer;

/// <summary>
/// A file that can have subfiles.
/// </summary>
public interface IFolder
{
    /// <summary>
    /// Whether this folder is the root directory.
    /// </summary>
    bool IsRoot => false;

    /// <summary>
    /// Lists the information of the files in the folder.
    /// </summary>
    /// <returns></returns>
    List<FileInfo> ListFiles();

    /// <summary>
    /// Opens a binary stream to the subfile with the given name.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default
    );
}

/// <summary>
/// Extension methods for <see cref="IFolder"/>.
/// </summary>
public static class IFolderExtensions
{
    /// <summary>
    /// Loads all subfiles of the folder as binary streams.
    /// </summary>
    /// <param name="self"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task<DisposingDictionary<string, BinaryStream>> LoadAllStreams(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default
    )
    {
        var contents = new DisposingDictionary<string, BinaryStream>();
        try
        {
            foreach (var fileInfo in self.ListFiles())
            {
                if (!fileInfo.IsDirectory)
                {
                    contents[fileInfo.Filename] = await self.OpenFile(
                        fileInfo.Filename,
                        progress,
                        ct
                    );
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

    /// <summary>
    /// Loads all subfiles of the folder and decodes them.
    /// </summary>
    /// <param name="self"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task<DisposingDictionary<string, IFile>> LoadAllFiles(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default
    )
    {
        using var contents = await self.LoadAllStreams(progress, ct);
        var fileTasks = contents
            .Select(
                async kvp =>
                    new
                    {
                        Name = kvp.Key,
                        File = await kvp.Value.DecodeWithHint(kvp.Key, null, ct, decRef: false),
                    }
            )
            .ToList();

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
            .ToDictionary(kvp => kvp.Result.Name, kvp => kvp.Result.File)
            .ToDisposingDictionary();
    }

    /// <summary>
    /// Loads all subfiles of the folder, decodes them, and
    /// returns the files that decoded as the specified type.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="self"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public static async Task<DisposingDictionary<string, T>> LoadAllFilesOfType<T>(
        this IFolder self,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default
    )
        where T : class, IFile<T>
    {
        using var contents = await self.LoadAllStreams(progress, ct);
        var fileTasks = contents
            .Select(
                async kvp =>
                    new { Name = kvp.Key, File = await kvp.Value.Decode<T>(decRef: false), }
            )
            .ToList();

        try
        {
            await Task.WhenAll(fileTasks);
        }
        catch { }

        return fileTasks
            .Where(t => !t.IsFaulted)
            .ToDictionary(kvp => kvp.Result.Name, kvp => kvp.Result.File)
            .ToDisposingDictionary();
    }
}
