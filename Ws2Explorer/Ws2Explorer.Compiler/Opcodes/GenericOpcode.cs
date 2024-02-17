using System.Text.Json.Nodes;

namespace Ws2Explorer.Compiler.Opcodes;

public class GenericOpcode : IOpcode {
    public byte OpcodeNumber { get; }
    public string Name => names.TryGetValue(OpcodeNumber, out var name)
        ? $"Op{OpcodeNumber:X2}_{name}"
        : $"Op{OpcodeNumber:X2}";
    public IEnumerable<int>? Labels { get; private set; }

    public List<object> Arguments { get; } = new();

    private string GetVersionTemplate(Ws2Version version) {
        int versionNumber = (int)version;
        var templateSet = new[] {
            templates1,
            templates2,
            templates3,
            templates4,
        }[versionNumber];

        if (!templateSet.TryGetValue(OpcodeNumber, out var template)) {
            throw new InvalidOperationException($"Opcode {OpcodeNumber:X2} not implemented for V{versionNumber + 1}");
        }
        return template;
    }

    public int GetArgumentsLength(Ws2Version version) {
        var v = GetVersionTemplate(version);
        int len = 0;
        for (int i = 0; i < v.Length; i++) {
            len += v[i] switch {
                'b' => 1,
                'h' => 2,
                'i' => 4,
                'f' => 4,
                'a' => 4,
                's' => SjisEncoding.Encoding.GetByteCount((string)Arguments[i]) + 1,
                'H' => 1 + (((ushort[])Arguments[i]).Length * 2),
                'S' => 1 + ((string[])Arguments[i]).Sum(s => SjisEncoding.Encoding.GetByteCount(s) + 1),
                _ => throw new ArgumentException($"Unknown type {v[i]}"),
            };
        }
        return len;
    }

    public void UpdateLabels(IDictionary<int, int> changes) {
        for (int i = 0; i < Arguments.Count; i++) {
            if (Arguments[i] is int label) {
                Arguments[i] = changes[label];
            }
        }
    }

    public void Decompile(Ws2Reader reader, Ws2Version version) {
        object ReadUInt16s() {
            ushort[] arr = new ushort[reader.ReadByte()];
            for (int i = 0; i < arr.Length; i++) {
                arr[i] = reader.ReadUInt16();
            }
            return arr;
        }

        object ReadStrings() {
            string[] arr = new string[reader.ReadByte()];
            for (int i = 0; i < arr.Length; i++) {
                arr[i] = reader.ReadString();
            }
            return arr;
        }

        var v = GetVersionTemplate(version);
        for (int i = 0; i < v.Length; i++) {
            Arguments.Add(v[i] switch {
                'b' => reader.ReadByte(),
                'h' => reader.ReadUInt16(),
                'i' => reader.ReadUInt32(),
                'f' => reader.ReadSingle(),
                'a' => reader.ReadInt32(),
                's' => reader.ReadString(),
                'H' => ReadUInt16s(),
                'S' => ReadStrings(),
                _ => throw new ArgumentException($"Unknown type {v[i]}"),
            });
        }

        Labels = Arguments.Where(arg => arg is int)
            .Select(arg => (int)arg)
            .ToArray();
    }

    public void Compile(Ws2Writer writer, Ws2Version version) {
        void WriteUInt16s(ushort[] arr) {
            writer.Write((byte)arr.Length);
            for (int i = 0; i < arr.Length; i++) {
                writer.Write(arr[i]);
            }
        }

        void WriteStrings(string[] arr) {
            writer.Write((byte)arr.Length);
            for (int i = 0; i < arr.Length; i++) {
                writer.Write(arr[i]);
            }
        }

        var v = GetVersionTemplate(version);
        for (int i = 0; i < v.Length; i++) {
            if (v[i] == 'b') {
                writer.Write((byte)Arguments[i]);
            } else if (v[i] == 'h') {
                writer.Write((ushort)Arguments[i]);
            } else if (v[i] == 'i') {
                writer.Write((uint)Arguments[i]);
            } else if (v[i] == 'f') {
                writer.Write((float)Arguments[i]);
            } else if (v[i] == 'a') {
                writer.Write((int)Arguments[i]);
            } else if (v[i] == 's') {
                writer.Write((string)Arguments[i]);
            } else if (v[i] == 'H') {
                WriteUInt16s((ushort[])Arguments[i]);
            } else if (v[i] == 'S') {
                WriteStrings((string[])Arguments[i]);
            } else {
                throw new ArgumentException($"Unknown type {v[i]}");
            }
        }
    }

