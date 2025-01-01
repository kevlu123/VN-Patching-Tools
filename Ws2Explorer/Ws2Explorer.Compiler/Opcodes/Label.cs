using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Label : IOpcode {
    public int Offset { get; set; }

    public int GetArgumentsLength(Ws2Version version) => 0;
    public void Decompile(Ws2Reader reader, Ws2Version version) { }
    public void Compile(Ws2Writer writer, Ws2Version version) { }
    public JsonArray Serialize() => new() { Offset };
    public void Deserialize(JsonArray args, Ws2Version version) => Offset = (int)args[0]!;
    public IOpcode Clone() => new Label { Offset = Offset };
}
