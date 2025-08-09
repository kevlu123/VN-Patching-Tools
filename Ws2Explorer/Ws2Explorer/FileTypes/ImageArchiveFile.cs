namespace Ws2Explorer.FileTypes;

/// <summary>
/// Image archive file.
/// Base for PnaFile and WipFile.
/// </summary>
public abstract class ImageArchiveFile : IArchive
{
    private bool disposedValue;

    /// <summary>
    /// The header file filename.
    /// </summary>
    public const string HEADER_FILENAME = "header.json";

    /// <summary>
    /// The underlying binary stream.
    /// </summary>
    public abstract BinaryStream Stream { get; }

    /// <summary>
    /// The number of images in the image archive including empty images.
    /// </summary>
    public abstract int ImageCount { get; }

    /// <summary>
    /// The width of the space that the image archive image array takes up.
    /// </summary>
    public abstract int ImageWidth { get; }

    /// <summary>
    /// The height of the space that the image archive image array takes up.
    /// </summary>
    public abstract int ImageHeight { get; }

    /// <summary>
    /// Constructs a new image archive file from subfiles.
    /// </summary>
    /// <param name="contents"></param>
    /// <returns></returns>
    public abstract IArchive Create(IDictionary<string, BinaryStream> contents);

    /// <summary>
    /// Lists the (possibly virtual) subfiles.
    /// </summary>
    /// <returns></returns>
    public abstract List<FileInfo> ListFiles();

    /// <summary>
    /// Opens a subfile.
    /// The filename is case-insensitive.
    /// </summary>
    /// <param name="filename"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns></returns>
    public abstract Task<BinaryStream> OpenFile(
        string filename,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default);

    /// <summary>
    /// Adds a dummy PNG image and metadata to the image archive file,
    /// increasing the file count by 1.
    /// </summary>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new image archive file.</returns>
    public virtual async Task<ImageArchiveFile> AddEntry(
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var content = await this.LoadAllStreams(progress, ct);
        content[ImageName(ImageCount)] = PngFile.ExampleStream();
        return (ImageArchiveFile)Create(content);
    }

    /// <summary>
    /// Swaps the index of two (possibly empty) PNG images and their metadata.
    /// </summary>
    /// <param name="filename1">
    /// The PNG filename or PNG metadata filename of the image to swap.
    /// </param>
    /// <param name="filename2">
    /// The PNG filename or PNG metadata filename of the image to swap.
    /// </param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new image archive file.</returns>
    public virtual async Task<ImageArchiveFile> SwapEntry(
        string filename1,
        string filename2,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        int index1 = ImageIndex(filename1) ?? MetaIndex(filename1) ?? throw new FileNotFoundException(filename1);
        int index2 = ImageIndex(filename2) ?? MetaIndex(filename2) ?? throw new FileNotFoundException(filename2);
        return await SwapEntry(index1, index2, progress, ct);
    }

    /// <summary>
    /// Swaps the index of two (possibly empty) PNG images and their metadata.
    /// </summary>
    /// <param name="index1"></param>
    /// <param name="index2"></param>
    /// <param name="progress"></param>
    /// <param name="ct"></param>
    /// <returns>The new image archive file.</returns>
    public virtual async Task<ImageArchiveFile> SwapEntry(
        int index1,
        int index2,
        IProgress<TaskProgressInfo>? progress = null,
        CancellationToken ct = default)
    {
        using var content = await this.LoadAllStreams(progress, ct);
        if (index1 != index2)
        {
            var meta1 = MetaName(index1);
            var meta2 = MetaName(index2);
            (content[meta1], content[meta2]) = (content[meta2].Clone(), content[meta1].Clone());

            var image1 = ImageName(index1);
            var image2 = ImageName(index2);
            (content[image1], content[image2]) = (content[image2].Clone(), content[image1].Clone());
        }
        return (ImageArchiveFile)Create(content);
    }

    /// <summary>
    /// Gets the PNG filename from the index.
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public static string ImageName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"img{index:D3}.png";
    }

    /// <summary>
    /// Gets the PNG metadata filename from the index.
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public static string MetaName(int index)
    {
        if (index < 0 || index >= 1000)
        {
            throw new ArgumentOutOfRangeException(nameof(index));
        }
        return $"meta{index:D3}.json";
    }

    /// <summary>
    /// Gets the index of the PNG file from the filename.
    /// e.g. "img21.png" -> 21
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static int? ImageIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("img") && name.EndsWith(".png") && int.TryParse(name[3..^4], out int v))
        {
            return v;
        }
        return null;
    }

    /// <summary>
    /// Gets the index of the corresponding PNG file from a PNG metadata filename.
    /// e.g. "meta21.json" -> 21
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static int? MetaIndex(string name)
    {
        name = name.ToLowerInvariant();
        if (name.StartsWith("meta") && name.EndsWith(".json") && int.TryParse(name[4..^5], out int v))
        {
            return v;
        }
        return null;
    }

    /// <summary>
    /// Dispose the image archive file.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            Stream?.DecRef();
            disposedValue = true;
        }
        GC.SuppressFinalize(this);
    }

    /// <summary>
    /// Dispose the image archive file.
    /// </summary>
    ~ImageArchiveFile()
    {
        Dispose();
    }
}
