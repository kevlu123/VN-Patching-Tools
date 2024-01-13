namespace Ws2Explorer;

public class FileMetadata {
    public string Name { get; }
    public long? Length { get; }
    public int? Crc32 { get; }
    public bool IsFolder { get; }

    public FileMetadata(string name, long? len, bool isBinaryFile = true) {
        Name = name;
        Length = len;
        IsFolder = !isBinaryFile && len == null;
    }
}