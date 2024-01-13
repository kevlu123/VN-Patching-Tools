namespace Ws2Explorer;

public class ArcFile : BinaryFile, IFolder {
    private class Header {
        public const int Size = 8;
        public int FileCount;
        public int SubHeaderLen;
    }

    private class SubHeader {
        public int DataLen;
        public int DataOffset;
        public string? Filename;
    }

    private readonly Dictionary<string, BinaryStream> children = new();

    public bool CanRenameChildren => true;

    public ArcFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        stream.Reset();
        var header = new Header {
            FileCount = stream.ReadInt32(),
            SubHeaderLen = stream.ReadInt32(),
        };

        if (header.FileCount <= 0 || header.SubHeaderLen <= 0) {
            throw new InvalidDataException("Invalid header");
        }

        var actualFileHeaderLen = 0;
        var actualFileLen = 8 + header.SubHeaderLen;
        for (int i = 0; i < header.FileCount; i++) {
            var subHeader = new SubHeader {
                DataLen = stream.ReadInt32(),
                DataOffset = stream.ReadInt32(),
                Filename = stream.ReadStringUTF16(),
            };
            actualFileHeaderLen += 4 + 4 + (subHeader.Filename.Length * 2) + 2;

            var offset = 8 + header.SubHeaderLen + subHeader.DataOffset;
            var childStream = stream.GetSubStream(offset, subHeader.DataLen);
            children.Add(subHeader.Filename, childStream);
            actualFileLen += subHeader.DataLen;
        }

        if (header.SubHeaderLen != actualFileHeaderLen || actualFileLen != stream.Length) {
            throw new InvalidDataException("Invalid header");
        }
    }

    public List<FileMetadata> ListChildren() {
        return children.
            Select(x => new FileMetadata(x.Key, x.Value.Length)).
            ToList();
    }

    public async Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (children.TryGetValue(name, out var childStream)) {
            return await childStream.Deduce(this, name);
        }
        throw new FileNotFoundException(name);
    }

    public async Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        children[child] = newData;
        await RebuildStream(progress, ct);
    }

    private async Task RebuildStream(ITaskProgress? progress, CancellationToken ct) {
        // Sort by ascii order
        var children = this.children.ToList();
        children.Sort((a, b) => string.CompareOrdinal(a.Key, b.Key));

        var subHeaderLen = children.Sum(x => 4 + 4 + (x.Key.Length * 2) + 2);
        var totalLength = Header.Size
            + subHeaderLen
            + children.Sum(x => x.Value.Length);
        var buffer = new byte[totalLength];
        Stream = new BinaryStream(buffer, 0, buffer.Length);

        Stream.WriteInt32(children.Count);
        Stream.WriteInt32(subHeaderLen);

        var offset = 0;
        foreach (var (name, child) in children) {
            Stream.WriteInt32(child.Length);
            Stream.WriteInt32(offset);
            Stream.WriteStringUTF16(name);
            offset += child.Length;
        }

        using var pm = new ProgressManager($"Rebuilding {Name}", progress, children.Count);
        foreach (var (_, child) in children) {
            child.Reset();
            await child.MemoryStream.CopyToAsync(Stream.MemoryStream, ct);
            pm.Step();
        }

        if (Parent != null) {
            await Parent.NotifyChildChanged(Name, Stream, ct, progress);
        }
    }

    public async Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        if (children.ContainsKey(to)) {
            throw new InvalidOperationException("Destination already exists");
        }
        if (!children.Remove(from, out var removed)) {
            throw new FileNotFoundException(from);
        }
        children.Add(to, removed);
        await RebuildStream(progress, ct);
    }

    public async Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        if (fromFullPath.Length != to.Length) {
            throw new ArgumentException("Argument length mismatch", nameof(to));
        }

        to.GroupBy(x => x)
            .Where(x => x.Count() > 1)
            .Select(x => x.Key)
            .ToList()
            .ForEach(x => throw new ArgumentException($"Duplicate destination {x}", nameof(to))); // Foreach run at most once

        var alreadyExisting = children.Keys.Intersect(to);
        if (alreadyExisting.Any() && !prompt($"Overwrite existing files:\n{string.Join("\n", alreadyExisting)}")) {
            return;
        }

        var srcFiles = new List<BinaryFile>();
        foreach (var from in fromFullPath) {
            var srcFile = await Folder.GetFile(from, ct, progress);
            if (srcFile is not BinaryFile binaryFile) {
                throw new InvalidOperationException($"Copying folder {((IFolder)srcFile).FullPath} into ARC file is not supported.");
            }
            srcFiles.Add(binaryFile);
        }

        foreach (var (src, dst) in srcFiles.Zip(to)) {
            children[dst] = src.Stream;
        }

        await RebuildStream(progress, ct);
    }

    public async Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        if (!children.TryGetValue(a, out var aStream)) {
            throw new FileNotFoundException(a);
        }
        if (!children.TryGetValue(b, out var bStream)) {
            throw new FileNotFoundException(b);
        }
        children[a] = bStream;
        children[b] = aStream;
        await RebuildStream(progress, ct);
    }

    public async Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        var nonExisting = names.Except(children.Keys);
        if (nonExisting.Any()) {
            throw new FileNotFoundException(string.Join(", ", nonExisting));
        }

        foreach (var name in names) {
            children.Remove(name);
        }

        await RebuildStream(progress, ct);
    }
}
