using System.Text;

namespace Ws2Explorer;

public enum LuaVersion {
    V5_1 = 0x51,
    V5_2 = 0x52,
    V5_3 = 0x53,
    V5_4 = 0x54,
    // Other values possible
}

public class LuacFile : BinaryFile, IFolder {
    private static readonly byte[] SIGNATURE = new byte[] {
       0x1B, 0x4C, 0x75, 0x61,
    };

    public bool CanRenameChildren => false;
    public LuaVersion LuaVersion { get; }
    public string TextualLua { get; }

    public LuacFile(IFolder? parent, string name, BinaryStream stream) : base(parent, name, stream) {
        var (data, start, _) = stream.RawBuffer;
        if (stream.Length < SIGNATURE.Length + 1) {
            throw new InvalidDataException("Invalid header");
        }

        var slice = data.Skip(start).Take(SIGNATURE.Length);
        if (!slice.SequenceEqual(SIGNATURE)) {
            throw new InvalidDataException("Invalid header");
        }

        LuaVersion = (LuaVersion)data[start + SIGNATURE.Length];
        TextualLua = AsTextualLua();
    }

    public List<FileMetadata> ListChildren() {
        return new List<FileMetadata> {
            new("as_text.lua", TextualLua.Length),
            new("version.txt", GetLuaVersionString().Length),
        };
    }

    public Task<IFile> GetChild(string name, CancellationToken ct, ITaskProgress? progress) {
        switch (name) {
            case "as_text.lua": {
                    var data = Encoding.UTF8.GetBytes(TextualLua);
                    var stream = new BinaryStream(data);
                    return Task.FromResult<IFile>(AsText(this, name, stream));
                }
            case "version.txt": {
                    var data = Encoding.UTF8.GetBytes(GetLuaVersionString());
                    var stream = new BinaryStream(data);
                    return Task.FromResult<IFile>(AsText(this, name, stream));
                }
            default:
                throw new FileNotFoundException();
        }
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

    private string GetLuaVersionString() {
        return string.Format(
            "{0}.{1}",
            (byte)LuaVersion >> 4,
            (byte)LuaVersion & 0xF);
    }

    private string AsTextualLua() {
        Stream.Reset();
        var (data, start, length) = Stream.RawBuffer;
        return string.Format("""
_hex_source = "{0}"
function _hex_to_array(str)
  return (str:gsub('..', function (cc)
    return string.char(tonumber(cc, 16))
  end))
end
{1}(_hex_to_array(_hex_source))()
""",
            Convert.ToHexString(data, start, length),
            LuaVersion == LuaVersion.V5_1 ? "loadstring" : "load"
        );
    }
}