    public JsonArray Serialize() {
        return new JsonArray(Arguments.Select(arg => {
            return (JsonNode?)(arg switch {
                byte b => JsonValue.Create(b),
                ushort h => JsonValue.Create(h),
                uint i => JsonValue.Create(i),
                float f => JsonValue.Create(f),
                int a => JsonValue.Create(a),
                string s => JsonValue.Create(s),
                ushort[] H => new JsonArray(H.Select(h => JsonValue.Create(h)).ToArray()),
                string[] S => new JsonArray(S.Select(s => JsonValue.Create(s)).ToArray()),
                _ => throw new ArgumentException($"Unknown type {arg.GetType()}"),
            });
        }).ToArray());
    }

    public void Deserialize(JsonArray args, Ws2Version version) {
        Arguments.Clear();
        var v = GetVersionTemplate(version);
        for (int i = 0; i < v.Length; i++) {
            Arguments.Add(v[i] switch {
                'b' => (byte)args[i]!,
                'h' => (ushort)args[i]!,
                'i' => (uint)args[i]!,
                'f' => (float)args[i]!,
                'a' => (int)args[i]!,
                's' => (string)args[i]!,
                'H' => ((JsonArray)args[i]!).Select(h => (ushort)(int)h!).ToArray(),
                'S' => ((JsonArray)args[i]!).Select(s => (string)s!).ToArray(),
                _ => throw new ArgumentException($"Unknown type {v[i]}"),
            });
        }
    }

    public GenericOpcode(byte opcodeNumber) {
        OpcodeNumber = opcodeNumber;
    }

    public static (byte, OpcodeConstructor)[] Constructors =>
        Enumerable.Range(0, 256)
            .Select(n => (byte)n)
            .Select<byte, (byte, OpcodeConstructor)>(n => (n, () => new GenericOpcode(n)))
            .ToArray();

    private static readonly Dictionary<byte, string> names = new() {
        { 0x00, "Null" },
        { 0x01, "ConditionalJump" },
        { 0x02, "Jump2" },
        { 0x04, "RunFile" },
        { 0x06, "Jump" },
        { 0x07, "NextFile" },
        { 0x09, "ModifyVariable" },
        { 0x0B, "SetFlag" },
        { 0x0F, "ShowChoice" },
        { 0x11, "SetTimer" },
        { 0x12, "StartTimer" },
        { 0x14, "DisplayMessage" },
        { 0x15, "SetDisplayName" },
        { 0x1A, "OpenTitle" },
        { 0x1C, "ExecuteFunction" },
        { 0x1E, "PlayMusic" },
        { 0x1F, "StopMusic" },
        { 0x20, "MusicUnk1" },
        { 0x28, "PlaySound" },
        { 0x29, "StopSound" },
        { 0x2A, "SoundUnk2" },
        { 0x2E, "CharMessageStart" },
        { 0x33, "SetBackground" },
        { 0x34, "LoadPna" },
        { 0x35, "PlayMovie" },
        { 0x37, "ClearLayer" },
        { 0x38, "VariableUnk3" },
        { 0x39, "SetPnaImage" },
        { 0x3A, "UnkBackground2" },
        { 0x3F, "SetLayerOrder" },
        { 0x40, "SetMask" },
        { 0x41, "UnkBackground3" },
        { 0x45, "GetLayerProperties" },
        { 0x46, "SetLayerProperties" },
        { 0x47, "Effect1" },
        { 0x48, "Effect2" },
        { 0x51, "AnimationFrame" },
        { 0x52, "VariableUnk2" },
        { 0x53, "VariableUnk4" },
        { 0x56, "RainStart" },
        { 0x57, "UnkBackground1" },
        { 0x58, "Effect3" },
        { 0x5C, "RainEnd" },
        { 0x66, "ShowGraphic" },
        { 0x6E, "SetVariable" },
        { 0x6F, "VariableUnk" },
        { 0xF0, "UnkScreen" },
        { 0xFF, "FileEnd" },
    };


