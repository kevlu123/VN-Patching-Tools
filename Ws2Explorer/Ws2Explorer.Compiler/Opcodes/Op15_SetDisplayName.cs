using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Op15_SetDisplayName : IOpcode {
    public string FullCharacterName { get; set; } = "";
    public byte Arg1 { get; set; }

    public string CharacterName {
        get => FullCharacterName[GetPrefixLength()..];
        set => FullCharacterName = Prefix + value;
    }

    public string Prefix {
        get => FullCharacterName[..GetPrefixLength()];
        set => FullCharacterName = value + CharacterName;
    }

    private int GetPrefixLength() {
        int i = 0;
        while (i + 3 < FullCharacterName.Length && FullCharacterName[i] == '%') {
            i += 3;
        }
        return i;
    }

    public int GetArgumentsLength(Ws2Version version) {
        return SjisEncoding.Encoding.GetByteCount(FullCharacterName) + 1
            + (version >= Ws2Version.V3 ? 1 : 0);
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        FullCharacterName = reader.ReadString();
        Arg1 = version >= Ws2Version.V3 ? reader.ReadByte() : (byte)0;
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(FullCharacterName);
        if (version >= Ws2Version.V3) {
            writer.Write(Arg1);
        }
    }

    public JsonArray Serialize() {
        return new JsonArray { CharacterName, Prefix, Arg1 };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        FullCharacterName = (string)args[0]! + (string)args[1]!;
        Arg1 = (byte)args[2]!;
    }
}
