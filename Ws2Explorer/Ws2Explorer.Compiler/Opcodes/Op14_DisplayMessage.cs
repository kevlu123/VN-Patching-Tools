using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Op14_DisplayMessage : IOpcode {
    public uint MessageId { get; set; }
    public string Layer { get; set; } = "";
    public string FullMessage { get; set; } = "";
    public byte Type { get; set; }

    public string Message {
        get => FullMessage[..^GetSuffixLength()];
        set => FullMessage = value + Suffix;
    }

    public string Suffix {
        get => FullMessage[^GetSuffixLength()..];
        set => FullMessage = Message + value;
    }

    private int GetSuffixLength() {
        int i = FullMessage.Length;
        while (i - 2 > 0 && FullMessage[i - 2] == '%') {
            i -= 2;
        }
        return FullMessage.Length - i;
    }

    public int GetArgumentsLength(Ws2Version version) {
        return 4
            + SjisEncoding.Encoding.GetByteCount(Layer) + 1
            + SjisEncoding.Encoding.GetByteCount(FullMessage) + 1
            + (version >= Ws2Version.V3 ? 1 : 0);
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        MessageId = reader.ReadUInt32();
        Layer = reader.ReadString();
        FullMessage = reader.ReadString();
        Type = version >= Ws2Version.V3 ? reader.ReadByte() : (byte)0;
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(MessageId);
        writer.Write(Layer);
        writer.Write(FullMessage);
        if (version >= Ws2Version.V3) {
            writer.Write(Type);
        }
    }

    public JsonArray Serialize() {
        return new JsonArray { MessageId, Layer, Message, Suffix, Type };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        MessageId = (uint)args[0]!;
        Layer = (string)args[1]!;
        FullMessage = (string)args[2]! + (string)args[3]!;
        Type = (byte)args[4]!;
    }
}
