using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Epilogue : IOpcode {
    public byte Arg1 { get; set; }
    public byte Arg2 { get; set; }
    public byte Arg3 { get; set; }
    public byte Arg4 { get; set; }
    public byte Arg5 { get; set; }
    public byte Arg6 { get; set; }
    public byte Arg7 { get; set; }
    public byte Arg8 { get; set; }

    public int GetArgumentsLength(Ws2Version version) => 8;

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        Arg1 = reader.ReadByte();
        Arg2 = reader.ReadByte();
        Arg3 = reader.ReadByte();
        Arg4 = reader.ReadByte();
        Arg5 = reader.ReadByte();
        Arg6 = reader.ReadByte();
        Arg7 = reader.ReadByte();
        Arg8 = reader.ReadByte();
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(Arg1);
        writer.Write(Arg2);
        writer.Write(Arg3);
        writer.Write(Arg4);
        writer.Write(Arg5);
        writer.Write(Arg6);
        writer.Write(Arg7);
        writer.Write(Arg8);
    }

    public JsonArray Serialize() => new() { Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8 };

    public void Deserialize(JsonArray args, Ws2Version version) {
        Arg1 = (byte)args[0]!;
        Arg2 = (byte)args[1]!;
        Arg3 = (byte)args[2]!;
        Arg4 = (byte)args[3]!;
        Arg5 = (byte)args[4]!;
        Arg6 = (byte)args[5]!;
        Arg7 = (byte)args[6]!;
        Arg8 = (byte)args[7]!;
    }
}
