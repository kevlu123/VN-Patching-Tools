namespace Ws2Explorer.Compiler.Opcodes;

public class Op02_Jump1 : Jump {
    public override byte OpcodeNumber => 0x02;
    public override IOpcode Clone() => new Op02_Jump1 {
        Pointer = Pointer,
        Labels = Labels.ToArray(),
    };
}
