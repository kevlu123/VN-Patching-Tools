namespace Ws2Explorer.Compiler.Opcodes;

public class Op06_Jump2 : Jump {
    public override byte OpcodeNumber => 0x06;
    public override IOpcode Clone() => new Op06_Jump2 {
        Pointer = Pointer,
        Labels = Labels.ToArray(),
    };
}
