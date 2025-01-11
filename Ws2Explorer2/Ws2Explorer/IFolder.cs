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
        var contents = new Dictionary<string, BinaryStream>();
        foreach (var fileInfo in ListFiles())
        {
            contents[fileInfo.Filename] = await OpenFile(fileInfo.Filename, progress, ct);
        }
        return contents;
    }

    async Task<Dictionary<string, BinaryStream>> GetContentsParallel(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        var results = await Task.WhenAll(ListFiles().Select(async fileInfo =>
        {
            var stream = await OpenFile(fileInfo.Filename, progress, ct);
            return new { fileInfo.Filename, Stream = stream };
        }));
        return results.ToDictionary(x => x.Filename, x => x.Stream);
    }
}
