using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Op14_DisplayMessage : IOpcode {
    public uint MessageId { get; set; }
    public string Layer { get; set; } = "";
    public string Message { get; set; } = "";
    public byte Type { get; set; }

    public int GetArgumentsLength(Ws2Version version) {
        return 4
            + SjisEncoding.Encoding.GetByteCount(Layer) + 1
            + SjisEncoding.Encoding.GetByteCount(Message) + 1
            + (version >= Ws2Version.V3 ? 1 : 0);
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        MessageId = reader.ReadUInt32();
        Layer = reader.ReadString();
        Message = reader.ReadString();
        Type = version >= Ws2Version.V3 ? reader.ReadByte() : (byte)0;
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(MessageId);
        writer.Write(Layer);
        writer.Write(Message);
        if (version >= Ws2Version.V3) {
            writer.Write(Type);
        }
    }

    public JsonArray Serialize() {
        return new JsonArray { MessageId, Layer, Message, Type };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        MessageId = (uint)args[0]!;
        Layer = (string)args[1]!;
        Message = (string)args[2]!;
        Type = (byte)args[3]!;
    }
}
