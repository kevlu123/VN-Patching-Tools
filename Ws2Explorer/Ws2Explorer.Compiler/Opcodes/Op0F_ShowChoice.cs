using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class Op0F_ShowChoice : IOpcode {
    public class Choice {
        public ushort ChoiceId { get; set; }
        public string Text { get; set; } = "";
        public byte Arg1 { get; set; }
        public byte Arg2 { get; set; }
        public byte Arg3 { get; set; }
        public byte JumpType { get; set; }
        public int JumpPointer { get; set; }
        public string JumpFile { get; set; } = "";
    }

    public byte ChoiceCount { get; set; }
    public Choice[] Choices { get; set; } = Array.Empty<Choice>();

    public IEnumerable<int>? Labels { get; private set; }
    
    public int GetArgumentsLength(Ws2Version version) {
        return 1 + Choices.Sum(choice =>
            2 + 1 + 1 + 1 + 1
            + SjisEncoding.Encoding.GetByteCount(choice.Text) + 1
            + choice.JumpType switch {
                6 => 4,
                7 => SjisEncoding.Encoding.GetByteCount(choice.JumpFile) + 1,
                _ => throw new ArgumentException($"Unknown jump type {choice.JumpType}"),
            });
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        ChoiceCount = reader.ReadByte();

        Choices = new Choice[ChoiceCount];
        for (int i = 0; i < ChoiceCount; i++) {
            var choice = new Choice {
                ChoiceId = reader.ReadUInt16(),
                Text = reader.ReadString(),
                Arg1 = reader.ReadByte(),
                Arg2 = reader.ReadByte(),
                Arg3 = reader.ReadByte(),
                JumpType = reader.ReadByte(),
            };

            switch (choice.JumpType) {
            case 6:
                choice.JumpPointer = reader.ReadInt32();
                break;
            case 7:
                choice.JumpFile = reader.ReadString();
                break;
            default:
                throw new ArgumentException($"Unknown jump type {choice.JumpType}");
            }

            Choices[i] = choice;
        }

        Labels = Choices.Select(choice => choice.JumpPointer).ToArray();
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        writer.Write(ChoiceCount);
        foreach (var choice in Choices) {
            writer.Write(choice.ChoiceId);
            writer.Write(choice.Text);
            writer.Write(choice.Arg1);
            writer.Write(choice.Arg2);
            writer.Write(choice.Arg3);
            writer.Write(choice.JumpType);
            switch (choice.JumpType) {
            case 6:
                writer.Write(choice.JumpPointer);
                break;
            case 7:
                writer.Write(choice.JumpFile);
                break;
            default:
                throw new ArgumentException($"Unknown jump type {choice.JumpType}");
            }
        }
    }

    public void UpdateLabels(IDictionary<int, int> changes) {
        foreach (var choice in Choices) {
            if (choice.JumpType == 6) {
                choice.JumpPointer = changes[choice.JumpPointer];
            }
        }
    }

    public JsonArray Serialize() {
        return new JsonArray {
            ChoiceCount,
            new JsonArray(Choices.Select(choice => new JsonArray {
                choice.ChoiceId,
                choice.Text,
                choice.Arg1,
                choice.Arg2,
                choice.Arg3,
                choice.JumpType,
                choice.JumpPointer,
                choice.JumpFile,
            }).ToArray()),
        };
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        ChoiceCount = (byte)args[0]!;
        Choices = ((JsonArray)args[1]!).Select(choice => new Choice {
            ChoiceId = (ushort)choice![0]!,
            Text = (string)choice[1]!,
            Arg1 = (byte)choice[2]!,
            Arg2 = (byte)choice[3]!,
            Arg3 = (byte)choice[4]!,
            JumpType = (byte)choice[5]!,
            JumpPointer = (int)choice[6]!,
            JumpFile = (string)choice[7]!,
        }).ToArray();
    }
}
