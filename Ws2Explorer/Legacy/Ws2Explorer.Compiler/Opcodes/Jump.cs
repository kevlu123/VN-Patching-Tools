using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public abstract class Jump : IOpcode {
    private int pointer = 0;
    public int Pointer {
        get => pointer;
        set {
            pointer = value;
            Labels = new[] { value };
        }
    }

    public abstract byte OpcodeNumber { get; }

    public IEnumerable<int>? Labels { get; protected set; }
    
    public int GetArgumentsLength(Ws2Version version) {
        return 4;
    }
    
    public void Decompile(Ws2Reader reader, Ws2Version version) {
        Pointer = reader.ReadInt32();
        Labels = new[] { Pointer };
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(Pointer);
    }

    public JsonArray Serialize() {
        return new JsonArray { Pointer };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        Pointer = (int)args[0]!;
    }

    public void UpdateLabels(IDictionary<int, int> changes) {
        if (changes.TryGetValue(Pointer, out int value)) {
            Pointer = value;
        } else {
            Console.WriteLine($"Failed to update label {Pointer}");
        }
        //Pointer = changes[Pointer];
    }

    public abstract IOpcode Clone();
}
