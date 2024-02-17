using System.Text;
using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Unicode;

namespace Ws2Explorer;

public class PanFileData {
    // Signature is PAN2
    public byte Signature1 { get; set; }
    public byte Signature2 { get; set; }
    public byte Signature3 { get; set; }
    public byte Signature4 { get; set; }

    public List<PanEntry> Entries { get; set; } = new();

    public PanFileData Clone() {
        return new PanFileData {
            Signature1 = Signature1,
            Signature2 = Signature2,
            Signature3 = Signature3,
            Signature4 = Signature4,
            Entries = Entries.ConvertAll(x => x.Clone()),
        };
    }
}

public class PanEntry {
    public string CharacterName { get; set; } = "";
    public List<PanSubEntry> SubEntries { get; set; } = new();

    public PanEntry Clone() {
        return new PanEntry {
            CharacterName = CharacterName,
            SubEntries = SubEntries.ConvertAll(x => x.Clone()),
        };
    }
}

public class PanSubEntry {
    public float Unknown1 { get; set; }
    public byte Unknown2 { get; set; }
    public string FileName { get; set; } = "";

    public PanSubEntry Clone() {
        return new PanSubEntry {
            Unknown1 = Unknown1,
            Unknown2 = Unknown2,
            FileName = FileName,
        };
    }
}

public class PanFile : BinaryFile, IFolder {
    private readonly PanFileData data;
    private readonly BinaryStream dataStream;

    public bool CanRenameChildren => false;
    public PanFileData Data => data.Clone();

    public PanFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        stream.Reset();

        data = new PanFileData {
            Signature1 = stream.ReadByte(),
            Signature2 = stream.ReadByte(),
            Signature3 = stream.ReadByte(),
            Signature4 = stream.ReadByte(),
        };

        if (data.Signature1 != 'P' || data.Signature2 != 'A' || data.Signature3 != 'N' || data.Signature4 != '2') {
            throw new InvalidDataException("Invalid PAN signature");
        }

        int entryCount = stream.ReadInt32();
        for (int i = 0; i < entryCount; i++) {
            var entry = new PanEntry {
                CharacterName = stream.ReadStringSjis(),
            };

            int subEntryCount = stream.ReadInt32();
            for (int j = 0; j < subEntryCount; j++) {
                entry.SubEntries.Add(new PanSubEntry {
                    Unknown1 = stream.ReadSingle(),
                    Unknown2 = stream.ReadByte(),
                    FileName = stream.ReadStringSjis(),
                });
            }

            data.Entries.Add(entry);
        }

        var jsonOptions = new JsonSerializerOptions() {
            WriteIndented = true,
            Encoder = JavaScriptEncoder.Create(UnicodeRanges.All),
        };
        var json = JsonSerializer.Serialize(data, jsonOptions);
        dataStream = new BinaryStream(Encoding.UTF8.GetBytes(json));
    }

    public List<FileMetadata> ListChildren() {
        return new List<FileMetadata> {
            new("data", dataStream.Length),
        };
    }

    public Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        if (name != "data") {
            throw new FileNotFoundException();
        }

        return Task.FromResult<IFile>(new BinaryFile(this, name, dataStream));
    }

    public Task NotifyChildChanged(string child, BinaryStream newData, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public Task RenameChild(string from, string to, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public Task CopyFiles(string[] fromFullPath, string[] to, Func<string, bool> prompt, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public Task SwapChildren(string a, string b, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }

    public Task DeleteChildren(string[] names, CancellationToken ct, ITaskProgress? progress) {
        throw new NotSupportedException();
    }
}