    private static readonly Dictionary<byte, string> templates1 = new() {
        { 0x00, "" },
        { 0x01, "bhfaa" },  // Conditional jmp
        { 0x02, "a" },      // Unconditional jmp
        { 0x04, "s" },
        { 0x05, "" },
        { 0x06, "a" },      // Unconditional jmp
        { 0x07, "s" },
        { 0x08, "b" },
        { 0x09, "bhf" },
        { 0x0A, "hf" },
        { 0x0B, "hb" },
        { 0x0C, "hbH" },
        { 0x0D, "hhf" },
        { 0x0E, "hhb" },
        { 0x0F, "b" },      // Choice screen
        { 0x11, "sf" },
        { 0x12, "sbs" },
        { 0x13, "" },
        { 0x14, "iss" },    // Message
        { 0x15, "s" },      // Character name
        { 0x16, "b" },
        { 0x17, "" },
        { 0x18, "bs" },
        { 0x19, "" },
        { 0x1A, "s" },
        { 0x1B, "b" },
        { 0x1C, "ssh" },
        { 0x1D, "h" },
        { 0x1E, "ssffhhb" },
        { 0x1F, "sf" },
        { 0x20, "sfh" },
        { 0x21, "shhh" },
        { 0x22, "sb" },
        { 0x28, "ssffhhbhhb" },
        { 0x29, "sf" },
        { 0x2A, "sfh" },
        { 0x2B, "s" },
        { 0x2C, "s" },
        { 0x2D, "sb" },
        { 0x2E, "" },
        { 0x2F, "shf" },
        { 0x32, "s" },
        { 0x33, "ssbb" },
        { 0x34, "ssbb" },
        { 0x35, "ssbbb" },
        { 0x36, "sfffffffbb" },
        { 0x37, "s" },
        { 0x38, "sb" },
        { 0x39, "sbbH" },
        { 0x3A, "sbb" },
        { 0x3B, "sshhhffffffff" },
        { 0x3C, "s" },
        { 0x3D, "h" },
        { 0x3E, "" },
        { 0x3F, "S" },
        { 0x40, "ssb" },
        { 0x41, "sb" },
        { 0x42, "sh" },
        { 0x43, "s" },
        { 0x44, "ssb" },
        { 0x45, "shffff" },
        { 0x46, "shbffff" },
        { 0x47, "sshbbfffffhf" },
        { 0x48, "sshbbs" },
        { 0x49, "sss" },
        { 0x4A, "ss" },
        { 0x4B, "shhffff" },
        { 0x4C, "shhbffff" },
        { 0x4D, "sshhbbfffffhf" },
        { 0x4E, "sshhbbs" },
        { 0x4F, "sshs" },
        { 0x50, "ssh" },
        { 0x51, "sshfb" },
        { 0x52, "ssfhfbs" },
        { 0x53, "ss" },
        { 0x54, "sss" },
        { 0x55, "ss" },
        { 0x56, "sbhfffffffffffbffffbhshssf" },
        { 0x57, "sh" },
        { 0x58, "ss" },
        { 0x59, "ssh" },
        { 0x5A, "sH" },
        { 0x5B, "shb" },
        { 0x5C, "s" },
        { 0x5D, "ssb" },
        { 0x5E, "sff" },
        { 0x64, "b" },
        { 0x65, "hbffbs" },
        { 0x66, "s" },
        { 0x67, "bbhfffffb" },
        { 0x68, "b" },
        { 0x6E, "ss" },
        { 0x6F, "s" },
        { 0x70, "sh" },
        { 0x71, "" },
        { 0x72, "shhs" },
        { 0x73, "ssh" },
        { 0xFA, "" },
        { 0xFB, "b" },
        { 0xFC, "h" },
        { 0xFD, "" },
        { 0xFE, "s" },
        { 0xFF, "" }
    };

