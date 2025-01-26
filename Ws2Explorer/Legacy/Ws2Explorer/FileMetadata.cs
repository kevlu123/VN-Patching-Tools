namespace Ws2Explorer;

public class FileMetadata {
    public FileMetadata(string name, long? len, bool isBinaryFile = true) {
        Name = name;
        Length = len;
        IsFolder = !isBinaryFile && len == null;
    }
    public string Name { get; }
    public long? Length { get; }
    public bool IsFolder { get; }
}
