using System.Text;
using System.Text.Json;

namespace Ws2Explorer;

public class PnaHeaderFile : BinaryFile {
    private static readonly JsonSerializerOptions jsonOptions = new() {
        WriteIndented = true,
    };

    public class Fields {
        public int Signature { get; set; }
        public int Unknown1 { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public int FileCount { get; set; }

        public static Fields FromJson(BinaryStream stream) {
            var json = Encoding.UTF8.GetString(stream.MemoryStream.ToArray());
            return JsonSerializer.Deserialize<Fields>(json, jsonOptions) ?? throw new InvalidDataException("Invalid JSON.");
        }

        public static Fields FromBytes(BinaryStream stream) {
            stream.Reset();
            return new Fields {
                Signature = stream.ReadInt32(),
                Unknown1 = stream.ReadInt32(),
                Width = stream.ReadInt32(),
                Height = stream.ReadInt32(),
                FileCount = stream.ReadInt32(),
            };
        }

        public byte[] ToBytes() {
            var bytes = new byte[Size];
            var stream = new BinaryStream(bytes, 0, bytes.Length);
            stream.WriteInt32(Signature);
            stream.WriteInt32(Unknown1);
            stream.WriteInt32(Width);
            stream.WriteInt32(Height);
            stream.WriteInt32(FileCount);
            return bytes;
        }
    }

    public PnaHeaderFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        fields = Fields.FromJson(stream);
    }

    public static PnaHeaderFile FromBytes(IFolder? parent, string name, BinaryStream stream) {
        var json = JsonSerializer.Serialize(Fields.FromBytes(stream), jsonOptions);
        var bytes = Encoding.UTF8.GetBytes(json);
        return new PnaHeaderFile(parent, name, new BinaryStream(bytes, 0, bytes.Length));
    }

    public Fields GetFields() {
        return new() {
            Signature = Signature,
            Unknown1 = Unknown1,
            Width = Width,
            Height = Height,
            FileCount = FileCount,
        };
    }

    public void SetFields(Fields fields) {
        this.fields = fields;
        var json = JsonSerializer.Serialize(fields, jsonOptions);
        var bytes = Encoding.UTF8.GetBytes(json);
        Stream = new BinaryStream(bytes, 0, bytes.Length);
    }

    private Fields fields;
    public const int Size = 20;

    public int Signature => fields.Signature;
    public int Unknown1 => fields.Unknown1;
    public int Width => fields.Width;
    public int Height => fields.Height;
    public int FileCount => fields.FileCount;
}

public class PnaImageMetaFile : BinaryFile {
    private static readonly JsonSerializerOptions jsonOptions = new() {
        WriteIndented = true,
    };

    public class Fields {
        public int Zero { get; set; }
        public int FileId { get; set; }
        public int OffsetX { get; set; } // Relative to the top left of the image given by the main PNA header
        public int OffsetY { get; set; } //
        public int Width { get; set; }
        public int Height { get; set; }
        public int Unknown1 { get; set; }
        public double Transparency { get; set; }
        public int DataLen { get; set; }

        public static Fields FromJson(BinaryStream stream) {
            var json = Encoding.UTF8.GetString(stream.MemoryStream.ToArray());
            return JsonSerializer.Deserialize<Fields>(json, jsonOptions) ?? throw new InvalidDataException("Invalid JSON.");
        }

        public static Fields FromBytes(BinaryStream stream) {
            stream.Reset();
            return new Fields {
                Zero = stream.ReadInt32(),
                FileId = stream.ReadInt32(),
                OffsetX = stream.ReadInt32(),
                OffsetY = stream.ReadInt32(),
                Width = stream.ReadInt32(),
                Height = stream.ReadInt32(),
                Unknown1 = stream.ReadInt32(),
                Transparency = stream.ReadDouble(),
                DataLen = stream.ReadInt32(),
            };
        }