    private static readonly Dictionary<byte, string> templates2 = new() {
        { 0x00, "" },
        { 0x01, "bhfaa" },  // Conditional jmp
        { 0x02, "a" },      // Unconditional jmp
        { 0x04, "s" },
        { 0x05, "" },
        { 0x06, "a" },      // Unconditional jmp
        { 0x07, "s" },
        { 0x08, "b" },
        { 0x09, "bhf" },
        { 0x0A, "hf" },
        { 0x0B, "hb" },
        { 0x0C, "hbH" },
        { 0x0D, "hhf" },
        { 0x0E, "hhb" },
        { 0x0F, "b" },      // Choice screen
        { 0x11, "sf" },
        { 0x12, "sbs" },
        { 0x13, "" },
        { 0x14, "iss" },    // Message
        { 0x15, "s" },      // Character name
        { 0x16, "b" },
        { 0x17, "" },
        { 0x18, "bs" },
        { 0x19, "" },
        { 0x1A, "s" },
        { 0x1B, "b" },
        { 0x1C, "sshb" },
        { 0x1D, "h" },
        { 0x1E, "ssffhhb" },
        { 0x1F, "sf" },
        { 0x20, "sfh" },
        { 0x21, "shhh" },
        { 0x22, "sb" },
        { 0x28, "ssffhhbhhb" },
        { 0x29, "sf" },
        { 0x2A, "sfh" },
        { 0x2B, "s" },
        { 0x2C, "s" },
        { 0x2D, "sb" },
        { 0x2E, "" },
        { 0x2F, "shf" },
        { 0x32, "s" },
        { 0x33, "ssbb" },
        { 0x34, "ssbb" },
        { 0x35, "ssbbb" },
        { 0x36, "sfffffffbb" },
        { 0x37, "s" },
        { 0x38, "sb" },
        { 0x39, "sbbH" },
        { 0x3A, "sbb" },
        { 0x3B, "sshhhffffffff" },
        { 0x3C, "s" },
        { 0x3D, "h" },
        { 0x3E, "" },
        { 0x3F, "S" },
        { 0x40, "ssb" },
        { 0x41, "sb" },
        { 0x42, "sh" },
        { 0x43, "s" },
        { 0x44, "ssb" },
        { 0x45, "shffff" },
        { 0x46, "shbffff" },
        { 0x47, "sshbbfffffhf" },
        { 0x48, "sshbbs" },
        { 0x49, "sss" },
        { 0x4A, "ss" },
        { 0x4B, "shhffff" },
        { 0x4C, "shhbffff" },
        { 0x4D, "sshhbbfffffhf" },
        { 0x4E, "sshhbbs" },
        { 0x4F, "sshs" },
        { 0x50, "ssh" },
        { 0x51, "sshfb" },
        { 0x52, "ssfhfbs" },
        { 0x53, "ss" },
        { 0x54, "sss" },
        { 0x55, "ss" },
        { 0x56, "sbhfffffffffffbffffbhshssf" },
        { 0x57, "sh" },
        { 0x58, "ss" },
        { 0x59, "ssh" },
        { 0x5A, "sH" },
        { 0x5B, "shb" },
        { 0x5C, "s" },
        { 0x5D, "ssb" },
        { 0x5E, "sff" },
        { 0x5F, "s" },
        { 0x60, "hhhh" },
        { 0x61, "bffff" },
        { 0x62, "s" },
        { 0x63, "sb" },
        { 0x64, "b" },
        { 0x65, "hbffbs" },
        { 0x66, "s" },
        { 0x67, "bbhfffffb" },
        { 0x68, "b" },
        { 0x69, "sbbfffffhf" },
        { 0x6A, "shbbs" },
        { 0x6E, "ss" },
        { 0x6F, "s" },
        { 0x70, "sh" },
        { 0x71, "" },
        { 0x72, "shhs" },
        { 0x73, "ssh" },
        { 0x74, "ss" },
        { 0x75, "ss" },
        { 0x78, "ssbb" },
        { 0x79, "ssf" },
        { 0x7A, "ssfbbs" },
        { 0x7B, "ss" },
        { 0x7C, "ssf" },
        { 0x7D, "sf" },
        { 0x7E, "s" },
        { 0xC8, "" },
        { 0xC9, "sshhh" },
        { 0xCA, "ss" },
        { 0xCB, "sbb" },
        { 0xCC, "" },
        { 0xCD, "sssssfb" },
        { 0xCE, "b" },
        { 0xCF, "ssf" },
        { 0xD0, "sh" },
        { 0xD1, "sh" },
        { 0xD2, "s" },
        { 0xD3, "s" },
        { 0xD4, "shh" },
        { 0xF8, "" },
        { 0xF9, "bs" },
        { 0xFA, "" },
        { 0xFB, "b" },
        { 0xFC, "h" },
        { 0xFD, "" },
        { 0xFE, "s" },
        { 0xFF, "" }
    };

