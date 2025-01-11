namespace Ws2Explorer;

public record FileInfo
{
    public required string Filename { get; init; }
    public long? FileSize { get; init; }
    public bool IsDirectory { get; init; }
}