        public byte[] ToBytes() {
            var bytes = new byte[Size];
            var stream = new BinaryStream(bytes, 0, bytes.Length);
            stream.WriteInt32(Zero);
            stream.WriteInt32(FileId);
            stream.WriteInt32(OffsetX);
            stream.WriteInt32(OffsetY);
            stream.WriteInt32(Width);
            stream.WriteInt32(Height);
            stream.WriteInt32(Unknown1);
            stream.WriteDouble(Transparency);
            stream.WriteInt32(DataLen);
            return bytes;
        }
    }

    public PnaImageMetaFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        fields = Fields.FromJson(stream);
    }

    public static PnaImageMetaFile FromBytes(IFolder? parent, string name, BinaryStream stream) {
        var json = JsonSerializer.Serialize(Fields.FromBytes(stream), jsonOptions);
        var bytes = Encoding.UTF8.GetBytes(json);
        return new PnaImageMetaFile(parent, name, new BinaryStream(bytes, 0, bytes.Length));
    }

    public Fields GetFields() {
        return new() {
            Zero = Zero,
            FileId = FileID,
            OffsetX = OffsetX,
            OffsetY = OffsetY,
            Width = Width,
            Height = Height,
            Unknown1 = Unknown1,
            Transparency = Transparency,
            DataLen = DataLen,
        };
    }

    public void SetFields(Fields fields) {
        this.fields = fields;
        var json = JsonSerializer.Serialize(fields, jsonOptions);
        var bytes = Encoding.UTF8.GetBytes(json);
        Stream = new BinaryStream(bytes, 0, bytes.Length);
    }

    private Fields fields;
    public const int Size = 40;

    public int Zero => fields.Zero;
    public int FileID => fields.FileId;
    public int OffsetX => fields.OffsetX;
    public int OffsetY => fields.OffsetY;
    public int Width => fields.Width;
    public int Height => fields.Height;
    public int Unknown1 => fields.Unknown1;
    public double Transparency => fields.Transparency;
    public int DataLen => fields.DataLen;
}

public class PnaFile : BinaryFile, IFolder {
    private const string HEADER_NAME = "header.json";

    private static readonly byte[] DUMMY_PNG = new byte[] {
        0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
        0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
        0x01, 0x00, 0x00, 0x00, 0x00, 0x37, 0x6E, 0xF9, 0x24, 0x00, 0x00, 0x00,
        0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x01, 0x63, 0x60, 0x00, 0x00, 0x00,
        0x02, 0x00, 0x01, 0x73, 0x75, 0x01, 0x18, 0x00, 0x00, 0x00, 0x00, 0x49,
        0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
    };

    private readonly PnaHeaderFile header;
    private readonly Dictionary<string, PnaImageMetaFile> imageMetas = new();
    private readonly Dictionary<string, BinaryStream> images = new();

    public bool CanRenameChildren => false;

    public PnaFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        stream.Reset();
        header = PnaHeaderFile.FromBytes(this, HEADER_NAME, stream.GetSubStream(0, PnaHeaderFile.Size));

        if (header.Signature != 0x50414E50) {
            throw new InvalidDataException("Invalid header");
        }

