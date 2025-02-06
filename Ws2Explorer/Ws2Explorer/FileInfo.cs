namespace Ws2Explorer;

/// <summary>
/// File information returned by the <see cref="IFolder.ListFiles"/>.
/// </summary>
public record FileInfo
{
    /// <summary>
    /// The name of the file or directory.
    /// </summary>
    public required string Filename { get; init; }

    /// <summary>
    /// The size of the file in bytes, or null if the size is not applicable or unknown.
    /// </summary>
    public long? FileSize { get; init; }

    /// <summary>
    /// Whether the file is a real directory.
    /// </summary>
    public bool IsDirectory { get; init; }
}
