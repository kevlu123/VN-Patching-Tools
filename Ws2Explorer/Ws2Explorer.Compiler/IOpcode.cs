using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler;

public interface IOpcode {
    IEnumerable<int>? Labels => null;
    string Name => GetType().Name;
    byte OpcodeNumber => throw new InvalidOperationException();

    int GetArgumentsLength(Ws2Version version);
    void Decompile(Ws2Reader reader, Ws2Version version);
    void Compile(Ws2Writer writer, Ws2Version version);
    JsonArray Serialize();
    void Deserialize(JsonArray args, Ws2Version version);
    void UpdateLabels(IDictionary<int, int> changes) { }
    IOpcode Clone();
}