    private static readonly Dictionary<byte, string> templates3 = new() {
        { 0x00, "" },
        { 0x01, "bhfaa" },  // Conditional jmp
        { 0x02, "a" },      // Unconditional jmp
        { 0x04, "s" },
        { 0x05, "" },
        { 0x06, "a" },      // Unconditional jmp
        { 0x07, "s" },
        { 0x08, "b" },
        { 0x09, "bhf" },
        { 0x0A, "hf" },
        { 0x0B, "hb" },
        { 0x0C, "hbH" },
        { 0x0D, "hhf" },
        { 0x0E, "hhb" },
        { 0x0F, "b" },      // Choice screen
        { 0x11, "sbf" },
        { 0x12, "sbs" },
        { 0x13, "" },
        { 0x14, "issb" },   // Message
        { 0x15, "sb" },     // Character name
        { 0x16, "bb" },
        { 0x17, "" },
        { 0x18, "bs" },
        { 0x19, "" },
        { 0x1A, "s" },
        { 0x1B, "b" },
        { 0x1C, "sshb" },
        { 0x1D, "h" },
        { 0x1E, "ssffhhbf" },
        { 0x1F, "sf" },
        { 0x20, "sfh" },
        { 0x21, "shhh" },
        { 0x22, "sb" },
        { 0x28, "ssffhhbhhbf" },
        { 0x29, "sf" },
        { 0x2A, "sfh" },
        { 0x2B, "s" },
        { 0x2C, "s" },
        { 0x2D, "sb" },
        { 0x2E, "" },
        { 0x2F, "shf" },
        { 0x32, "s" },
        { 0x33, "ssbb" },
        { 0x34, "ssbb" },
        { 0x35, "ssbbb" },
        { 0x36, "sfffffffbb" },
        { 0x37, "s" },
        { 0x38, "sb" },
        { 0x39, "sbbH" },
        { 0x3A, "sbb" },
        { 0x3B, "sshhhffffffff" },
        { 0x3C, "s" },
        { 0x3D, "h" },
        { 0x3E, "" },
        { 0x3F, "S" },
        { 0x40, "ssb" },
        { 0x41, "sb" },
        { 0x42, "sh" },
        { 0x43, "s" },
        { 0x44, "ssb" },
        { 0x45, "shffff" },
        { 0x46, "shbffff" },
        { 0x47, "sshbbfffffhf" },
        { 0x48, "sshbbs" },
        { 0x49, "sss" },
        { 0x4A, "ss" },
        { 0x4B, "shhffff" },
        { 0x4C, "shhbffff" },
        { 0x4D, "sshhbbfffffhf" },
        { 0x4E, "sshhbbs" },
        { 0x4F, "sshs" },
        { 0x50, "ssh" },
        { 0x51, "sshfb" },
        { 0x52, "ssfhfbs" },
        { 0x53, "ss" },
        { 0x54, "sss" },
        { 0x55, "ss" },
        { 0x56, "sbhfffffffffffbffffbhshssf" },
        { 0x57, "sh" },
        { 0x58, "ss" },
        { 0x59, "ssh" },
        { 0x5A, "sH" },
        { 0x5B, "shb" },
        { 0x5C, "s" },
        { 0x5D, "ssb" },
        { 0x5E, "sff" },
        { 0x5F, "s" },
        { 0x60, "hhhh" },
        { 0x61, "bffff" },
        { 0x62, "s" },
        { 0x63, "sb" },
        { 0x64, "b" },
        { 0x65, "hbffbs" },
        { 0x66, "s" },
        { 0x67, "bbhfffffb" },
        { 0x68, "b" },
        { 0x69, "sbbfffffhf" },
        { 0x6A, "shbbs" },
        { 0x6B, "ss" },
        { 0x6C, "sff" },
        { 0x6E, "ss" },
        { 0x6F, "s" },
        { 0x70, "sh" },
        { 0x71, "" },
        { 0x72, "shhs" },
        { 0x73, "ssh" },
        { 0x74, "ss" },
        { 0x75, "ss" },
        { 0x78, "ssbbb" },
        { 0x79, "ssf" },
        { 0x7A, "ssfbbs" },
        { 0x7B, "ss" },
        { 0x7C, "ssf" },
        { 0x7D, "sf" },
        { 0x7E, "s" },
        { 0x7F, "sfffff" },
        { 0x80, "s" },
        { 0x81, "sbsffb" },
        { 0x82, "ssf" },
        { 0x83, "ssff" },
        { 0x84, "sssfhf" },
        { 0x85, "ssbf" },
        { 0x86, "sfff" },
        { 0x87, "sf" },
        { 0x88, "sssfhf" },
        { 0x8C, "sssbb" },
        { 0x8D, "issbbs" },
        { 0x8E, "issbbs" },
        { 0x8F, "ss" },
        { 0x90, "s" },
        { 0x96, "hffff" },
        { 0x97, "hbffff" },
        { 0x98, "shbbfffffhf" },
        { 0x99, "shbbs" },
        { 0x9A, "" },
        { 0x9B, "s" },
        { 0x9C, "ss" },
        { 0x9D, "s" },
        { 0x9E, "sb" },
        { 0x9F, "sb" },
        { 0xC8, "" },
        { 0xC9, "sshhhh" },
        { 0xCA, "ss" },
        { 0xCB, "sbb" },
        { 0xCC, "" },
        { 0xCD, "sssssfb" },
        { 0xCE, "b" },
        { 0xCF, "ssf" },
        { 0xD0, "sh" },
        { 0xD1, "sh" },
        { 0xD2, "s" },
        { 0xD3, "s" },
        { 0xD4, "shh" },
        { 0xE6, "ii" },
        { 0xE7, "" },
        { 0xE8, "" },
        { 0xF0, "b" },
        { 0xF8, "" },
        { 0xF9, "bs" },
        { 0xFA, "" },
        { 0xFB, "b" },
        { 0xFC, "h" },
        { 0xFD, "" },
        { 0xFE, "s" },
        { 0xFF, "" }
    };

