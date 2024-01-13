using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Op15_SetDisplayName : IOpcode {
    public string CharacterName { get; set; } = "";
    public byte Arg1 { get; set; }

    public int GetArgumentsLength(Ws2Version version) {
        return SjisEncoding.Encoding.GetByteCount(CharacterName) + 1
            + (version >= Ws2Version.V3 ? 1 : 0);
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        CharacterName = reader.ReadString();
        Arg1 = version >= Ws2Version.V3 ? reader.ReadByte() : (byte)0;
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(CharacterName);
        if (version >= Ws2Version.V3) {
            writer.Write(Arg1);
        }
    }

    public JsonArray Serialize() {
        return new JsonArray { CharacterName, Arg1 };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        CharacterName = (string)args[0]!;
        Arg1 = (byte)args[1]!;
    }
}