        var offset = (40 * header.FileCount) + 20;
        for (int i = 0; i < header.FileCount; i++) {
            var imageHeader = PnaImageMetaFile.FromBytes(this, $"meta{i:000}.json", stream.GetSubStream(20 + (i * 40), 40));

            BinaryStream imageStream;
            if (imageHeader.Zero != 0 || imageHeader.Width < 0 || imageHeader.Height < 0 || imageHeader.DataLen < 0) {
                imageStream = new BinaryStream(Array.Empty<byte>(), 0, 0);
            } else {
                imageStream = stream.GetSubStream(offset, imageHeader.DataLen);
            }
            imageMetas.Add(imageHeader.Name, imageHeader);
            images.Add($"img{i:000}.png", imageStream);
            offset += imageHeader.DataLen;
        }
    }

    public List<FileMetadata> ListChildren() {
        return new[] { new FileMetadata(HEADER_NAME, null) }
            .Concat(images.Select(x => new FileMetadata(x.Key, x.Value.Length)))
            .Concat(imageMetas.Select(x => new FileMetadata(x.Key, null)))
            .ToList();
    }

    public async Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (name == HEADER_NAME) {
            return await Task.FromResult<IFile>(header);
        } else if (images.TryGetValue(name, out var child)) {
            try {
                return await Task.Run(() => new ImageFile(this, name, child));
            } catch (InvalidDataException) {
                return await Task.Run(() => new BinaryFile(this, name, child));
            }
        } else if (imageMetas.TryGetValue(name, out var meta)) {
            return await Task.FromResult<IFile>(meta);
        }

        throw new FileNotFoundException(name);
    }

    public Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        throw new InvalidOperationException();
    }

    private async Task RebuildStream(ITaskProgress? progress, CancellationToken ct) {
        var totalLength = PnaHeaderFile.Size
            + (PnaImageMetaFile.Size * header.FileCount)
            + images.Sum(x => x.Value.Length);
        var buffer = new byte[totalLength];
        Stream = new BinaryStream(buffer, 0, buffer.Length);

        Stream.WriteBytes(header.GetFields().ToBytes());
        foreach (var (_, meta) in imageMetas.OrderBy(x => x.Key)) {
            Stream.WriteBytes(meta.GetFields().ToBytes());
        }

        using var pm = new ProgressManager($"Rebuilding {Name}", progress, images.Count);
        foreach (var (_, image) in images.OrderBy(x => x.Key)) {
            image.Reset();
            await image.MemoryStream.CopyToAsync(Stream.MemoryStream, ct);
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
            .ForEach(x => throw new ArgumentException($"Duplicate destination {x}", nameof(to)));

        var nonExisting = to.Except(imageMetas.Keys).Except(images.Keys).Except(new[] { HEADER_NAME });
        if (nonExisting.Any()) {
            throw new NotSupportedException($"Only replacement is supported. File(s) not found in PNA file: {string.Join(", ", nonExisting)}");
        }

        var metaTransfers = new List<(PnaImageMetaFile.Fields src, string dst)>();
        var imageTransfers = new List<(ImageFile src, string dst)>();
        PnaHeaderFile.Fields? newHeader = null;
        foreach (var (from, dst) in fromFullPath.Zip(to)) {
            var srcFile = await Folder.GetFile(from, ct, progress);
            if (dst == HEADER_NAME) {
                if (srcFile is not BinaryFile binaryFile || !binaryFile.IsText) {
                    throw new NotSupportedException($"{from} is not a PNA header.");
                }
                newHeader = PnaHeaderFile.Fields.FromJson(binaryFile.Stream);
            } else if (IsMetaName(dst)) {
                if (srcFile is not BinaryFile binaryFile || !binaryFile.IsText) {
                    throw new NotSupportedException($"{from} is not a PNA image metadata header.");
                }
                var fields = PnaImageMetaFile.Fields.FromJson(binaryFile.Stream);
                metaTransfers.Add((fields, dst));
            } else {
                if (srcFile is not ImageFile imageFile) {
                    throw new NotSupportedException($"{from} is not an image.");
                }
                imageTransfers.Add((imageFile, dst));
            }
        }

        foreach (var (src, dst) in imageTransfers) {
            images[dst] = src.Stream;
            var fields = imageMetas[ImageToMetaName(dst)].GetFields();
            fields.DataLen = src.Stream.Length;
            if (OperatingSystem.IsWindows() && OperatingSystem.IsWindowsVersionAtLeast(6, 1)) {
                fields.Width = src.Image.Width;
                fields.Height = src.Image.Height;
            }
            imageMetas[ImageToMetaName(dst)].SetFields(fields);
        }

        foreach (var (src, dst) in metaTransfers) {
            // Only update some safe fields as to not corrupt the file
            var fields = imageMetas[dst].GetFields();
            fields.OffsetX = src.OffsetX;
            fields.OffsetY = src.OffsetY;
            fields.Unknown1 = src.Unknown1;
            fields.Transparency = src.Transparency;
            fields.FileId = src.FileId;
            imageMetas[dst].SetFields(fields);
        }

        if (newHeader != null) {
            // Only update some safe fields as to not corrupt the file
            var fields = header.GetFields();
            fields.Width = newHeader.Width;
            fields.Height = newHeader.Height;
            fields.Unknown1 = newHeader.Unknown1;
            header.SetFields(fields);
        }

        await RebuildStream(progress, ct);
    }

    public async Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        if (imageMetas.ContainsKey(a)) {
            if (imageMetas.ContainsKey(b)) {
                (imageMetas[a], imageMetas[b]) = (imageMetas[b], imageMetas[a]);
                (images[MetaToImageName(a)], images[MetaToImageName(b)]) = (images[MetaToImageName(b)], images[MetaToImageName(a)]);
            } else {
                throw new NotSupportedException("Invalid swap targets");
            }
        } else if (images.ContainsKey(a)) {
            if (images.ContainsKey(b)) {
                (images[a], images[b]) = (images[b], images[a]);
                (imageMetas[ImageToMetaName(a)], imageMetas[ImageToMetaName(b)])
                    = (imageMetas[ImageToMetaName(b)], imageMetas[ImageToMetaName(a)]);
            } else {
                throw new NotSupportedException("Invalid swap targets");
            }
        } else {
            throw new NotSupportedException("Invalid swap targets");
        }

        await RebuildStream(progress, ct);
    }

    public async Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        var nonExisting = names.Except(imageMetas.Keys).Except(images.Keys);
        if (nonExisting.Any()) {
            throw new FileNotFoundException(string.Join(", ", nonExisting));
        }

        if (names.Contains(HEADER_NAME)) {
            throw new NotSupportedException("Cannot delete main header");
        }

        foreach (var name in names) {
            if (IsMetaName(name)) {
                imageMetas.Remove(name);
                images.Remove(MetaToImageName(name));
            } else if (IsImageName(name)) {
                imageMetas.Remove(ImageToMetaName(name));
                images.Remove(name);
            }
        }

        var headerFields = header.GetFields();
        headerFields.FileCount = imageMetas.Count;
        header.SetFields(headerFields);

        await RebuildStream(progress, ct);
    }

    public async Task AddEntry(CancellationToken ct, ITaskProgress? progress) {
        var stream = new BinaryStream(new byte[PnaImageMetaFile.Size]);
        stream.WriteInt32(0); // Zero
        stream.WriteInt32(0); // FileId
        stream.WriteInt32(0); // OffsetX
        stream.WriteInt32(0); // OffsetY
        stream.WriteInt32(1); // Width
        stream.WriteInt32(1); // Height
        stream.WriteInt32(0); // Unknown1
        stream.WriteDouble(1); // Transparency
        stream.WriteInt32(DUMMY_PNG.Length); // DataLen
        var meta = PnaImageMetaFile.FromBytes(this, $"meta{imageMetas.Count}.json", stream);
        imageMetas.Add($"meta{imageMetas.Count}.json", meta);

        images.Add($"img{images.Count}.png", new BinaryStream(DUMMY_PNG));

        var headerFields = header.GetFields();
        headerFields.FileCount++;
        header.SetFields(headerFields);

        await RebuildStream(progress, ct);
    }

    private static string ImageToMetaName(string name) {
        return $"meta{name[3..^4]}.json";
    }

    private static string MetaToImageName(string name) {
        return $"img{name[4..^5]}.png";
    }

    private static bool IsMetaName(string name) {
        return name.StartsWith("meta") && name.EndsWith(".json");
    }

    private static bool IsImageName(string name) {
        return name.StartsWith("img") && name.EndsWith(".png");
    }
}