    // template3 but with 0x84 changed
    private static readonly Dictionary<byte, string> templates4= new() {
        { 0x00, "" },
        { 0x01, "bhfaa" },  // Conditional jmp
        { 0x02, "a" },      // Unconditional jmp
        { 0x04, "s" },
        { 0x05, "" },
        { 0x06, "a" },      // Unconditional jmp
        { 0x07, "s" },
        { 0x08, "b" },
        { 0x09, "bhf" },
        { 0x0A, "hf" },
        { 0x0B, "hb" },
        { 0x0C, "hbH" },
        { 0x0D, "hhf" },
        { 0x0E, "hhb" },
        { 0x0F, "b" },      // Choice screen
        { 0x11, "sbf" },
        { 0x12, "sbs" },
        { 0x13, "" },
        { 0x14, "issb" },   // Message
        { 0x15, "sb" },     // Character name
        { 0x16, "bb" },
        { 0x17, "" },
        { 0x18, "bs" },
        { 0x19, "" },
        { 0x1A, "s" },
        { 0x1B, "b" },
        { 0x1C, "sshb" },
        { 0x1D, "h" },
        { 0x1E, "ssffhhbf" },
        { 0x1F, "sf" },
        { 0x20, "sfh" },
        { 0x21, "shhh" },
        { 0x22, "sb" },
        { 0x28, "ssffhhbhhbf" },
        { 0x29, "sf" },
        { 0x2A, "sfh" },
        { 0x2B, "s" },
        { 0x2C, "s" },
        { 0x2D, "sb" },
        { 0x2E, "" },
        { 0x2F, "shf" },
        { 0x32, "s" },
        { 0x33, "ssbb" },
        { 0x34, "ssbb" },
        { 0x35, "ssbbb" },
        { 0x36, "sfffffffbb" },
        { 0x37, "s" },
        { 0x38, "sb" },
        { 0x39, "sbbH" },
        { 0x3A, "sbb" },
        { 0x3B, "sshhhffffffff" },
        { 0x3C, "s" },
        { 0x3D, "h" },
        { 0x3E, "" },
        { 0x3F, "S" },
        { 0x40, "ssb" },
        { 0x41, "sb" },
        { 0x42, "sh" },
        { 0x43, "s" },
        { 0x44, "ssb" },
        { 0x45, "shffff" },
        { 0x46, "shbffff" },
        { 0x47, "sshbbfffffhf" },
        { 0x48, "sshbbs" },
        { 0x49, "sss" },
        { 0x4A, "ss" },
        { 0x4B, "shhffff" },
        { 0x4C, "shhbffff" },
        { 0x4D, "sshhbbfffffhf" },
        { 0x4E, "sshhbbs" },
        { 0x4F, "sshs" },
        { 0x50, "ssh" },
        { 0x51, "sshfb" },
        { 0x52, "ssfhfbs" },
        { 0x53, "ss" },
        { 0x54, "sss" },
        { 0x55, "ss" },
        { 0x56, "sbhfffffffffffbffffbhshssf" },
        { 0x57, "sh" },
        { 0x58, "ss" },
        { 0x59, "ssh" },
        { 0x5A, "sH" },
        { 0x5B, "shb" },
        { 0x5C, "s" },
        { 0x5D, "ssb" },
        { 0x5E, "sff" },
        { 0x5F, "s" },
        { 0x60, "hhhh" },
        { 0x61, "bffff" },
        { 0x62, "s" },
        { 0x63, "sb" },
        { 0x64, "b" },
        { 0x65, "hbffbs" },
        { 0x66, "s" },
        { 0x67, "bbhfffffb" },
        { 0x68, "b" },
        { 0x69, "sbbfffffhf" },
        { 0x6A, "shbbs" },
        { 0x6B, "ss" },
        { 0x6C, "sff" },
        { 0x6E, "ss" },
        { 0x6F, "s" },
        { 0x70, "sh" },
        { 0x71, "" },
        { 0x72, "shhs" },
        { 0x73, "ssh" },
        { 0x74, "ss" },
        { 0x75, "ss" },
        { 0x78, "ssbbb" },
        { 0x79, "ssf" },
        { 0x7A, "ssfbbs" },
        { 0x7B, "ss" },
        { 0x7C, "ssf" },
        { 0x7D, "sf" },
        { 0x7E, "s" },
        { 0x7F, "sfffff" },
        { 0x80, "s" },
        { 0x81, "sbsffb" },
        { 0x82, "ssf" },
        { 0x83, "ssff" },
        { 0x84, "sssf" },
        { 0x85, "ssbf" },
        { 0x86, "sfff" },
        { 0x87, "sf" },
        { 0x88, "sssfhf" },
        { 0x8C, "sssbb" },
        { 0x8D, "issbbs" },
        { 0x8E, "issbbs" },
        { 0x8F, "ss" },
        { 0x90, "s" },
        { 0x96, "hffff" },
        { 0x97, "hbffff" },
        { 0x98, "shbbfffffhf" },
        { 0x99, "shbbs" },
        { 0x9A, "" },
        { 0x9B, "s" },
        { 0x9C, "ss" },
        { 0x9D, "s" },
        { 0x9E, "sb" },
        { 0x9F, "sb" },
        { 0xC8, "" },
        { 0xC9, "sshhhh" },
        { 0xCA, "ss" },
        { 0xCB, "sbb" },
        { 0xCC, "" },
        { 0xCD, "sssssfb" },
        { 0xCE, "b" },
        { 0xCF, "ssf" },
        { 0xD0, "sh" },
        { 0xD1, "sh" },
        { 0xD2, "s" },
        { 0xD3, "s" },
        { 0xD4, "shh" },
        { 0xE6, "ii" },
        { 0xE7, "" },
        { 0xE8, "" },
        { 0xF0, "b" },
        { 0xF8, "" },
        { 0xF9, "bs" },
        { 0xFA, "" },
        { 0xFB, "b" },
        { 0xFC, "h" },
        { 0xFD, "" },
        { 0xFE, "s" },
        { 0xFF, "" }
    };
}