namespace Ws2Explorer;

public class FileMetadata(string name, long? len, bool isBinaryFile = true) {
    public string Name { get; } = name;
    public long? Length { get; } = len;
    public bool IsFolder { get; } = !isBinaryFile && len == null;
}
