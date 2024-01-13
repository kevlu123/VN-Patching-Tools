namespace Ws2Explorer;

public class PnaFile : BinaryFile, IFolder {
    private class Header {
        public const int Size = 20;
        public int Signature;
        public int Unknown1;
        public int Unknown2;
        public int Unknown3;
        public int FileCount;
    }

    private class SubHeader {
        public const int Size = 40;
        public int Zero;
        public int FileID;
        public int Unknown1;
        public int Unknown2;
        public int Width;
        public int Height;
        public int Unknown3;
        public int Unknown4;
        public int Unknown5;
        public int DataLen;
    }

    private readonly Header header;
    private readonly Dictionary<string, (SubHeader header, BinaryStream stream)> children = new();

    public bool CanRenameChildren => false;

    public PnaFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        stream.Reset();
        header = new Header {
            Signature = stream.ReadInt32(),
            Unknown1 = stream.ReadInt32(),
            Unknown2 = stream.ReadInt32(),
            Unknown3 = stream.ReadInt32(),
            FileCount = stream.ReadInt32(),
        };

        if (header.Signature != 0x50414E50) {
            throw new InvalidDataException("Invalid header");
        }

        var offset = (40 * header.FileCount) + 20;
        for (int i = 0; i < header.FileCount; i++) {
            var subHeader = new SubHeader {
                Zero = stream.ReadInt32(),
                FileID = stream.ReadInt32(),
                Unknown1 = stream.ReadInt32(),
                Unknown2 = stream.ReadInt32(),
                Width = stream.ReadInt32(),
                Height = stream.ReadInt32(),
                Unknown3 = stream.ReadInt32(),
                Unknown4 = stream.ReadInt32(),
                Unknown5 = stream.ReadInt32(),
                DataLen = stream.ReadInt32(),
            };

            BinaryStream childStream;
            if (subHeader.Zero != 0 || subHeader.Width < 0 || subHeader.Height < 0 || subHeader.DataLen < 0) {
                childStream = new BinaryStream(Array.Empty<byte>(), 0, 0);
            } else {
                childStream = stream.GetSubStream(offset, subHeader.DataLen);
            }
            children.Add(i.ToString("D3"), (subHeader, childStream));
            offset += subHeader.DataLen;
        }
    }

    public List<FileMetadata> ListChildren() {
        return children.
            Select(x => new FileMetadata(x.Key, x.Value.stream.Length)).
            ToList();
    }

    public async Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (children.TryGetValue(name, out var child)) {
            return await Task.Run(() => new ImageFile(this, name, child.stream));
        }
        throw new FileNotFoundException(name);
    }

    private SubHeader GetSubHeader(string name) {
        if (children.TryGetValue(name, out var child)) {
            return child.header;
        }
        throw new FileNotFoundException(name);
    }

    public async Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        // This should never run anyway!
        children[child] = (GetSubHeader(child), newData);
        await RebuildStream(progress, ct);
    }

    private async Task RebuildStream(ITaskProgress? progress, CancellationToken ct) {
        var children = this.children
            .OrderBy(x => x.Key.ToLower())
            .ToArray();
        var totalLength = Header.Size
            + (SubHeader.Size * children.Length)
            + children.Sum(x => x.Value.stream.Length);
        var buffer = new byte[totalLength];
        Stream = new BinaryStream(buffer, 0, buffer.Length);

        Stream.WriteInt32(header.Signature);
        Stream.WriteInt32(header.Unknown1);
        Stream.WriteInt32(header.Unknown2);
        Stream.WriteInt32(header.Unknown3);
        Stream.WriteInt32(children.Length);

        foreach (var child in children) {
            Stream.WriteInt32(child.Value.header.Zero);
            Stream.WriteInt32(child.Value.header.FileID);
            Stream.WriteInt32(child.Value.header.Unknown1);
            Stream.WriteInt32(child.Value.header.Unknown2);
            Stream.WriteInt32(child.Value.header.Width);
            Stream.WriteInt32(child.Value.header.Height);
            Stream.WriteInt32(child.Value.header.Unknown3);
            Stream.WriteInt32(child.Value.header.Unknown4);
            Stream.WriteInt32(child.Value.header.Unknown5);
            Stream.WriteInt32(child.Value.stream.Length);
        }

        using var pm = new ProgressManager($"Rebuilding {Name}", progress, children.Length);
        foreach (var child in children) {
            var childStream = child.Value.stream;
            childStream.Reset();
            await childStream.MemoryStream.CopyToAsync(Stream.MemoryStream, ct);
            pm.Step();
        }

        if (Parent != null) {
            await Parent.NotifyChildChanged(Name, Stream, ct, progress);
        }
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException("Rename is not supported for PNA files");
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

        var nonExisting = to.Except(children.Keys);
        if (nonExisting.Any()) {
            throw new NotSupportedException($"Only replacement is supported. File(s) not found in PNA file: {string.Join(", ", nonExisting)}");
        }

        var srcFiles = new List<ImageFile>();
        foreach (var (from, dst) in fromFullPath.Zip(to)) {
            var srcFile = await Folder.GetFile(from, ct, progress);
            if (srcFile is not ImageFile img) {
                throw new NotSupportedException($"{from} is not an image.");
            }
            if (srcFile.Parent is not PnaFile) {
                var header = children[dst].header;
                if (img.Image.Width != header.Width || img.Image.Height != header.Height) {
                    var fromSize = $"{img.Image.Width}x{img.Image.Height}";
                    var toSize = $"{header.Width}x{header.Height}";
                    throw new NotSupportedException($"{from} is {fromSize} but expected {toSize}.");
                }
            }
            srcFiles.Add(img);
        }

        foreach (var (srcFile, dst) in srcFiles.Zip(to)) {
            if (srcFile.Parent is PnaFile parentPna) {
                var header = parentPna.GetSubHeader(srcFile.Name);
                children[dst] = (header, srcFile.Stream);
            } else {
                var header = children[dst].header;
                header.DataLen = srcFile.Stream.Length;
                children[dst] = (header, srcFile.Stream);
            }
        }

        await RebuildStream(progress, ct);
    }

    public async Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        if (!children.ContainsKey(a)) {
            throw new FileNotFoundException(a);
        }
        if (!children.ContainsKey(b)) {
            throw new FileNotFoundException(b);
        }
        (children[b], children[a]) = (children[a], children[b]);
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
