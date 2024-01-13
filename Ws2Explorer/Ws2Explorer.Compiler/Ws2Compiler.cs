using System.Text.Json.Nodes;
using System.Text.Json;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using Ws2Explorer.Compiler.Opcodes;

namespace Ws2Explorer.Compiler;

public static class Ws2Compiler {
    private static readonly Dictionary<byte, OpcodeConstructor> opcodeConstructors = new();

    static Ws2Compiler() {
        foreach (var (opcodeNumber, ctor) in GenericOpcode.Constructors) {
            opcodeConstructors.Add(opcodeNumber, ctor);
        }
        opcodeConstructors[0x02] = () => new Op02_Jump1();
        opcodeConstructors[0x06] = () => new Op06_Jump2();
        opcodeConstructors[0x0F] = () => new Op0F_ShowChoice();
        opcodeConstructors[0x14] = () => new Op14_DisplayMessage();
        opcodeConstructors[0x15] = () => new Op15_SetDisplayName();
    }

    public static List<IOpcode> Decompile(Stream stream, out Ws2Version version, out bool encrypted) {
        var versions = new Ws2Version[] {
            Ws2Version.V3,
            Ws2Version.V2,
            Ws2Version.V1,
            Ws2Version.V4, // Rare
        };

        var exceptions = new List<Exception>();
        foreach (var enc in new[] { true, false }) {
            foreach (var vers in versions) {
                try {
                    version = vers;
                    encrypted = enc;
                    return Decompile(stream, vers, enc);
                } catch (Exception ex) {
                    exceptions.Add(ex);
                    stream.Position = 0;
                    continue;
                }
            }
        }

        throw new AggregateException("Failed to decompile ws2 file for any version", exceptions);
    }

    public static List<IOpcode> Decompile(Stream stream, Ws2Version version, bool encrypted) {
        if (encrypted) {
            stream = new DecryptedStream(stream);
        }

        var reader = new Ws2Reader(stream);
        var opcodes = new List<(IOpcode opcode, int offset)>();
        var labels = new HashSet<int>();

        while (stream.Position + 8 < stream.Length) {
            int offset = (int)stream.Position;
            var opcodeNumber = reader.ReadByte();
            if (!opcodeConstructors.TryGetValue(opcodeNumber, out var opcodeConstructor)) {
                throw new NotImplementedException($"Opcode 0x{opcodeNumber:X2} at offset 0x{offset:X} not implemented");
            }

            var opcode = opcodeConstructor();
            opcode.Decompile(reader, version);

            var expectedLength = opcode.GetArgumentsLength(version) + 1;
            var actualLength = (int)(stream.Position - offset);
            if (expectedLength != actualLength) {
                throw new Exception($"Opcode {opcode.Name}: GetArgumentsLength() returned {expectedLength} got {actualLength} bytes. Possibly invalid SJIS string.");
            }

            opcodes.Add((opcode, offset));
            if (opcode.Labels != null) {
                labels.UnionWith(opcode.Labels);
            }
        }

        var epilogueOffset = (int)stream.Position;
        var epilogue = new Epilogue();
        epilogue.Decompile(reader, version);
        opcodes.Add((epilogue, epilogueOffset));

        var opcodesWithLabels = new List<IOpcode>();
        foreach (var (opcode, offset) in opcodes) {
            if (labels.Contains(offset)) {
                labels.Remove(offset);
                opcodesWithLabels.Add(new Label { Offset = offset });
            }
            opcodesWithLabels.Add(opcode);
        }
        //if (labels.Count > 0) {
        //    throw new InvalidDataException($"Invalid labels {string.Join(", ", labels)}.");
        //}
        return opcodesWithLabels;
    }

    public static Stream Compile(List<IOpcode> opcodes, Ws2Version version, bool encrypted) {
        var stream = new MemoryStream();
        var writer = new Ws2Writer(stream);

        var labelChanges = new Dictionary<int, int>();
        int offset = 0;
        var numberedOpcodes = new List<IOpcode>();
        Epilogue? epilogue = null;
        foreach (var opcode in opcodes) {
            if (opcode is Epilogue ep) {
                epilogue = ep;
            } else if (opcode is Label label) {
                labelChanges.Add(label.Offset, offset);
            } else {
                offset += opcode.GetArgumentsLength(version) + 1;
                numberedOpcodes.Add(opcode);
            }
        }

        foreach (var opcode in numberedOpcodes) {
            opcode.UpdateLabels(labelChanges);
            writer.Write(opcode.OpcodeNumber);
            opcode.Compile(writer, version);
        }
        epilogue?.Compile(writer, version);

        stream.Position = 0;
        return encrypted ? new EncryptedStream(stream) : stream;
    }

    public static string SerializeToJson(List<IOpcode> opcodes) {
        var options = new JsonSerializerOptions {
            Encoder = JavaScriptEncoder.Create(UnicodeRanges.All)
        };
        var entries = opcodes.Select(opcode =>
            new JsonObject(new KeyValuePair<string, JsonNode?>[] {
                new("op", JsonValue.Create(opcode.Name)),
                new("args", opcode.Serialize()),
            })
            .ToJsonString(options)
        );
        return $"[\n{string.Join(",\n", entries)}\n]";
    }

    public static List<IOpcode> DeserializeFromJson(string json, Ws2Version version) {
        var options = new JsonSerializerOptions {
            Encoder = JavaScriptEncoder.Create(UnicodeRanges.All)
        };

        var entries = JsonSerializer.Deserialize<JsonArray>(json, options) ?? throw new ArgumentException("Invalid JSON");
        return entries.Select(entry => {
            if (entry is not JsonObject) {
                throw new ArgumentException("Invalid JSON");
            }

            var args = entry["args"]?.AsArray() ?? throw new ArgumentException("Opcode arguments are missing");

            IOpcode opcode;
            var opcodeName = entry["op"]?.ToString() ?? throw new ArgumentException("Opcode name is missing");
            if (opcodeName == "Epilogue") {
                opcode = new Epilogue();
            } if (opcodeName == "Label") {
                opcode = new Label();
            } else {
                var opcodeNumber = byte.Parse(opcodeName[2..4], System.Globalization.NumberStyles.HexNumber);
                if (!opcodeConstructors.TryGetValue(opcodeNumber, out var opcodeConstructor)) {
                    throw new ArgumentException($"Unknown opcode {opcodeName}");
                }
                opcode = opcodeConstructor();
            }

            opcode.Deserialize(args, version);
            return opcode;
        }).ToList();
    }
}
